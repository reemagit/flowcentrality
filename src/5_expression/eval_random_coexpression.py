

"""
Module Docstring
"""

__author__ = "Enrico Maiorino"
__version__ = "0.1.0"
__license__ = "MIT"

import argparse
import logging
import sys
sys.path.append('../')
from funcs import utils
import networkx as nx
import random
import pandas as pd
import numpy as np
from tqdm.autonotebook import trange

parser = argparse.ArgumentParser(description='Extract random paths between source and destination nodes, with destination nodes being genes associated to disease_id in gda file')
parser.add_argument('srcnodes_file', type=str, help='Source nodes IDs in one column')
parser.add_argument('gda_file', type=str, help='Gene-disease association file')
parser.add_argument('expr_file', type=str, help='Filename of expression file')
parser.add_argument('gsm_file', type=str, help='Filename of GSM IDs to consider')
parser.add_argument('net_path', type=str, default=None, help='Network filepath')
parser.add_argument('disease_id', type=str, help='diseaseId to consider as destination in gda file')
parser.add_argument('out_seqcorr_file', type=str, help='Output directory of sequential correlation files')
parser.add_argument('-s','--spearman', action='store_true', help='Whether to use Spearman correlation')
parser.add_argument('--N_samples', type=int, default=500, help='Number of random paths to extract')
parser.add_argument('--N_cores', type=int, default=1, help='Number of cores')
parser.add_argument('--seed', type=int, default=100, help='Random seed')
args = parser.parse_args()

logging.basicConfig(level=logging.INFO,
                    format='%(module)s:%(levelname)s:%(asctime)s:%(message)s',
                    handlers=[logging.FileHandler("../logs/report.log"),
                              logging.StreamHandler()])
logging.info(args)
random.seed(args.seed)
srcnodes = utils.read_gene_list(args.srcnodes_file)
gda = pd.read_csv(args.gda_file,sep='\t')
expr = utils.read_expr(args.expr_file)
gsm = utils.read_text(args.gsm_file)
net = utils.read_network(args.net_path)

expr = expr[gsm]
destnodes = gda[gda.diseaseId==args.disease_id].geneId.unique().tolist()

logging.info("Number of nodes: {}".format(len(destnodes)))

def get_abscorr(i, j, corrdata):
    method = 'pearson' if not args.spearman else 'spearman'
    corrmatr = corrdata.loc[[i, j]].T.corr(method)
    return corrmatr.abs().groupby('ENTREZ_GENE_ID').apply(lambda x: x.max()).T.groupby('ENTREZ_GENE_ID').apply(lambda x: x.max()).values[0, 1]

def get_seq_corr(path):
    if not np.all([gene in expr.index.tolist() for gene in path]):
        return np.nan
    return np.mean([get_abscorr(path[i], path[i + 1], expr) for i in range(len(path) - 1)])

def get_random_coexpr(i):
    src = random.choice(srcnodes)
    dest = random.choice(destnodes)
    path = random.choice(list(nx.all_shortest_paths(net, src, dest)))
    return get_seq_corr(path)

if args.N_cores > 1:
    seqs = utils.parallel_process(get_random_coexpr, range(args.N_samples), n_jobs=args.N_cores)
else:
    seqs = []
    for i in trange(args.N_samples):
        seqs.append(get_random_coexpr(i))

np.savetxt(args.out_seqcorr_file, seqs)
#!/usr/bin/env python3
"""
Generate random DIAMOND modules
"""

__author__ = "Enrico Maiorino"
__version__ = "0.1.0"
__license__ = "MIT"

import argparse
import logging
from funcs import utils
from libs.DIAMOnD import DIAMOnD
from libs.Flower import deg_preserve_generator as gen
from p_tqdm import p_map

parser = argparse.ArgumentParser(description='Generate random DIAMOND samples')
parser.add_argument('in_genes_path', type=str, help='Filepath of input seed genes file')
parser.add_argument('in_module_path', type=str, help='Filepath of gene module file')
parser.add_argument('net_path', type=str, default=None, help='Network filepath')
parser.add_argument('out_samples_path', type=str, help='Filepath of output random diamond modules file')
parser.add_argument('--N_samples', type=int, default=1000, help='Number of samples')
parser.add_argument('--N_cores', type=int, default=None, help='Number of cores for parallel execution (default: all cores)')
parser.add_argument('--N_per_bin', type=int, default=30, help='Minimum number of nodes per degree bin')
parser.add_argument('--alpha', type=int, default=1, help='Alpha parameter of DIAMOnD')
parser.add_argument('--rdmseed', type=int, default=None, help='RNG seed')

args = parser.parse_args()

logging.basicConfig(level=logging.INFO,
                        format='%(module)s:%(levelname)s:%(asctime)s:%(message)s',
                            handlers=[logging.FileHandler("../logs/report.log"),logging.StreamHandler()])
logging.info(args)

genes = utils.read_gene_list(args.in_genes_path)
mod = utils.read_gene_list(args.in_module_path)
net = utils.read_network(args.net_path)

rdmseeds = gen.gen_degree_preserved_sets(genes, net, args.N_samples, args.N_per_bin,rdmseed=args.rdmseed)

def wrap(pack):
    rdmset, N_mod, net, alpha = pack
    return rdmset + [gene[0] for gene in DIAMOnD.DIAMOnD(net, rdmset, N_mod - len(rdmset), alpha,progress_bar=False)]


samples = utils.parallel_process(wrap, utils.pack_variables(rdmseeds, len(mod), net, args.alpha), n_jobs=args.N_cores)

utils.write_genesets_list(args.out_samples_path, samples)






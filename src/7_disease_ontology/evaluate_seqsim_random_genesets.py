

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
from tqdm.autonotebook import tqdm,trange
import networkx as nx
import numpy as np
import random
from libs.Flower import deg_preserve_generator as gen
from goatools import obo_parser
from goatools.associations import read_ncbi_gene2go
from goatools.semantic import TermCounts, get_info_content
from goatools.semantic import resnik_sim, lin_sim
from os.path import dirname


parser = argparse.ArgumentParser(description='Evaluate sequential similarity for randomization of source and destination diseases')
parser.add_argument('srcnodes_file', type=str, help='Source nodes IDs in one column')
parser.add_argument('destnodes_file', type=str, help='Destination nodes IDs in one column')
parser.add_argument('net_path', type=str, default=None, help='Network filepath')
parser.add_argument('flows_file', type=str, help='Flow centrality table')
parser.add_argument('obo_file', type=str, help='Filename of OBO file')
parser.add_argument('gene2go_file', type=str, help='Filename of gene2go file')
parser.add_argument('out_seqsims', type=str, help='Output filepath of sequential similarities')
parser.add_argument('--fc_thresh', type=float, default=2, help='Flow centrality threshold')
parser.add_argument('--npath_thresh', type=int, default=1, help='Number of paths threshold')
parser.add_argument('--N_samples', type=int, default=100, help='Number of samples')
parser.add_argument('--N_cores', type=int, default=1, help='Number of cores')
parser.add_argument('--seed', type=int, default=100, help='Random seed')
args = parser.parse_args()

logging.basicConfig(level=logging.INFO,
                    format='%(module)s:%(levelname)s:%(asctime)s:%(message)s',
                    handlers=[logging.FileHandler("../logs/report.log"),
                              logging.StreamHandler()])
logging.info(args)
random.seed(args.seed)
net = utils.read_network(args.net_path)
srcnodes = utils.read_gene_list(args.srcnodes_file)
destnodes = utils.read_gene_list(args.destnodes_file)

srcnodes_samples = gen.gen_degree_preserved_sets(srcnodes, net, n_samples=args.N_samples, rdmseed=args.seed)
destnodes_samples = gen.gen_degree_preserved_sets(destnodes, net, n_samples=args.N_samples, rdmseed=args.seed)

flows = utils.read_flows(args.flows_file)
fcnodes = flows[(flows.FCS >= args.fc_thresh) & (flows.N_paths >= args.npath_thresh)].index.tolist()

logging.info('Num of FC nodes: {}'.format(len(fcnodes)))

seqsims = []
for srcnodes_sample,destnodes_sample in zip(srcnodes_samples,destnodes_samples):
    all_paths = []
    for src_gene in tqdm(srcnodes_sample):
        def get_sps(dest_gene):
            return list(nx.all_shortest_paths(net, src_gene, dest_gene))
        all_paths = all_paths + sum(utils.parallel_process(get_sps, destnodes_sample, n_jobs=args.N_cores),[])

    logging.info('Num of all paths: {}'.format(len(all_paths)))

    fc_paths = []
    for i in trange(len(all_paths)):
        fullpath = all_paths[i]
        if len(fullpath) > 2:
            path = all_paths[i][1:-1]
            if np.all([node in fcnodes for node in path]):
                fc_paths.append(fullpath)

    logging.info('Num of FC paths: {}'.format(len(fc_paths)))

    go = obo_parser.GODag(args.obo_file)
    gene2go = read_ncbi_gene2go(args.gene2go_file, taxids=[9606])
    termcounts = TermCounts(go, gene2go)

    def get_sim(genes_pair):
        # sim_measure = lin_sim
        i,j = genes_pair[0],genes_pair[1]
        i_go = [goterm for goterm in gene2go[i] if goterm in go]
        j_go = [goterm for goterm in gene2go[j] if goterm in go]
        sims = []
        for i_go_term in i_go:
            def wrap(j_go_term):
                return resnik_sim(i_go_term, j_go_term, go, termcounts)
            simlist = [sim for sim in map(wrap, j_go) if sim is not None]
            if len(simlist):
                sims.append(max(simlist))
        for j_go_term in j_go:
            def wrap(i_go_term):
                return resnik_sim(i_go_term, j_go_term, go, termcounts)
            simlist = [sim for sim in map(wrap, i_go) if sim is not None]
            if len(simlist):
                sims.append(max(simlist))
        return np.mean(sims)

    def get_path_sim(path):
        if np.all([gene in gene2go.keys() for gene in path]):
            sims = []
            for i in range(len(path)-1):
                sims.append(get_sim([path[i],path[i+1]]))
            return np.mean(sims)
        else:
            return np.nan

    if args.N_cores > 1:
        sims = utils.parallel_process(get_path_sim, fc_paths, n_jobs=args.N_cores)
    else:
        sims = []
        for path in fc_paths:
            sims.append(get_path_sim(path))
        #sims = list(map(get_path_sim, tqdm(paths)))
    sims = np.asarray(sims)
    sims = sims[~np.isnan(sims)].tolist()
    seqsims.append(sims)

utils.write_nonrectangular(args.out_seqsims, seqsims)
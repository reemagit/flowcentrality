

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


parser = argparse.ArgumentParser(description='Evaluate paths, FC paths and random paths type A,B between source and destination nodes')
parser.add_argument('srcnodes_file', type=str, help='Source nodes IDs in one column')
parser.add_argument('destnodes_file', type=str, help='Destination nodes IDs in one column')
parser.add_argument('net_path', type=str, default=None, help='Network filepath')
parser.add_argument('flows_file', type=str, help='Flow centrality table')
parser.add_argument('out_fcpaths', type=str, help='Output filepath of FC paths between srcnodes and destnodes')
parser.add_argument('--fc_thresh', type=float, default=2, help='Flow centrality threshold')
parser.add_argument('--npath_thresh', type=int, default=1, help='Number of paths threshold')
parser.add_argument('--N_cores', type=int, default=1, help='Number of cores')
args = parser.parse_args()

logging.basicConfig(level=logging.INFO,
                    format='%(module)s:%(levelname)s:%(asctime)s:%(message)s',
                    handlers=[logging.FileHandler("../logs/report.log"),
                              logging.StreamHandler()])
logging.info(args)
net = utils.read_network(args.net_path)
srcnodes = utils.read_gene_list(args.srcnodes_file)
destnodes = utils.read_gene_list(args.destnodes_file)

flows = utils.read_flows(args.flows_file)
fcnodes = flows[(flows.FCS >= args.fc_thresh) & (flows.N_paths >= args.npath_thresh)].index.tolist()

logging.info('Num of FC nodes: {}'.format(len(fcnodes)))


all_paths = []
for src_gene in tqdm(srcnodes):
    def get_sps(dest_gene):
        return list(nx.all_shortest_paths(net, src_gene, dest_gene))
    all_paths = all_paths + sum(utils.parallel_process(get_sps, destnodes, n_jobs=args.N_cores),[])

logging.info('Num of all paths: {}'.format(len(all_paths)))

fc_paths = []
for i in trange(len(all_paths)):
    fullpath = all_paths[i]
    if len(fullpath) > 2:
        path = all_paths[i][1:-1]
        if np.all([node in fcnodes for node in path]):
            fc_paths.append(fullpath)

logging.info('Num of FC paths: {}'.format(len(fc_paths)))

utils.write_paths(args.out_fcpaths, fc_paths)

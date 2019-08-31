#!/usr/bin/env python3
"""
Eval other betweenness measures
"""

__author__ = "Enrico Maiorino"
__version__ = "0.1.0"
__license__ = "MIT"

import argparse
import logging
from funcs import utils
import networkx as nx
import pandas as pd
from time import time

parser = argparse.ArgumentParser()
parser.add_argument('in_net_path', type=str, default=None, help='Network filepath')
parser.add_argument('measure', choices=['degree', 'betweenness', 'current', 'communicability'])
parser.add_argument('out_path', type=str, default=None, help='Output file path')
args = parser.parse_args()

logging.basicConfig(level=logging.INFO,
                        format='%(module)s:%(levelname)s:%(asctime)s:%(message)s',
                            handlers=[logging.FileHandler("../logs/report.log"),logging.StreamHandler()])
logging.info(args)

net = utils.read_network(args.in_net_path)

t0 = time()

print('Calculating...')

if args.measure == 'degree':
    cent = nx.degree_centrality(net)
elif args.measure == 'betweenness':
    cent = nx.betweenness_centrality(net)
elif args.measure == 'current':
    cent = nx.approximate_current_flow_betweenness_centrality(net,solver='lu')
elif args.measure == 'communicability':
    cent = nx.communicability_betweenness_centrality(net)

logging.info('Completed calculating measure {}. Time: {}'.format(args.measure, time()-t0))

cent_df = pd.DataFrame(list(cent.items()), columns=['entrez',args.measure])

cent_df.to_csv(args.out_path, sep='\t',index=False)
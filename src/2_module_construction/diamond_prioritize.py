#!/usr/bin/env python3
"""
Prioritize with DIAMOND
"""

__author__ = "Enrico Maiorino"
__version__ = "0.1.0"
__license__ = "MIT"

import argparse
import logging
from funcs import utils
from libs.DIAMOnD import DIAMOnD

def main(args):
    logging.basicConfig(level=logging.INFO,
                        format='%(module)s:%(levelname)s:%(asctime)s:%(message)s',
                            handlers=[logging.FileHandler("../logs/report.log"),logging.StreamHandler()])
    logging.info(args)

    genes = utils.read_gene_list(args.in_genes_path)
    net = utils.read_network(args.net_path)

    diamond_genes = DIAMOnD.DIAMOnD(net, genes, args.N, args.alpha)

    utils.write_gene_list(args.out_diamond_path, [gene[0] for gene in diamond_genes])

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('in_genes_path', type=str, help='Filepath of input seed genes file')
    parser.add_argument('net_path', type=str, default=None, help='Network filepath')
    parser.add_argument('out_diamond_path', type=str, help='Filepath of output diamond genes file')
    parser.add_argument('--N', type=int, default=1000, help='Max number of iterations')
    parser.add_argument('--alpha', type=int, default=1, help='Alpha parameter of DIAMOnD')
    args = parser.parse_args()

    main(args)
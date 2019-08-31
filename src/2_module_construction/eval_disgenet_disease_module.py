#!/usr/bin/env python3
"""
Process raw DisGeNet data
"""

__author__ = "Enrico Maiorino"
__version__ = "0.1.0"
__license__ = "MIT"

import argparse
import logging
from funcs import utils
import pandas as pd
from libs.DIAMOnD import DIAMOnD

def main(args):
    logging.basicConfig(level=logging.INFO,
                        format='%(module)s:%(levelname)s:%(asctime)s:%(message)s',
                            handlers=[logging.FileHandler("../logs/report.log"),logging.StreamHandler()])
    logging.info(args)


    gda = pd.read_csv(args.in_gda_path, sep='\t')
    net = utils.read_network(args.in_net_path)

    seeds = gda[gda.diseaseId == args.disease_id].geneId.tolist()

    logging.info("Seed size: {}, DIAMOND iterations: {}".format(len(seeds), args.module_size-len(seeds)))
    diamond_genes = [gene[0] for gene in DIAMOnD.DIAMOnD(net, seeds, args.module_size-len(seeds), args.alpha)]
    utils.write_gene_list(args.out_module_file, seeds+diamond_genes)

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('in_gda_path', type=str, help='Filepath of DisGeNet gene-disease associations file')
    parser.add_argument('in_net_path', type=str, default=None, help='Network filepath')
    parser.add_argument('disease_id', type=str, help='Disease CUI ID')
    parser.add_argument('module_size', type=int,help='Final size of module (seed + DIAMOND module construction)')
    parser.add_argument('out_module_file', type=str, help='Output filepath of module file')
    parser.add_argument('--alpha', type=int, default=1, help='Alpha parameter of DIAMOnD')
    args = parser.parse_args()
    main(args)
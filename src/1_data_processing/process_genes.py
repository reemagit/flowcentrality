#!/usr/bin/env python3
"""
Process raw data to get list of seed genes for asthma and COPD
"""

__author__ = "Enrico Maiorino"
__version__ = "0.1.0"
__license__ = "MIT"

import argparse
import logging
from funcs import utils

def main(args):
    logging.basicConfig(level=logging.INFO,
                        format='%(module)s:%(levelname)s:%(asctime)s:%(message)s',
                            handlers=[logging.FileHandler("../logs/report.log"),logging.StreamHandler()])
    logging.info(args)

    genes = utils.read_gene_list(args.in_genes_path)
    if args.from_symbols:
        utils.gm.enable_agreement_check()
        entrez = utils.gm.symb2entrez(genes)
        for s, e in zip(genes, entrez):
            print('{} -> {}'.format(s, e))
        if len(utils.gm.errors):
            logging.info('Num. of original genes: {}'.format(len(genes)))
            if len(utils.gm.get_failed_queries()) > 0:
                logging.error('Num. of gene names that could not be translated: {}'.format(len(utils.gm.get_failed_queries())))
            print(utils.gm.errors)
    else:
        entrez = genes
    if args.net_path is not None:
        net = utils.read_network(args.net_path)
        entrez = [gene for gene in entrez if gene in net and gene != -1]
        logging.info('Num. of mapped genes: {}'.format(len(entrez)))

    utils.write_gene_list(args.out_genes_path, entrez)

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('in_genes_path', type=str, help='Filepath of input genes file')
    parser.add_argument('out_genes_path', type=str, help='Filepath of output genes file')
    parser.add_argument('--net_path', type=str, default=None, help='Network filepath (if filtering on network nodes is needed)')
    parser.add_argument('--from_symbols', action='store_true', help='Whether the input file are gene symbols (will be converted to entrez)')
    args = parser.parse_args()


    main(args)
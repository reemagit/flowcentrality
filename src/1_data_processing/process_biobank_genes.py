#!/usr/bin/env python3
"""
Process raw data of Global Biobank Engine
"""

__author__ = "Enrico Maiorino"
__version__ = "0.1.0"
__license__ = "MIT"

import argparse
import logging
from funcs import utils
import pandas as pd
from tqdm import tqdm

def wrap(row):
    if row[0] == row[0]: # just to check if row is not NaN
        pval = row[1]
        generow = str(row[0].encode('ascii', 'ignore').decode('ascii')).replace(" ","").rstrip(',')
        genes = generow.split(",")
        return [[utils.gm.symb2entrez(gene),pval] for gene in genes if gene != -1]

def main(args):
    logging.basicConfig(level=logging.INFO,
                        format='%(module)s:%(levelname)s:%(asctime)s:%(message)s',
                            handlers=[logging.FileHandler("../logs/report.log"),logging.StreamHandler()])
    logging.info(args)

    data_raw = pd.read_excel(args.in_data_path)
    row_values = data_raw[['Gene symbol', 'P-value']].values
    rows = utils.parallel_process(wrap, row_values, n_jobs=args.N_cores)
    rows = [elem for elem in rows if elem is not None]
    genes = pd.DataFrame([val for row in rows for val in row if val[0] != -1], columns=['EntrezID', 'P-value'])
    genes_unique = genes.sort_values('P-value')
    genes_unique.drop_duplicates('EntrezID', inplace=True)
    genes_list = genes_unique.EntrezID.tolist()
    logging.info('Num. of mapped genes: {}'.format(len(genes_list)))

    utils.write_gene_list(args.out_genes_path, genes_list)

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('in_data_path', type=str, help='Filepath of raw data file')
    parser.add_argument('out_genes_path', type=str, help='Filepath of output genes file')
    parser.add_argument('--N_cores', type=int, default=1, help='Number of cores for parallel execution')
    args = parser.parse_args()


    main(args)
#!/usr/bin/env python3
"""
Generate random DIAMOND modules
"""

__author__ = "Enrico Maiorino"
__version__ = "0.1.0"
__license__ = "MIT"

import logging
import GEOparse
import argparse
from funcs import utils
from os.path import join
import pandas as pd
import numpy as np

def main(args):
    logging.basicConfig(level=logging.INFO,
                        format='%(module)s:%(levelname)s:%(asctime)s:%(message)s',
                            handlers=[logging.FileHandler("../logs/report.log")])
    logging.info(args)

    utils.create_dir_if_not_exist(args.out_expr_dir)
    utils.create_dir_if_not_exist(join(args.out_expr_dir,'raw'))
    utils.create_dir_if_not_exist(join(args.out_expr_dir,'processed'))
    gse = GEOparse.get_GEO(geo='GSE22148', destdir=join(args.out_expr_dir,'raw'))
    annotated = gse.pivot_and_annotate('VALUE',gse.gpls['GPL570'],'ENTREZ_GENE_ID')
    annotated2 = annotated[~pd.isnull(annotated.ENTREZ_GENE_ID)]
    annotated2['ENTREZ_GENE_ID'] = annotated2.ENTREZ_GENE_ID.str.split('///').str[0].astype(int)
    annotated2 = annotated2.set_index('ENTREZ_GENE_ID')
    annotated2[annotated2 <= 0] = 0.1
    annotated2 = np.log(annotated2)
    disease_cls = list(set([gse.gsms[gsm].metadata['characteristics_ch1'][2] for gsm in gse.gsms])) # all GSMs are COPD patients
    logging.info(disease_cls)
    disease_gsm = [gsm for gsm in gse.gsms if gse.gsms[gsm].metadata['characteristics_ch1'][2] in disease_cls]
    logging.info("Disease GSM: {}".format(len(disease_gsm)))
    utils.create_dir_if_not_exist(args.out_expr_dir)
    utils.write_expr(join(args.out_expr_dir,'processed','expr.tsv'), annotated2)
    utils.write_text(join(args.out_expr_dir,'processed','disease_gsms.txt'), disease_gsm)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Process GSE22148')
    parser.add_argument('out_expr_dir', type=str, help='Output directory for expression data file and GSM lists')
    args = parser.parse_args()

    main(args)
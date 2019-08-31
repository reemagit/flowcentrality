#!/usr/bin/env python3
"""
Generate GSE18965
"""

__author__ = "Enrico Maiorino"
__version__ = "0.1.0"
__license__ = "MIT"

import logging
import GEOparse
import argparse
import pandas as pd
from funcs import utils
from os.path import join
import numpy as np


#def append_postfix(filename,postfix):
#    return "{0}_{2}.{1}".format(*filename.rsplit('.', 1) + postfix)

def main(args):
    logging.basicConfig(level=logging.INFO,
                        format='%(module)s:%(levelname)s:%(asctime)s:%(message)s',
                            handlers=[logging.FileHandler("../logs/report.log")])
    logging.info(args)

    utils.create_dir_if_not_exist(args.out_expr_dir)
    utils.create_dir_if_not_exist(join(args.out_expr_dir,'raw'))
    utils.create_dir_if_not_exist(join(args.out_expr_dir,'processed'))

    gse = GEOparse.get_GEO(geo='GSE18965', destdir=join(args.out_expr_dir,'raw'))

    annotated = gse.pivot_and_annotate('VALUE', gse.gpls['GPL96'], 'ENTREZ_GENE_ID')
    annotated2 = annotated[~pd.isnull(annotated.ENTREZ_GENE_ID)]
    annotated2 = annotated2.loc[~annotated2.isnull().values.all(axis=1)]
    annotated2['ENTREZ_GENE_ID'] = annotated2.ENTREZ_GENE_ID.str.split('///').str[0].astype(int)
    annotated2 = annotated2.set_index('ENTREZ_GENE_ID')
    disease_cls = [gse.gsms[gsm].metadata['title'][0] for gsm in gse.gsms if 'AA' in gse.gsms[gsm].metadata['title'][0]]
    healthy_cls = [gse.gsms[gsm].metadata['title'][0] for gsm in gse.gsms if 'HN' in gse.gsms[gsm].metadata['title'][0]]
    logging.info(disease_cls)
    logging.info(healthy_cls)
    disease_gsm = [gsm for gsm in gse.gsms if gse.gsms[gsm].metadata['title'][0] in disease_cls]
    healthy_gsm = [gsm for gsm in gse.gsms if gse.gsms[gsm].metadata['title'][0] in healthy_cls]
    logging.info("Disease GSM: {}, Healthy GSM: {}".format(len(disease_gsm), len(healthy_gsm)))
    utils.create_dir_if_not_exist(args.out_expr_dir)
    utils.write_expr(join(args.out_expr_dir, 'processed', 'expr.tsv'), annotated2)
    utils.write_text(join(args.out_expr_dir, 'processed', 'disease_gsms.txt'), disease_gsm)
    utils.write_text(join(args.out_expr_dir, 'processed', 'healthy_gsms.txt'), healthy_gsm)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Process GSE18965')
    parser.add_argument('out_expr_dir', type=str, help='Output directory for expression data file and GSM lists')
    args = parser.parse_args()
    main(args)
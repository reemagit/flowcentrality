#!/usr/bin/env python3
"""
Generate GSE473
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


def main(args):
    logging.basicConfig(level=logging.INFO,
                        format='%(module)s:%(levelname)s:%(asctime)s:%(message)s',
                            handlers=[logging.FileHandler("../logs/report.log")])
    logging.info(args)

    utils.create_dir_if_not_exist(args.out_expr_dir)
    utils.create_dir_if_not_exist(join(args.out_expr_dir,'raw'))
    utils.create_dir_if_not_exist(join(args.out_expr_dir,'processed'))

    gse = GEOparse.get_GEO(geo='GSE473', destdir=join(args.out_expr_dir,'raw'))
    annotated = gse.pivot_and_annotate('VALUE', gse.gpls['GPL96'], 'ENTREZ_GENE_ID')
    gsm96 = [gsm for gsm in gse.gsms if gse.gsms[gsm].metadata['platform_id'][0] == 'GPL96']  # we choose only GPL96 platform
    annotated2 = annotated[gsm96 + ['ENTREZ_GENE_ID']]
    print(annotated2.shape)
    annotated2 = annotated2[~pd.isnull(annotated2.ENTREZ_GENE_ID)]
    print(annotated2.shape)
    annotated2 = annotated2.loc[~annotated2.isnull().values.any(axis=1)]
    print(annotated2.shape)
    annotated2['ENTREZ_GENE_ID'] = annotated2.ENTREZ_GENE_ID.str.split('///').str[0].astype(int)
    annotated2 = annotated2.set_index('ENTREZ_GENE_ID')
    annotated2 = np.log(annotated2)
    #{'astM_atop', 'astM_nonatop', 'astS_atop', 'ctr_atop', 'ctr_nonatop'}
    classes = {}
    classes['asthma_med_nonatop'] = ['astM_nonatop']
    classes['control_nonatop'] = ['ctr_nonatop']

    logging.info(classes)
    gsms = {cls: [gsm for gsm in gsm96 if classes[cls][0] in gse.gsms[gsm].metadata['title'][0]] for cls in classes}

    logging.info(' '.join(['{} GSM:{}'.format(cls, len(gsms[cls])) for cls in classes]))
    utils.create_dir_if_not_exist(args.out_expr_dir)
    utils.write_expr(join(args.out_expr_dir, 'processed', 'expr.tsv'), annotated2)
    for cls in classes:
        utils.write_text(join(args.out_expr_dir, 'processed', '{}_gsms.txt'.format(cls)), gsms[cls])

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Process GSE473')
    parser.add_argument('out_expr_dir', type=str, help='Output directory for expression data file and GSM lists')
    args = parser.parse_args()
    main(args)
#!/usr/bin/env python3
"""
Generate GSE16972
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

    gse = GEOparse.get_GEO(geo='GSE16972', destdir=join(args.out_expr_dir,'raw'))
    annotated = gse.pivot_and_annotate('VALUE', gse.gpls['GPL96'], 'ENTREZ_GENE_ID')
    print(annotated.shape)
    annotated2 = annotated[~pd.isnull(annotated.ENTREZ_GENE_ID)]
    print(annotated2.shape)
    annotated2 = annotated2.loc[~annotated2.isnull().values.any(axis=1)]
    print(annotated2.shape)
    annotated2['ENTREZ_GENE_ID'] = annotated2.ENTREZ_GENE_ID.str.split('///').str[0].astype(int)
    annotated2 = annotated2.set_index('ENTREZ_GENE_ID')
    annotated2 = np.log(annotated2)
    classes = {}
    classes['copd'] = ['disease status: COPD patient']
    classes['control'] = ['disease status: control patient']

    logging.info(classes)
    gsms = {cls: [gsm for gsm in gse.gsms
                  if gse.gsms[gsm].metadata['characteristics_ch1'][0] == 'cell type: alveolar macrophage' and
                  gse.gsms[gsm].metadata['characteristics_ch1'][1] == classes[cls][0]] for cls in classes}

    logging.info(' '.join(['{} GSM:{}'.format(cls, len(gsms[cls])) for cls in classes]))
    utils.create_dir_if_not_exist(args.out_expr_dir)
    utils.write_expr(join(args.out_expr_dir, 'processed', 'expr.tsv'), annotated2)
    for cls in classes:
        utils.write_text(join(args.out_expr_dir, 'processed', '{}_gsms.txt'.format(cls)), gsms[cls])

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Process GSE16972')
    parser.add_argument('out_expr_dir', type=str, help='Output directory for expression data file and GSM lists')
    args = parser.parse_args()
    main(args)
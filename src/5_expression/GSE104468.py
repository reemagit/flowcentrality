#!/usr/bin/env python3
"""
Generate GSE104468
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


def main(args):
    logging.basicConfig(level=logging.INFO,
                        format='%(module)s:%(levelname)s:%(asctime)s:%(message)s',
                            handlers=[logging.FileHandler("../logs/report.log")])
    logging.info(args)

    utils.create_dir_if_not_exist(args.out_expr_dir)
    utils.create_dir_if_not_exist(join(args.out_expr_dir,'raw'))
    utils.create_dir_if_not_exist(join(args.out_expr_dir,'processed'))

    gse = GEOparse.get_GEO(geo='GSE104468', destdir=join(args.out_expr_dir,'raw'))
    annotated = gse.pivot_and_annotate('VALUE', gse.gpls['GPL21185'], 'GENE_SYMBOL')
    convmatr = utils.gm._sources['biomart'].set_index('symbol')
    annotated2 = annotated[~pd.isnull(annotated.GENE_SYMBOL)]
    annotated2 = annotated2.loc[~annotated2.isnull().values.all(axis=1)]
    annotated2['ENTREZ_GENE_ID'] = convmatr.loc[annotated2.GENE_SYMBOL.tolist()].entrez.tolist()
    annotated2 = annotated2[~annotated2.ENTREZ_GENE_ID.isnull()]
    annotated2['ENTREZ_GENE_ID'] = annotated2['ENTREZ_GENE_ID'].astype(int)
    del annotated2['GENE_SYMBOL']
    annotated2 = annotated2.set_index('ENTREZ_GENE_ID')

    classes = {}
    classes['asthma_pbmc'] = ['disease state: Asthma','cell type: PBMC']
    classes['asthma_bronch'] = ['disease state: Asthma','cell type: bronchial epithelia']
    classes['asthma_nasal'] = ['disease state: Asthma','cell type: nasal epithelia']
    classes['normal_pbmc'] = ['disease state: Normal','cell type: PBMC']
    classes['normal_bronch'] = ['disease state: Normal','cell type: bronchial epithelia']
    classes['normal_nasal'] = ['disease state: Normal','cell type: nasal epithelia']

    logging.info(classes)
    gsms = {cls: [gsm for gsm in gse.gsms if gse.gsms[gsm].metadata['characteristics_ch1'][2] == classes[cls][0] and
                  gse.gsms[gsm].metadata['characteristics_ch1'][1] == classes[cls][1]] for cls in classes}

    logging.info(' '.join(['{} GSM:{}'.format(cls, len(gsms[cls])) for cls in classes]))
    utils.create_dir_if_not_exist(args.out_expr_dir)
    utils.write_expr(join(args.out_expr_dir, 'processed', 'expr.tsv'), annotated2)
    for cls in classes:
        utils.write_text(join(args.out_expr_dir, 'processed', '{}_gsms.txt'.format(cls)), gsms[cls])

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Process GSE104468')
    parser.add_argument('out_expr_dir', type=str, help='Output directory for expression data file and GSM lists')
    args = parser.parse_args()
    main(args)
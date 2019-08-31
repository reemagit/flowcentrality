#!/usr/bin/env python3
"""
Generate GSE31773
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

    gse = GEOparse.get_GEO(geo='GSE31773', destdir=join(args.out_expr_dir,'raw'))

    annotated = gse.pivot_and_annotate('VALUE', gse.gpls['GPL570'], 'ENTREZ_GENE_ID')
    annotated2 = annotated[~pd.isnull(annotated.ENTREZ_GENE_ID)]
    annotated2 = annotated2.loc[~annotated2.isnull().values.all(axis=1)]
    annotated2['ENTREZ_GENE_ID'] = annotated2.ENTREZ_GENE_ID.str.split('///').str[0].astype(int)
    annotated2 = annotated2.set_index('ENTREZ_GENE_ID')
    classes = {}
    classes['cd4_severe'] = ['CD4_Tcells_severe_asthma']
    classes['cd8_severe'] = ['CD8_Tcells_severe_asthma']
    classes['cd4_healthy'] = ['CD4_Tcells_healthy_donor']
    classes['cd8_healthy'] = ['CD8_Tcells_healthy_donor']
    classes['cd8_non_severe'] = ['CD8_Tcells_non_severe_asthma']
    classes['cd4_non_severe'] = ['CD4_Tcells_non_severe_asthma']
    classes['asthma_severe'] = ['CD4_Tcells_severe_asthma','CD8_Tcells_severe_asthma']
    classes['healthy'] = ['CD4_Tcells_healthy_donor','CD8_Tcells_healthy_donor']
    logging.info(classes)
    gsms = {cls:[gsm for gsm in gse.gsms if gse.gsms[gsm].metadata['source_name_ch1'][0] in classes[cls]] for cls in classes}
    utils.create_dir_if_not_exist(args.out_expr_dir)
    utils.write_expr(join(args.out_expr_dir, 'processed', 'expr.tsv'), annotated2)
    for cls in classes:
        logging.info("{} GSM: {}".format(cls, len(gsms[cls])))
        utils.write_text(join(args.out_expr_dir, 'processed', '{}_gsms.txt'.format(cls)), gsms[cls])

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Process GSE31773')
    parser.add_argument('out_expr_dir', type=str, help='Output directory for expression data file and GSM lists')
    args = parser.parse_args()
    main(args)
#!/usr/bin/env python3
"""
Generate GSE37147
"""

__author__ = "Enrico Maiorino"
__version__ = "0.1.0"
__license__ = "MIT"

import logging
import GEOparse
import argparse
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

    gse = GEOparse.get_GEO(geo='GSE37147', destdir=join(args.out_expr_dir,'raw'))
    annotated = gse.pivot_and_annotate('VALUE',gse.gpls['GPL13243'],'SPOT_ID')
    annotated2 = annotated.rename(columns={'SPOT_ID':'ENTREZ_GENE_ID'})
    annotated2 = annotated2.set_index('ENTREZ_GENE_ID')
    disease_cls = ['copd: yes']
    healthy_cls = ['copd: no']
    logging.info(disease_cls)
    logging.info(healthy_cls)
    disease_gsm = [gsm for gsm in gse.gsms if gse.gsms[gsm].metadata['characteristics_ch1'][4] in disease_cls]
    healthy_gsm = [gsm for gsm in gse.gsms if gse.gsms[gsm].metadata['characteristics_ch1'][4] in healthy_cls]
    disease_no_asthma_gsm = [gsm for gsm in gse.gsms \
                             if gse.gsms[gsm].metadata['characteristics_ch1'][4] in disease_cls \
                            and gse.gsms[gsm].metadata['characteristics_ch1'][9] == 'history of asthma: no']
    healthy_no_asthma_gsm = [gsm for gsm in gse.gsms \
                             if gse.gsms[gsm].metadata['characteristics_ch1'][4] in healthy_cls \
                             and gse.gsms[gsm].metadata['characteristics_ch1'][9] == 'history of asthma: no']
    logging.info("Disease GSM: {}, Healthy GSM: {}".format(len(disease_gsm),len(healthy_gsm)))
    logging.info("Disease (no history of asthma) GSM: {} Healthy (no history of asthma) GSM: {}".format(len(disease_no_asthma_gsm), len(healthy_no_asthma_gsm)))
    utils.create_dir_if_not_exist(args.out_expr_dir)
    utils.write_expr(join(args.out_expr_dir,'processed','expr.tsv'), annotated2)
    utils.write_text(join(args.out_expr_dir,'processed','disease_gsms.txt'), disease_gsm)
    utils.write_text(join(args.out_expr_dir,'processed','healthy_gsms.txt'), healthy_gsm)
    utils.write_text(join(args.out_expr_dir, 'processed', 'disease_no_history_asthma_gsms.txt'), disease_no_asthma_gsm)
    utils.write_text(join(args.out_expr_dir, 'processed', 'healthy_no_history_asthma_gsms.txt'), healthy_no_asthma_gsm)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Process GSE37147')
    parser.add_argument('out_expr_dir', type=str, help='Output directory for expression data file and GSM lists')
    args = parser.parse_args()

    main(args)
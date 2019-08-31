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
import numpy as np

def main(args):
    logging.basicConfig(level=logging.INFO,
                        format='%(module)s:%(levelname)s:%(asctime)s:%(message)s',
                            handlers=[logging.FileHandler("../logs/report.log"),logging.StreamHandler()])
    logging.info(args)


    gda = pd.read_csv(args.in_gda_path, sep='\t')
    disease_maps = pd.read_csv(args.in_dismap_path,sep='|')
    net = utils.read_network(args.in_net_path)

    gda = gda[gda.geneId.isin(net.nodes())]
    #gda = gda.groupby('diseaseId').filter(lambda x: len(x) >= args.min_disease_size)
    cols = ['diseaseId', 'diseaseName', 'diseaseType', 'diseaseClass', 'diseaseSemanticType','geneId']
    diseases = gda.groupby('diseaseId').apply(lambda x: pd.Series({'diseaseName'    :x.diseaseName.tolist()[0],
                                                                   'diseaseType': x.diseaseType.tolist()[0],
                                                                   'diseaseClass': x.diseaseClass.tolist()[0],
                                                                   'diseaseSemanticType': x.diseaseSemanticType.tolist()[0],
                                                                   'n_genes': x.shape[0]})).reset_index()
    print(diseases.shape)
    diseases = diseases[(diseases.n_genes>args.min_disease_size) & (diseases.n_genes<args.max_disease_size) & (diseases.diseaseType == 'disease') & (diseases.diseaseSemanticType == 'Disease or Syndrome')]
    print(diseases.shape)
    def get_doids(diseaseId):
        return '|'.join(['DOID:{}'.format(doid) for doid in disease_maps[
            (disease_maps.vocabulary == 'DO') & (disease_maps.diseaseId == diseaseId)].code.tolist()])

    diseases['DOID'] = diseases.diseaseId.apply(get_doids)
    doids = list(set(['DOID:{}'.format(doid) for doid in disease_maps[
        (disease_maps.vocabulary == 'DO') & (disease_maps.diseaseId.isin(diseases.diseaseId))].code.tolist()]))

    gda.to_csv(args.out_gda_file, sep='\t', index=False)
    diseases.to_csv(args.out_disease_file, sep='\t',index=False)
    utils.write_text(args.out_doid_file, doids)
if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('in_gda_path', type=str, help='Filepath of DisGeNet gene-disease associations file')
    parser.add_argument('in_dismap_path', type=str, help='Filepath of disease mappings file')
    parser.add_argument('in_net_path', type=str, help='Filepath of PPI')
    parser.add_argument('out_gda_file', type=str, help='Output filepath of gene-disease associations file')
    parser.add_argument('out_disease_file', type=str, help='Output filepath of diseases file')
    parser.add_argument('out_doid_file', type=str, help='Output filepath of all DO IDs in diseases file')
    parser.add_argument('--min_disease_size', type=int, default=0, help='Minimum number of gene-disease associations per disease')
    parser.add_argument('--max_disease_size', type=int, default=np.inf, help='Maximum number of gene-disease associations per disease')
    args = parser.parse_args()
    main(args)
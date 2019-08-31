#!/usr/bin/env python3
"""
Process raw data to get related disease pairs from Disease Ontology
"""

__author__ = "Enrico Maiorino"
__version__ = "0.1.0"
__license__ = "MIT"

import argparse
import logging
from funcs import utils
import pandas as pd
import numpy as np
from tqdm.autonotebook import trange
import random
from os.path import join

def main(args):
    logging.basicConfig(level=logging.INFO,
                        format='%(module)s:%(levelname)s:%(asctime)s:%(message)s',
                            handlers=[logging.FileHandler("../logs/report.log"),logging.StreamHandler()])
    logging.info(args)


    gda = pd.read_csv(args.in_gda_path, sep='\t')
    doid_sims = pd.read_csv(args.in_sims_path, sep='\t')
    all_doids = doid_sims.index.tolist()
    diseases = pd.read_csv(args.in_diseases_path, sep='\t', index_col='diseaseId')
    diseases['DOID_list'] = diseases.DOID.apply(lambda x: [doid for doid in x.split('|') if doid in all_doids] if str(x) != 'nan' else [])

    dis_ids = diseases.index.tolist()
    dis_sims = np.full([len(dis_ids), len(dis_ids)], np.nan)
    np.fill_diagonal(dis_sims, 1)
    for i in trange(len(dis_ids)):
        for j in range(i + 1, len(dis_ids)):
            doids_i = diseases.loc[dis_ids[i]].DOID_list
            doids_j = diseases.loc[dis_ids[j]].DOID_list
            curr_sims = []
            for doid_i in doids_i:
                for doid_j in doids_j:
                    curr_sims.append(doid_sims.loc[doid_i, doid_j])
            if len(curr_sims) > 0:
                max_sim = np.nanmax(curr_sims)
                dis_sims[i, j] = max_sim
                dis_sims[j, i] = max_sim
    dis_sims = pd.DataFrame(dis_sims, index=dis_ids, columns=dis_ids)
    dis_sims_flat = dis_sims.values[~np.isnan(dis_sims.values) & (dis_sims.values > 0) & (dis_sims.values < 1)]

    dis_overlaps = np.zeros([len(dis_ids), len(dis_ids)])
    for i in trange(len(dis_ids)):
        for j in range(i, len(dis_ids)):
            genes_i = gda[gda.diseaseId == dis_ids[i]].geneId.tolist()
            genes_j = gda[gda.diseaseId == dis_ids[j]].geneId.tolist()
            dis_overlaps[i, j] = len(set(genes_i) & set(genes_j))
            dis_overlaps[j, i] = dis_overlaps[i, j]

    dis_pairs_related_idx = np.asarray(np.where(np.triu(
        ((dis_sims.values > np.percentile(dis_sims_flat, args.perc_thresh)) & (dis_sims.values < 1) & (dis_overlaps < args.overlap_thresh))))).T
    dis_pairs_unrelated_idx = np.asarray(np.where(np.triu(((dis_sims.values == 0) & (dis_overlaps < 10))))).T
    dis_pairs_related = [[dis_ids[i], dis_ids[j]] for i, j in dis_pairs_related_idx]
    dis_pairs_unrelated = [[dis_ids[i], dis_ids[j]] for i, j in dis_pairs_unrelated_idx]
    random.seed(args.rdmseed)
    dis_pairs_unrelated = random.sample(dis_pairs_unrelated,len(dis_pairs_related))
    logging.info("Related disease pairs: {}, unrelated disease pairs: {}".format(len(dis_pairs_related), len(dis_pairs_unrelated)))

    pd.DataFrame(dis_pairs_related).to_csv(args.out_related_pairs, header=False, sep='\t', index=False)
    pd.DataFrame(dis_pairs_unrelated).to_csv(args.out_unrelated_pairs, header=False, sep='\t', index=False)
    dis_sims.to_csv(args.out_sims_path, sep='\t')
    all_dis = set(sum(dis_pairs_related+dis_pairs_unrelated,[]))
    for dis in all_dis:
        genes = gda[gda.diseaseId == dis].geneId.unique().tolist()
        utils.write_gene_list(join(args.out_genes_dir, dis+'.entrezlist'), genes)

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('in_gda_path', type=str, help='Filepath of DisGeNet gene-disease associations file')
    parser.add_argument('in_sims_path', type=str, help='Filepath of DOID similarities')
    parser.add_argument('in_diseases_path', type=str, help='Filepath of diseases data file')
    parser.add_argument('out_related_pairs', type=str, help='Output filepath of related disease pairs')
    parser.add_argument('out_unrelated_pairs', type=str, help='Output filepath of unrelated disease pairs')
    parser.add_argument('out_sims_path', type=str, help='Output filepath of disease similarities')
    parser.add_argument('out_genes_dir', type=str, help='Output directory of disease gene sets')
    parser.add_argument('--perc_thresh', type=int, default=90, help='Minimum similarity value of related diseases (percentile)')
    parser.add_argument('--overlap_thresh', type=int, default=10,
                        help='Maximum overlap of related diseases (n. of genes)')
    parser.add_argument('--rdmseed', type=int, default=100,
                        help='Random seed')
    args = parser.parse_args()
    main(args)
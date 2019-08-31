
"""
Module Docstring
"""

__author__ = "Enrico Maiorino"
__version__ = "0.1.0"
__license__ = "MIT"

import matplotlib.pyplot as plt
import argparse
import sys
import numpy as np
sys.path.append('../')
from funcs import utils
import pandas as pd
import seaborn as sns

parser = argparse.ArgumentParser(description='Plot disease similarities heatmap')
parser.add_argument('--config', type=str, default=None, help='Configuration file')
parser.add_argument('--dry', action='store_true', help='Dry run')
parser.add_argument('--no_show', action='store_true', help='Do not show plots')
parser.add_argument('--out_file', default=None, help='Override output filepath')
args = parser.parse_args()

if args.out_file is None:
    out_file = '../gendata/plots/disease_sims_heatmap.pdf'
else:
    out_file = args.out_file

if args.config is not None:
    config = utils.read_config(args.config)

dis_sims = pd.read_csv('../gendata/disease_ontology/disease_pairs/disease_similarities_minsize_50.tsv',sep='\t',index_col=0)
diseases = pd.read_csv('../data/disease_ontology/processed/diseases_size_min_50.tsv', sep='\t',index_col='diseaseId')

dis_sims_filled = dis_sims.copy()
dis_sims_filled[np.isnan(dis_sims_filled)] = 0
dis_sims_filled = dis_sims_filled.rename(index=diseases.diseaseName.to_dict(),columns=diseases.diseaseName.to_dict())
sns.clustermap(dis_sims_filled,figsize=[30,30]).fig.suptitle('Disease-Disease similarities', fontsize=24, y=0.9)
if not args.dry:
    plt.savefig(out_file,bbox_inches = 'tight')

if not args.no_show:
    plt.show()


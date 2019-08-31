
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

parser = argparse.ArgumentParser(description='Plot disease similarities distribution')
parser.add_argument('--config', type=str, default=None, help='Configuration file')
parser.add_argument('--dry', action='store_true', help='Dry run')
parser.add_argument('--no_show', action='store_true', help='Do not show plots')
parser.add_argument('--out_file', default=None, help='Override output filepath')
args = parser.parse_args()

if args.out_file is None:
    out_file = '../gendata/plots/disease_sims_distribution.pdf'
else:
    out_file = args.out_file

if args.config is not None:
    config = utils.read_config(args.config)

dis_sims = pd.read_csv('../gendata/disease_ontology/disease_pairs/disease_similarities_minsize_50.tsv',sep='\t',index_col=0)
diseases = pd.read_csv('../data/disease_ontology/processed/diseases_size_min_50.tsv', sep='\t',index_col='diseaseId')

dis_sims_flat = dis_sims.values[~np.isnan(dis_sims.values) & (dis_sims.values > 0) & (dis_sims.values < 1)]
q = 90
perc = np.percentile(dis_sims_flat,q)
plt.hist(dis_sims_flat,bins=100)
plt.axvline(perc,color='red', label=str(q) + '-th percentile')
plt.yscale('log')
plt.xlabel('Similarity',fontsize=12)
plt.ylabel('Number of occurrences',fontsize=12)
plt.title('Distribution of disease-disease similarities',fontsize=15, pad=12)
plt.legend(fontsize=12)


if not args.dry:
    plt.savefig(out_file, bbox_inches = 'tight')

if not args.no_show:
    plt.show()


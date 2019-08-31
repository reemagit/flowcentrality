
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
from funcs.utils import non_nan
from os import listdir
from os.path import join, exists
import pandas as pd
from matplotlib.patches import Patch
from matplotlib.lines import Line2D
import random

parser = argparse.ArgumentParser(description='Plot coexpression scores for asthma')
parser.add_argument('--config', type=str, default=None, help='Configuration file')
parser.add_argument('--dry', action='store_true', help='Dry run')
parser.add_argument('--no_show', action='store_true', help='Do not show plots')
parser.add_argument('--out_file', default=None, help='Override output filepath')
args = parser.parse_args()

if args.out_file is None:
    out_file = '../gendata/plots/coexpr_scores_asthmacopd.pdf'
else:
    out_file = args.out_file

if args.config is not None:
    config = utils.read_config(args.config)

def get_maxpvals(disease):
    alldata = {}
    allgroups = {}
    maxpvals = {}
    metadata = pd.read_excel('../data/expression/metadata/geo_metadata.xlsx', index_col='GSE ID')
    for i,gseid in enumerate(listdir('../data/expression')):
        if not gseid.startswith('GSE') or metadata.loc[gseid].Disease != disease:
            continue
        maxpvals[gseid] = 0
        alldata[gseid] = {}
        groups = pd.read_csv(join('../data/expression', gseid,'processed/group_labels.tsv'), index_col='group_name', sep='\t')
        allgroups[gseid] = groups[groups.group_condition=='disease']
        if len(allgroups[gseid]):
            for j,group in enumerate(allgroups[gseid].index.tolist()):
                alldata[gseid][group] = {}
                alldata[gseid][group]['fc'] = utils.non_nan(np.loadtxt('../gendata/coexpression/{}/seqcorrs_{}_1000.dat'.format(gseid, group)))
                alldata[gseid][group]['rdma'] = utils.non_nan(np.loadtxt('../gendata/coexpression/{}/seqcorrs_{}_rdm_a_1000.dat'.format(gseid, group)))
                alldata[gseid][group]['rdmb'] = utils.non_nan(np.loadtxt('../gendata/coexpression/{}/seqcorrs_{}_rdm_b_1000.dat'.format(gseid, group)))
                pval_a = utils.mwpval(alldata[gseid][group]['fc'],alldata[gseid][group]['rdma'])
                pval_b = utils.mwpval(alldata[gseid][group]['fc'], alldata[gseid][group]['rdmb'])
                maxpvals[gseid] = max([maxpvals[gseid], pval_a, pval_b])
        else:
            maxpvals[gseid] = np.nan
    return maxpvals


asthmapvals = get_maxpvals('Asthma')
copdpvals = get_maxpvals('COPD')

asthmascores = {gseid:-np.log10(min(0.95,pval)) if not np.isnan(pval) else np.nan for gseid,pval in asthmapvals.items()}
copdscores = {gseid:-np.log10(min(0.95,pval)) if not np.isnan(pval) else np.nan for gseid,pval in copdpvals.items()}
#hlt_scores = {gseid:-np.log10(min(0.95,pval)) if not np.isnan(pval) else np.nan for gseid,pval in hlt_pvals.items()}


asthma_gseids = list(asthmapvals.keys())
copd_gseids = list(copdpvals.keys())

asthma_gseids = sorted(asthma_gseids, key=lambda x: asthmascores[x], reverse=True)
copd_gseids = sorted(copd_gseids, key=lambda x: copdscores[x], reverse=True)
plt.figure(figsize=[8,4])
plt.subplot(1,2,1)
plt.barh(np.arange(len(asthma_gseids)), [asthmascores[gseid] for gseid in asthma_gseids], height=0.7, color='steelblue')

plt.xlabel('-log(p-value)',fontsize=13)
plt.xlim([-0.3,None])

plt.axvline(-np.log10(0.05), lw=1,color='red',linestyle=':',label='0.05')
plt.yticks(range(len(asthma_gseids)), asthma_gseids)
plt.title('Asthma expression data', fontsize=14)
plt.gca().invert_yaxis()

plt.subplot(1,2,2)
plt.barh(np.arange(len(copd_gseids)), [copdscores[gseid] for gseid in copd_gseids], height=0.7, color='lightcoral')

plt.xlabel('-log(p-value)',fontsize=13)
plt.xlim([-0.3,None])

plt.axvline(-np.log10(0.05), lw=1,color='red',linestyle=':',label='0.05')
plt.yticks(range(len(copd_gseids)), copd_gseids)
plt.gca().invert_yaxis()
plt.title('COPD expression data', fontsize=14)

plt.tight_layout()

if not args.dry:
    plt.savefig(out_file)

if not args.no_show:
    plt.show()


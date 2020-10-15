
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

parser = argparse.ArgumentParser(description='Plot coexpression scores')
parser.add_argument('--config', type=str, default=None, help='Configuration file')
parser.add_argument('--dry', action='store_true', help='Dry run')
parser.add_argument('--no_show', action='store_true', help='Do not show plots')
parser.add_argument('--out_file', default=None, help='Override output filepath')
args = parser.parse_args()

if args.out_file is None:
    out_file = '../gendata/plots/coexpr_scores.pdf'
else:
    out_file = args.out_file

if args.config is not None:
    config = utils.read_config(args.config)

def get_maxpvals(condition):
    alldata = {}
    allgroups = {}
    maxpvals = {}
    for i,gseid in enumerate([gseid_ for gseid_ in listdir('../data/expression') if gseid_.startswith('GSE')]):
        if not gseid.startswith('GSE'):
            continue
        maxpvals[gseid] = 0
        alldata[gseid] = {}
        groups = pd.read_csv(join('../data/expression', gseid,'processed/group_labels.tsv'), index_col='group_name', sep='\t')
        allgroups[gseid] = groups[groups.group_condition==condition]
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


dis_pvals = get_maxpvals('disease')
hlt_pvals = get_maxpvals('healthy')

dis_scores = {gseid:-np.log10(min(0.95,pval)) if not np.isnan(pval) else np.nan for gseid,pval in dis_pvals.items()}
hlt_scores = {gseid:-np.log10(min(0.95,pval)) if not np.isnan(pval) else np.nan for gseid,pval in hlt_pvals.items()}


gseids = list(dis_pvals.keys())

print(gseids)
gseids = sorted(gseids, key=lambda x: dis_scores[x], reverse=True)
print(gseids)
#random.seed(1)
#random.shuffle(gseids)
plt.figure(figsize=[5,7])
plt.barh(np.arange(len(gseids))-0.2, [dis_scores[gseid] for gseid in gseids], height=0.28, color='lightcoral')
plt.barh(np.arange(len(gseids))+0.2, [hlt_scores[gseid] for gseid in gseids], height=0.28, color='steelblue')
#for i in range(len(gseids)):
#    if np.isnan(hlt_scores[gseids[i]]):
#        plt.text(1.7,i,'N/A',fontsize=9,va='center')

plt.xlabel('-log(p-value)',fontsize=13)
plt.xlim([-0.3,None])

plt.axvline(-np.log10(0.05), lw=1,color='red',linestyle=':',label='0.05')
plt.yticks(range(len(gseids)), gseids)
plt.gca().invert_yaxis()
legend_elements = [Patch(facecolor='lightcoral', label='Disease'), Patch(facecolor='steelblue', label='Healthy'),
                   Line2D([0], [0], color='red', lw=1, linestyle=':', label='0.05'),]
plt.legend(handles=legend_elements, loc='upper right')
plt.tight_layout()

if not args.dry:
    plt.savefig(out_file)

if not args.no_show:
    plt.show()


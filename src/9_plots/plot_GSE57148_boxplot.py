
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

parser = argparse.ArgumentParser(description='Plot coexpression scores for GSE57148')
parser.add_argument('--config', type=str, default=None, help='Configuration file')
parser.add_argument('--dry', action='store_true', help='Dry run')
parser.add_argument('--no_show', action='store_true', help='Do not show plots')
parser.add_argument('--out_file', default=None, help='Override output filepath')
args = parser.parse_args()

if args.out_file is None:
    out_file = '../gendata/plots/GSE57148_boxplot.pdf'
else:
    out_file = args.out_file

if args.config is not None:
    config = utils.read_config(args.config)

gseid='GSE57148'
group = 'disease_gsms'
alldata = {}
allgroups = {}
maxpvals = {}
maxpvals[gseid] = 0
alldata[gseid] = {}
alldata[gseid][group] = {}
alldata[gseid][group]['fc'] = utils.non_nan(np.loadtxt('../gendata/coexpression/{}/seqcorrs_{}_1000.dat'.format(gseid, group)))
alldata[gseid][group]['rdma'] = utils.non_nan(np.loadtxt('../gendata/coexpression/{}/seqcorrs_{}_rdm_a_1000.dat'.format(gseid, group)))
alldata[gseid][group]['rdmb'] = utils.non_nan(np.loadtxt('../gendata/coexpression/{}/seqcorrs_{}_rdm_b_1000.dat'.format(gseid, group)))
pval_a = utils.mwpval(alldata[gseid][group]['fc'],alldata[gseid][group]['rdma'])
pval_b = utils.mwpval(alldata[gseid][group]['fc'], alldata[gseid][group]['rdmb'])
maxpvals[gseid] = max([maxpvals[gseid], pval_a, pval_b])

boxprops={'linewidth':1,'zorder':3}
whiskerprops={'linewidth':1,'zorder':3}
capprops={'linewidth':1,'zorder':3}
medianprops={'color':'red', 'linewidth':1.5,'zorder':6}
flierprops={'marker':'o','markeredgecolor':'lightgray','zorder':1}
labels = ['Type A', 'Type B', 'FC']
pos=[1,2,3]

plt.figure(figsize=[4,3])
corrvals = alldata[gseid][group]['fc']
rdmavals = alldata[gseid][group]['rdma']
rdmbvals = alldata[gseid][group]['rdmb']
bplot = plt.boxplot([rdmavals, rdmbvals, corrvals], showfliers=False, positions=pos, patch_artist=True,
                            widths=config['go_boxplot_width'], medianprops=medianprops, boxprops=boxprops,
                            whiskerprops=whiskerprops, capprops=capprops, flierprops=flierprops);
colors = [config['rdm_a_boxplot_color'], config['rdm_b_boxplot_color'], config['fc_path_boxplot_color']]
utils.plot_significances_paths([rdmavals, rdmbvals, corrvals], pos, no_fliers=True)
for patch, color in zip(bplot['boxes'], colors):
    patch.set_facecolor(color)

plt.xticks(pos, labels)
plt.ylabel('Sequential correlation', fontsize=10)
plt.title('SC in COPD samples (' + gseid + ')',fontsize=12, pad=10)
plt.tight_layout()


if not args.dry:
    plt.savefig(out_file)

if not args.no_show:
    plt.show()


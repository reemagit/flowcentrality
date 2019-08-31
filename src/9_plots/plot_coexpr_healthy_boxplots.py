
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

parser = argparse.ArgumentParser(description='Plot coexpression boxplots in healthy conditions')
parser.add_argument('--config', type=str, default=None, help='Configuration file')
parser.add_argument('--dry', action='store_true', help='Dry run')
parser.add_argument('--no_show', action='store_true', help='Do not show plots')
parser.add_argument('--out_file', default=None, help='Override output filepath')
args = parser.parse_args()

if args.out_file is None:
    out_file = '../gendata/plots/coexpr_healthy_boxplots.pdf'
else:
    out_file = args.out_file

if args.config is not None:
    config = utils.read_config(args.config)

boxprops={'linewidth':1,'zorder':3}
whiskerprops={'linewidth':1,'zorder':3}
capprops={'linewidth':1,'zorder':3}
medianprops={'color':'red', 'linewidth':1.5,'zorder':6}
flierprops={'marker':'o','markeredgecolor':'lightgray','zorder':1}
labels = ['Type A', 'Type B', 'FC']
short_labels = ['TA', 'TB', 'FC']
shortest_labels = ['A','B','F']

def create_labels(groups):
    out_labels = []
    if len(groups) <= 2:
        short_level = 0
    elif len(groups) <= 4:
        short_level = 1
    else:
        short_level = 2
    for g in groups:
        if short_level==0:
            newtriple = list(labels)
            newtriple[1] = utils.trim_text(newtriple[1] + '\n' + g.replace(' ','\n',1), 40)
        elif short_level==1:
            newtriple = list(short_labels)
            newtriple[1] = newtriple[1] + '\n' + g.split(' ')[0] + '...'
        else:
            newtriple = list(shortest_labels)
            newtriple[1] = newtriple[1] + '\n' + g.split(' ')[0][:3]
        out_labels += newtriple
    return out_labels

alldata = {}
allgroups = {}
maxpvals = {}
for i,gseid in enumerate(listdir('../data/expression')):
    maxpvals[gseid] = 0
    alldata[gseid] = {}
    groups = pd.read_csv(join('../data/expression', gseid,'processed/group_labels.tsv'), index_col='group_name', sep='\t')
    allgroups[gseid] = groups[groups.group_condition=='healthy']
    for j,group in enumerate(allgroups[gseid].index.tolist()):
        alldata[gseid][group] = {}
        alldata[gseid][group]['fc'] = utils.non_nan(np.loadtxt('../gendata/coexpression/{}/seqcorrs_{}_1000.dat'.format(gseid, group)))
        alldata[gseid][group]['rdma'] = utils.non_nan(np.loadtxt('../gendata/coexpression/{}/seqcorrs_{}_rdm_a_1000.dat'.format(gseid, group)))
        alldata[gseid][group]['rdmb'] = utils.non_nan(np.loadtxt('../gendata/coexpression/{}/seqcorrs_{}_rdm_b_1000.dat'.format(gseid, group)))
        pval_a = utils.mwpval(alldata[gseid][group]['fc'],alldata[gseid][group]['rdma'])
        pval_b = utils.mwpval(alldata[gseid][group]['fc'], alldata[gseid][group]['rdmb'])
        maxpvals[gseid] = max([maxpvals[gseid], pval_a, pval_b])

#sorted_gseid = [k for k in sorted(maxpvals, key=maxpvals.get, reverse=False)]
sorted_gseid = maxpvals.keys()

plt.figure(figsize=[20,10])
for i,gseid in enumerate(sorted_gseid):
    plotdata = []
    groups = allgroups[gseid]
    pos = np.arange(1,4) # 1,2,3
    plt.subplot(4, 5, i + 1)
    if len(groups):
        for j,group in enumerate(groups.index.tolist()):
            gpname = groups.loc[group]
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

            pos = pos + 3
        if groups.shape[0] > 2:
            plt.xticks(range(1, 3 * groups.shape[0] + 1), create_labels(groups.group_label.tolist()))
        else:
            plt.xticks(range(1,3*groups.shape[0]+1), create_labels(groups.group_label.tolist()))
        for lnx in np.arange(3.5,groups.shape[0]*3,3):
            plt.axvline(lnx, linestyle=':', color='lightgray')
    else:
        plt.text(0, 0, 'No control group', fontsize=15, ha='center')
        plt.xlim([-1, 1])
        plt.ylim([-1, 1])
    #for k in range(len(groups)):
    #    plt.text(2 + k * 3, -3, (groups.iloc[k].group_label).split(' ')[0], ha='center', va='top')
    plt.title(gseid,fontsize=18)
plt.tight_layout()

if not args.dry:
    plt.savefig(out_file)

if not args.no_show:
    plt.show()


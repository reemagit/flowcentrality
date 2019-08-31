
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
import pandas as pd
sys.path.append('../')
from funcs import utils
from funcs.utils import non_nan
from os import listdir
from os.path import join

parser = argparse.ArgumentParser(description='Plot of comparison between asthma-COPD FC paths SC vs SC of paths to random diseases')
parser.add_argument('--config', type=str, default=None, help='Configuration file')
parser.add_argument('--dry', action='store_true', help='Dry run')
parser.add_argument('--no_show', action='store_true', help='Do not show plots')
parser.add_argument('--out_file', default=None, help='Override output filepath')
args = parser.parse_args()

if args.out_file is None:
    out_file = '../gendata/plots/asthma_copd_random_diseases_gse4302_boxplot.pdf'
else:
    out_file = args.out_file

if args.config is not None:
    config = utils.read_config(args.config)

obs_disease = non_nan(np.loadtxt('../gendata/coexpression/GSE4302/seqcorrs_disease_gsms_1000.dat'))

dis = pd.read_csv('../gendata/coexpression/rdm_disgenet/diseases_size_min_24_max_36.tsv',sep='\t',index_col='diseaseId')
chronic = dis[dis.diseaseName.str.lower().str.contains('chronic')].index.tolist()

datadir = '../gendata/coexpression/rdm_disgenet/asthma'
filenames = [filename for filename in listdir(datadir) if filename.split('_')[1] not in chronic and '_disease' in filename] # we want unrelated diseases

disIds_disease = [filename.split('_')[1] for filename in filenames]

sc_disease = [non_nan(np.loadtxt(join(datadir, filename))) for filename in filenames]

disNames_disease = [dis.loc[disId].diseaseName for disId,filename in zip(disIds_disease, filenames) if '_disease' in filename]
pvals = [utils.mwpval(obs_disease, sc_dis) for sc_dis in sc_disease]

#sort_idx = sorted(range(len(sc_disease)), key=lambda i: np.median(sc_disease[i]), reverse=True)
sort_idx = np.argsort(pvals)[::-1]

sc_disease_sort = [sc_disease[i] for i in sort_idx]
disNames_disease_sort = [disNames_disease[i] for i in sort_idx]
pvals_sort = [pvals[i] for i in sort_idx]

N_max = 10

plt.figure()

boxprops={'linewidth':1,'zorder':3}
whiskerprops={'linewidth':1,'zorder':3}
capprops={'linewidth':1,'zorder':3}
medianprops={'color':'red', 'linewidth':1.5,'zorder':6}
flierprops={'marker':'o','markeredgecolor':'lightgray','zorder':1}
labels = ['Ast.-'+utils.trim_text(lbl,20) for lbl in disNames_disease_sort][:N_max]

pos = range(1,len(sc_disease_sort)+2)[:N_max+1]

f, (a0, a1) = plt.subplots(2,1, figsize=[7,5], gridspec_kw={'height_ratios': [1, 3]})

a0.bar(pos[1:], -np.log10(pvals_sort)[:N_max], color='lightblue', width=-0.6)
a0.axhline(-np.log10(0.05),label='0.05 line',color='red', linestyle='--')
a0.legend(fontsize=10, loc='upper left')
a0.set_xlim([pos[0]-0.5,pos[-1]+0.5])
a0.set_xticks([])
a0.set_ylabel('-log(p-val)', fontsize=10, labelpad=22)
a0.spines['right'].set_visible(False)
a0.spines['top'].set_visible(False)
a0.set_title('SC in Asthmatic samples (GSE4302)',fontsize=14)
bplot = a1.boxplot([obs_disease] + sc_disease_sort[:N_max], showfliers=True, positions=pos, patch_artist=True,
                            widths=0.4, medianprops=medianprops, boxprops=boxprops,
                            whiskerprops=whiskerprops, capprops=capprops, flierprops=flierprops);
colors = [config['fc_path_boxplot_color']] + ['gainsboro'] * N_max
for patch, color in zip(bplot['boxes'], colors):
    patch.set_facecolor(color)


a1.set_xticklabels(['Asthma-COPD'] + labels, rotation=45, ha='right')
a1.set_xlim([pos[0]-0.5,pos[-1]+0.5])
a1.set_yticks(a1.get_yticks()[:-1])
a1.set_ylabel('Sequential coexpression', fontsize=10)

plt.tight_layout(h_pad=-0.6)

if not args.dry:
    plt.savefig(out_file)

if not args.no_show:
    plt.show()


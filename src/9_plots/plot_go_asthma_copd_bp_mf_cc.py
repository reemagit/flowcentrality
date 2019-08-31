
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

parser = argparse.ArgumentParser(description='Plot asthma-copd GO analysis on BP,MF,CC namespaces')
parser.add_argument('--config', type=str, default=None, help='Configuration file')
parser.add_argument('--dry', action='store_true', help='Dry run')
parser.add_argument('--no_show', action='store_true', help='Do not show plots')
parser.add_argument('--out_file', default=None, help='Override output filepath')
args = parser.parse_args()

if args.out_file is None:
    out_file = '../gendata/plots/go_asthma_copd_bp_mf_cc.pdf'
else:
    out_file = args.out_file

if args.config is not None:
    config = utils.read_config(args.config)

types = ['fc','rdm_a','rdm_b']
seqsims_cc = {tp:non_nan(np.loadtxt('../gendata/seqsim/seqsims_{}_cc_1000.dat'.format(tp))) for tp in types}
seqsims_mf = {tp:non_nan(np.loadtxt('../gendata/seqsim/seqsims_{}_mf_1000.dat'.format(tp))) for tp in types}
seqsims_bp = {tp:non_nan(np.loadtxt('../gendata/seqsim/seqsims_{}_bp_1000.dat'.format(tp))) for tp in types}


plt.figure(figsize=[8,4])
data = [seqsims_cc['rdm_a'], seqsims_cc['rdm_b'], seqsims_cc['fc'],
                seqsims_mf['rdm_a'], seqsims_mf['rdm_b'], seqsims_mf['fc'],
                seqsims_bp['rdm_a'], seqsims_bp['rdm_b'], seqsims_bp['fc']]
boxprops={'linewidth':1,'zorder':3}
whiskerprops={'linewidth':1,'zorder':3}
capprops={'linewidth':1,'zorder':3}
medianprops={'color':'red', 'linewidth':1.5,'zorder':6}
flierprops={'marker':'o','markeredgecolor':'lightgray','zorder':1}
plt.gca().yaxis.grid(True, zorder=0, linestyle=':')
bplot = plt.boxplot(data,widths=0.3,flierprops=flierprops,medianprops=medianprops,boxprops=boxprops,whiskerprops=whiskerprops,capprops=capprops,patch_artist=True);
colors = [config['rdm_a_boxplot_color'],config['rdm_b_boxplot_color'],config['fc_path_boxplot_color']] * 3
for patch, color in zip(bplot['boxes'], colors):
    patch.set_facecolor(color)
labels = ['Type A', 'Type B', 'FC'] * 3

utils.plot_significances([[seqsims_cc['rdm_b'], seqsims_cc['fc']],[seqsims_cc['rdm_a'], seqsims_cc['fc']]], [[2,3],[1,3]])
utils.plot_significances([[seqsims_mf['rdm_b'], seqsims_mf['fc']],[seqsims_mf['rdm_a'], seqsims_mf['fc']]], [[2+3,3+3],[1+3,3+3]])
utils.plot_significances([[seqsims_bp['rdm_b'], seqsims_bp['fc']],[seqsims_bp['rdm_a'], seqsims_bp['fc']]], [[2+6,3+6],[1+6,3+6]])


plt.xticks(np.arange(len(data))+1, labels)
plt.axvline(3.5, linestyle='dashed',color='lightgray')
plt.axvline(6.5, linestyle='dashed',color='lightgray')
plt.text(2, 11.5, 'CC',ha='center',fontsize=17)
plt.text(5, 11.5, 'MF',ha='center',fontsize=17)
plt.text(8, 11.5, 'BP',ha='center',fontsize=17)
plt.xlim([0.5,9.5])
plt.ylabel('Sequential similarity',fontsize=14)

if not args.dry:
    plt.savefig(out_file)

if not args.no_show:
    plt.show()


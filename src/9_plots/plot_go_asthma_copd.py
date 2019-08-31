

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

parser = argparse.ArgumentParser(description='Plot asthma-copd GO analysis')
parser.add_argument('--config', type=str, default=None, help='Configuration file')
parser.add_argument('--dry', action='store_true', help='Dry run')
parser.add_argument('--no_show', action='store_true', help='Do not show plots')
parser.add_argument('--out_file', default=None, help='Override output filepath')
args = parser.parse_args()

if args.out_file is None:
    out_file = '../gendata/plots/go_asthma_copd.pdf'
else:
    out_file = args.out_file

if args.config is not None:
    config = utils.read_config(args.config)

types = ['fc','rdm_a','rdm_b']
seqsims = {tp:non_nan(np.loadtxt('../gendata/seqsim/seqsims_{}_1000.dat'.format(tp))) for tp in types}

print(utils.mwpval(seqsims['fc'],seqsims['rdm_a']))
print(utils.mwpval(seqsims['fc'],seqsims['rdm_b']))

plt.figure(figsize=[5,5])
pos = [0,1,2]
boxprops={'linewidth':1,'zorder':3}
whiskerprops={'linewidth':1,'zorder':3}
capprops={'linewidth':1,'zorder':3}
medianprops={'color':'red', 'linewidth':1.5,'zorder':6}
flierprops={'marker':'o','markeredgecolor':'lightgray','zorder':1}
plt.gca().yaxis.grid(True, zorder=0, linestyle=':')
bplot = plt.boxplot([seqsims['rdm_a'], seqsims['rdm_b'], seqsims['fc']], positions=pos, patch_artist=True,widths=config['go_boxplot_width'],medianprops=medianprops,boxprops=boxprops,whiskerprops=whiskerprops,capprops=capprops,flierprops=flierprops);
colors = [config['rdm_a_boxplot_color'],config['rdm_b_boxplot_color'],config['fc_path_boxplot_color']]
utils.plot_significances([[seqsims['rdm_b'],seqsims['fc']],[seqsims['rdm_a'],seqsims['fc']]], [[1,2],[0,2]])
for patch, color in zip(bplot['boxes'], colors):
    patch.set_facecolor(color)
labels = ['Rdm\n(Type A)', 'Rdm\n(Type B)', 'FC paths']


plt.xticks(pos,labels,fontsize=13)
plt.ylabel('Sequential GO similarity', fontsize=13)
plt.ylim([None,9.3])
plt.title('Asthma - COPD',fontsize=18,pad=10)

if not args.dry:
    plt.savefig(out_file)

if not args.no_show:
    plt.show()


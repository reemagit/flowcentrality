
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

parser = argparse.ArgumentParser(description='SS between COPD and pneumonia, and COPD and IPF compared to asthma-COPD')
parser.add_argument('--config', type=str, default=None, help='Configuration file')
parser.add_argument('--dry', action='store_true', help='Dry run')
parser.add_argument('--no_show', action='store_true', help='Do not show plots')
parser.add_argument('--out_file', default=None, help='Override output filepath')
args = parser.parse_args()

if args.out_file is None:
    out_file = '../gendata/plots/asthma_pneumonia_ipf.pdf'
else:
    out_file = args.out_file

if args.config is not None:
    config = utils.read_config(args.config)

def non_nan(arr):
    arr = np.asarray(arr)
    return arr[~np.isnan(arr)]

asthma_copd_disease_57148 = non_nan(np.loadtxt('../gendata/coexpression/GSE57148/seqcorrs_disease_gsms_1000.dat'))
copd_pneumonia_disease = non_nan(np.loadtxt('../gendata/coexpression/copd_pneumonia/seqcorrs_disease_gsms.dat'))
copd_ipf_disease = non_nan(np.loadtxt('../gendata/coexpression/copd_ipf/seqcorrs_disease_gsms.dat'))



boxprops={'linewidth':1,'zorder':3}
whiskerprops={'linewidth':1,'zorder':3}
capprops={'linewidth':1,'zorder':3}
medianprops={'color':'red', 'linewidth':1.5,'zorder':6}
flierprops={'marker':'o','markeredgecolor':'lightgray','zorder':1}
labels = ['Pneumonia-COPD', 'IPF-COPD', 'Asthma-COPD']

pos = [1,2,3]
plt.figure(figsize=[4,3])
bplot = plt.boxplot([copd_pneumonia_disease, copd_ipf_disease, asthma_copd_disease_57148], showfliers=False, positions=pos, patch_artist=True,
                            widths=config['go_boxplot_width'], medianprops=medianprops, boxprops=boxprops,
                            whiskerprops=whiskerprops, capprops=capprops, flierprops=flierprops);
colors = [config['pneumonia_boxplot_color'], config['ipf_boxplot_color'], config['fc_path_boxplot_color']]
utils.plot_significances_paths([copd_pneumonia_disease, copd_ipf_disease, asthma_copd_disease_57148], pos,
                               no_fliers=True)
for patch, color in zip(bplot['boxes'], colors):
    patch.set_facecolor(color)

plt.xticks(range(1, 4), labels)
plt.ylabel('Sequential coexpression',fontsize=12)
plt.title('SC in COPD patients (GSE57148)')
plt.tight_layout()
if not args.dry:
    plt.savefig(out_file)

if not args.no_show:
    plt.show()


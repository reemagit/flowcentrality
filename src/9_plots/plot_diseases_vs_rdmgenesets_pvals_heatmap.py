
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
from matplotlib.patches import Patch
from matplotlib.lines import Line2D
from matplotlib import colors
sys.path.append('../')
from funcs import utils
from funcs.utils import non_nan
from os import listdir
from os.path import join
import pandas as pd

parser = argparse.ArgumentParser(description='Plot heatmap of p-values of diseases compared to random gene sets')
parser.add_argument('--config', type=str, default=None, help='Configuration file')
parser.add_argument('--dry', action='store_true', help='Dry run')
parser.add_argument('--no_show', action='store_true', help='Do not show plots')
parser.add_argument('--out_file', default=None, help='Override output filepath')
args = parser.parse_args()

if args.out_file is None:
    out_file = '../gendata/plots/diseases_vs_rdmgenesets_pvals_heatmap.pdf'
else:
    out_file = args.out_file

if args.config is not None:
    config = utils.read_config(args.config)

diseases = pd.read_csv('../data/disease_ontology/processed/diseases_size_min_50.tsv',sep='\t', index_col='diseaseId')
obs_dir = '../gendata/seqsim/disgenet_diseases/related'
rdm_dir = '../gendata/seqsim/random_genesets'

N_samples = 100

pairs = [pair.split('_') for pair in listdir(obs_dir)]

obs_seqsims = []
rdm_seqsims = []
for pair in pairs:
    pair = '_'.join(pair)
    obs_seqsims.append(non_nan(np.loadtxt(join(obs_dir, pair, 'seqsims_fc.dat'))))
    rdm_seqsims.append(utils.read_nonrectangular(join(rdm_dir,pair+'.nonrect')))

ylbl = [diseases.loc[d0].diseaseName + '---' + diseases.loc[d1].diseaseName for d0,d1 in pairs]
ylbl_short = [utils.trim_text(diseases.loc[d0].diseaseName) + '---' + utils.trim_text(diseases.loc[d1].diseaseName) for d0,d1 in pairs]

pvals_rdm = np.zeros([len(obs_seqsims), N_samples])
for i in range(len(obs_seqsims)):
    for j in range(N_samples):
        pvals_rdm[i,j] = utils.mwpval(obs_seqsims[i], rdm_seqsims[i][j])

# make a color map of fixed colors
pval_colors = ['green', 'yellowgreen', 'orange', 'red']
cmap = colors.ListedColormap(pval_colors)
bounds=[0,1e-10,1e-4,0.05,1]
norm = colors.BoundaryNorm(bounds, cmap.N)
plt.figure(figsize=[20,20])
for i in range(pvals_rdm.shape[0]):
    pvals_rdm[i,:] = sorted(pvals_rdm[i,:],reverse=True)
plt.imshow(pvals_rdm, cmap=cmap,aspect='equal')



# Minor ticks
plt.gca().set_xticks(np.arange(0, pvals_rdm.shape[1])+0.5, minor=True);
plt.gca().set_yticks(np.arange(0, pvals_rdm.shape[0])+0.5, minor=True);
plt.yticks(range(pvals_rdm.shape[0]),ylbl)
plt.gca().grid(axis='x', which="minor", color="black", linestyle=':', linewidth=1.)
plt.gca().grid(axis='y', which="minor", color="black", linestyle='-', linewidth=2.)
#plt.gca().grid(which="major", color="w", linestyle='-', linewidth=3)
plt.xlabel('Sample #',fontsize=18)
plt.title('Seq.sim. of disease pairs compared to random gene sets, Mann-Whitney p-value',fontsize=20, pad=15)
legend_elements = [Patch(facecolor=pval_colors[0], edgecolor='black', label='pval <= 1e-10'),
                  Patch(facecolor=pval_colors[1], edgecolor='black', label='1e-10 < pval <= 1e-4'),
                   Patch(facecolor=pval_colors[2], edgecolor='black', label='1e-4 < pval <= 0.05'),
                  Patch(facecolor=pval_colors[3], edgecolor='black', label='0.05 < pval <= 1')]
plt.gca().legend(handles=legend_elements, loc='upper right',fontsize=15)


if not args.dry:
    plt.savefig(out_file,bbox_inches = 'tight')

if not args.no_show:
    plt.show()


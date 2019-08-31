
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
import pandas as pd
from os import listdir
from os.path import join
from tqdm.autonotebook import trange

parser = argparse.ArgumentParser(description='Plot related disease pairs GO boxplots')
parser.add_argument('--config', type=str, default=None, help='Configuration file')
parser.add_argument('--dry', action='store_true', help='Dry run')
parser.add_argument('--no_show', action='store_true', help='Do not show plots')
parser.add_argument('--out_file', default=None, help='Override output filepath')
args = parser.parse_args()

if args.out_file is None:
    out_file = '../gendata/plots/disease_pairs_go.pdf'
else:
    out_file = args.out_file

if args.config is not None:
    config = utils.read_config(args.config)

diseases = pd.read_csv('../data/disease_ontology/processed/diseases_size_min_50.tsv',sep='\t', index_col='diseaseId')
obs_dir = '../gendata/seqsim/disgenet_diseases/related'
N_samples = 100

pairs = [pair.split('_') for pair in listdir(obs_dir)]

obs_seqsims = []
typea_seqsims = []
typeb_seqsims = []
for pair in pairs:
    pair = '_'.join(pair)
    obs_seqsims.append(non_nan(np.loadtxt(join(obs_dir, pair, 'seqsims_fc.dat'))))
    typea_seqsims.append(non_nan(np.loadtxt(join(obs_dir, pair, 'seqsims_rdm_a.dat'))))
    typeb_seqsims.append(non_nan(np.loadtxt(join(obs_dir, pair, 'seqsims_rdm_b.dat'))))

ylbl = [diseases.loc[d0].diseaseName + '---' + diseases.loc[d1].diseaseName for d0,d1 in pairs]
ylbl_short = [utils.trim_text(diseases.loc[d0].diseaseName, maxchar=15) + '---' + utils.trim_text(diseases.loc[d1].diseaseName, maxchar=15) for d0,d1 in pairs]

pvals_typea = np.asarray([utils.mwpval(obs,rdm) for obs,rdm in zip(obs_seqsims,typea_seqsims)])
pvals_typeb = np.asarray([utils.mwpval(obs,rdm) for obs,rdm in zip(obs_seqsims,typeb_seqsims)])

pos = [1, 2, 3]
plt.figure(figsize=[20, 15])
for i in trange(len(pairs)):
    plt.subplot(8, 9, i + 1)
    plt.gca().yaxis.grid(True, zorder=0, linestyle=':')
    boxprops = {'linewidth': 1., 'zorder': 3}
    whiskerprops = {'linewidth': 1.}
    capprops = {'linewidth': 1.}
    medianprops = {'color': 'red', 'linewidth': 1.5, 'zorder': 6}
    flierprops = {'marker': 'o', 'markeredgecolor': 'lightgray', 'zorder': 3}
    bplot = plt.boxplot([typea_seqsims[i], typeb_seqsims[i], obs_seqsims[i]], positions=pos, showfliers=False,
                        patch_artist=True, widths=0.3, medianprops=medianprops, boxprops=boxprops,
                        whiskerprops=whiskerprops, capprops=capprops, flierprops=flierprops);

    utils.plot_significances_paths([typea_seqsims[i], typeb_seqsims[i], obs_seqsims[i]], delta_ratio=30, no_fliers=True)
    colors = ['lightblue', 'lightblue', 'lightcoral']
    for patch, color in zip(bplot['boxes'], colors):
        patch.set_facecolor(color)
    labels = ['Rdm\n(Type A)', 'Rdm\n(Type B)', 'FC paths']
    plt.xticks(pos, labels, fontsize=10)
    plt.gca().tick_params(axis='both', which='major', labelsize=5)
    # plt.ylabel('Sequential GO similarity', fontsize=13);
    # plt.ylim([None,9.3])
    plt.title(ylbl_short[i], fontsize=7)
plt.suptitle('Sequential similarity of similar disease pairs', fontsize=20, y=1.02)
plt.tight_layout()

if not args.dry:
    plt.savefig(out_file)

if not args.no_show:
    plt.show()


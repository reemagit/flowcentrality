
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

parser = argparse.ArgumentParser(description='Plot related disease pairs GO p-values')
parser.add_argument('--config', type=str, default=None, help='Configuration file')
parser.add_argument('--dry', action='store_true', help='Dry run')
parser.add_argument('--no_show', action='store_true', help='Do not show plots')
parser.add_argument('--out_file', default=None, help='Override output filepath')
args = parser.parse_args()

if args.out_file is None:
    out_file = '../gendata/plots/disease_pairs_go_pvals.pdf'
else:
    out_file = args.out_file

if args.config is not None:
    config = utils.read_config(args.config)

diseases = pd.read_csv('../data/disease_ontology/processed/diseases_size_min_50.tsv',sep='\t', index_col='diseaseId')
obs_dir = '../gendata/seqsim/disgenet_diseases/related'
rdm_dir = '../gendata/seqsim/random_genesets'
N_samples = 100

pairs = [pair.replace('.nonrect','').split('_') for pair in listdir(rdm_dir)]

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

plotdata = np.minimum(np.full(len(pvals_typea),200),-np.log10(np.maximum(pvals_typea,pvals_typeb)))
delta=10
fontsize=10
plt.figure(figsize=[10,15])
plt.barh(range(len(obs_seqsims)),plotdata, color='lightcoral', edgecolor='darkred', linewidth=1)
for i,pval in enumerate(np.maximum(pvals_typea,pvals_typeb)):
    if np.isinf(plotdata[i]):
        plt.text(0+delta, i, "p-val:0",fontsize=fontsize, va='center')
    else:
        plt.text(plotdata[i]+delta, i, "p-val:{:.02e}".format(pval),fontsize=fontsize, va='center')
plt.yticks(range(len(obs_seqsims)),ylbl, fontsize=10);
plt.gca().invert_yaxis()
plt.ylim([-0.8,len(obs_seqsims)-0.3])
plt.xlim([None, 270])
plt.gca().spines['top'].set_visible(False)
plt.gca().spines['right'].set_visible(False)
plt.gca().spines['bottom'].set_visible(False)
plt.gca().spines['left'].set_visible(False)
plt.xlabel('-log(p-value)',fontsize=10)
plt.title('Related disease pairs scores',fontsize=15)
plt.gca().invert_yaxis()
plt.tight_layout(w_pad=0.5)

if not args.dry:
    plt.savefig(out_file)

if not args.no_show:
    plt.show()


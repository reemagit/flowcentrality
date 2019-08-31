
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

parser = argparse.ArgumentParser(description='Plot overlap p-values between asthma and COPD seeds and UK Biobank genes')
parser.add_argument('--config', type=str, default=None, help='Configuration file')
parser.add_argument('--dry', action='store_true', help='Dry run')
parser.add_argument('--no_show', action='store_true', help='Do not show plots')
parser.add_argument('--out_file', default=None, help='Override output filepath')
args = parser.parse_args()

if args.out_file is None:
    out_file = '../gendata/plots/ukb_overlap_pvals.pdf'
else:
    out_file = args.out_file

if args.config is not None:
    config = utils.read_config(args.config)

pvals_asthma = np.loadtxt('../gendata/diamond_modules/asthma/biobank_cutoff_pvals.dat')
pvals_copd = np.loadtxt('../gendata/diamond_modules/copd/biobank_cutoff_pvals.dat')
overlap_asthma = 26 # measured on notebook
overlap_copd = 12 # measured on notebook

plt.figure(figsize=[10,4])
plt.subplot(1,2,1)
plt.semilogy(pvals_asthma)
imin = np.argmin(pvals_asthma)+1
plt.annotate('p-val={:.02e}\nN.genes={}\nUKB overlap={}'.format(pvals_asthma[imin],imin+1,overlap_asthma), (imin, pvals_asthma[imin]), xytext=(imin+100, pvals_asthma[imin]))
plt.plot(imin, pvals_asthma[imin],'*',color='red', markersize=10)
plt.title('UKB asthma genes enrichment',fontsize=13,pad=10)
plt.xlabel('DIAMOND iteration',fontsize=10)
plt.ylabel('hypergeom. p-value',fontsize=10)
plt.subplot(1,2,2)
plt.semilogy(pvals_copd)
imin = np.argmin(pvals_copd)
plt.annotate('p-val={:.02e}\nN.genes={}\nUKB overlap={}'.format(pvals_copd[imin],imin+1,overlap_copd), (imin, pvals_copd[imin]), xytext=(imin+100, pvals_copd[imin]))
plt.plot(imin, pvals_copd[imin],'*', color='red', markersize=10)
plt.title('UKB COPD genes enrichment',fontsize=13,pad=10)
plt.xlabel('DIAMOND iteration',fontsize=10)
plt.ylabel('hypergeom. p-value',fontsize=10)

if not args.dry:
    plt.savefig(out_file)

if not args.no_show:
    plt.show()


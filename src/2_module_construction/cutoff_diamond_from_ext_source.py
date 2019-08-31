#!/usr/bin/env python3
"""
Put a cutoff on DIAMOND prioritization
"""

__author__ = "Enrico Maiorino"
__version__ = "0.1.0"
__license__ = "MIT"

import argparse
import logging
from funcs import utils
import numpy as np
import matplotlib.pyplot as plt

def main(args):
    logging.basicConfig(level=logging.INFO,
                        format='%(module)s:%(levelname)s:%(asctime)s:%(message)s',
                            handlers=[logging.FileHandler("../logs/report.log"),logging.StreamHandler()])
    logging.info(args)

    seeds = utils.read_gene_list(args.in_seed_path)
    candidates = utils.read_gene_list(args.in_candidate_path)
    net = utils.read_network(args.net_path)
    ext = [gene for gene in utils.read_gene_list(args.in_extgenes_path) if gene not in seeds and gene in net]

    pvals = np.zeros(len(candidates))
    for i in range(len(candidates)):
        pvals[i] = utils.fisher_overlap_set(candidates[:i+1], ext, list(net.nodes()))

    i_min = np.argmin(pvals)
    module = seeds + candidates[:i_min+1]

    np.savetxt(args.out_pvals_path, pvals)
    utils.write_gene_list(args.out_module_path, module)

    if args.plot:
        import matplotlib.pyplot as plt
        plt.semilogy(pvals)
        plt.title("Cutoff: {}, size: {}".format(i_min,len(module)))
        plt.show()

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('in_seed_path', type=str, help='Filepath of input seed genes file')
    parser.add_argument('in_candidate_path', type=str, help='Filepath of input prioritized candidate genes file')
    parser.add_argument('in_extgenes_path', type=str, help='Filepath of genes from external source')
    parser.add_argument('net_path', type=str, default=None, help='Network filepath')
    parser.add_argument('out_module_path', type=str, help='Filepath of output module file')
    parser.add_argument('out_pvals_path', type=str, help='Filepath of output pvalues file')
    parser.add_argument('--plot', action='store_true', help='Plot the result')
    args = parser.parse_args()

    main(args)
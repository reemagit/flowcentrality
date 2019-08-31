#!/usr/bin/env python3
"""
Generate random samples of genes sets
"""

__author__ = "Enrico Maiorino"
__version__ = "0.1.0"
__license__ = "MIT"

import argparse
import logging
from funcs import utils
from libs.Flower import deg_preserve_generator as gen
from os import listdir
from os.path import join
from tqdm.autonotebook import tqdm

parser = argparse.ArgumentParser(description='Generate random DIAMOND samples')
parser.add_argument('in_genesets_dir', type=str, help='Directory input geneset files')
parser.add_argument('net_path', type=str, default=None, help='Network filepath')
parser.add_argument('out_samples_dir', type=str, help='Directory of output random samples files')
parser.add_argument('--N_samples', type=int, default=1000, help='Number of samples')
parser.add_argument('--N_per_bin', type=int, default=30, help='Minimum number of nodes per degree bin')
parser.add_argument('--rdmseed', type=int, default=None, help='RNG seed')
args = parser.parse_args()

logging.basicConfig(level=logging.INFO,
                    format='%(module)s:%(levelname)s:%(asctime)s:%(message)s',
                        handlers=[logging.FileHandler("../logs/report.log"),logging.StreamHandler()])
logging.info(args)

files = listdir(args.in_genesets_dir)
net = utils.read_network(args.net_path)

#def gen_samples(file):
for file in tqdm(files):
    genes = utils.read_gene_list(join(args.in_genesets_dir, file))
    samples = gen.gen_degree_preserved_sets(genes, net, args.N_samples, args.N_per_bin,rdmseed=args.rdmseed)
    utils.write_genesets_list(join(args.out_samples_dir, file), samples)

#utils.parallel_process(gen_samples, files, n_jobs=8)

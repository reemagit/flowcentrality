"""
Module Docstring
"""

__author__ = "Your Name"
__version__ = "0.1.0"
__license__ = "MIT"

import argparse
import pandas as pd
import flower
import utils

def main(args):

    print ("Loading SPM data...")

    spm = flower.load_spm(args.spm_file)

    nodelist = spm['nodelist']

    srcmodules = utils.load_nodeset_file(args.srcmodules_file, sep=args.sep)
    destmodules = utils.load_nodeset_file(args.destmodules_file, sep=args.sep)
    if not isinstance(nodelist[0], str):
        srcmodules = list(map(lambda x: list(map(int, x)), srcmodules))
        destmodules = list(map(lambda x: list(map(int, x)), destmodules))

    print ("Evaluating flows...")
    flows_batch = flower.evaluate_flows_batch_nx(srcmodules, destmodules, spm, n_threads=args.n_threads)

    print ("Completed.")

    print ("Writing to file...")
    flows_batch.to_csv(args.output_file, sep='\t')
    print ("Completed.")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Evaluate flow centrality values')
    parser.add_argument('srcmodules_file', type=str, help='Source modules, one node set per line, tab-separated')
    parser.add_argument('destmodules_file', type=str, help='Destination modules, one node set per line, tab-separated')
    parser.add_argument('spm_file', type=str, help='Shortest Path Metrics file')
    parser.add_argument('output_file', type=str, help='Flow values output filepath')
    parser.add_argument('--sep', type=str, default='\t', help='Separator character for modules files')
    parser.add_argument('-n', '--n_threads', type=int, default=None, help='Number of cores to use (default: all cores)')
    args = parser.parse_args()
    main(args)
"""
Module Docstring
"""

__author__ = "Your Name"
__version__ = "0.1.0"
__license__ = "MIT"

import argparse
import pandas as pd
import flower

def main(args):

    print ("Loading SPM data...")

    spm = flower.load_spm(args.spm_file)

    nodelist = spm['nodelist']

    srcmodules = pd.read_csv(args.srcmodules_file, sep=args.sep).values.tolist()
    destmodules = pd.read_csv(args.destmodules_file, sep=args.sep).values.tolist()

    if type(nodelist[0]) is int:
        srcmodules = map(lambda x: map(int,x), srcmodules)
        destmodules = map(lambda x: map(int,x), destmodules)

    print ("Evaluating flows...")

    flows_batch = flower.evaluate_flows_statistics_nx(srcmodules, destmodules, spm, true_flows=, n_threads=args.n_threads)

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
    parser.add_argument('true_flows_file', type=str, help='Filepath of true flow centrality values (for p-value calculation)')
    parser.add_argument('--sep', type=str, default='\t', help='separator character for modules files')
    parser.add_argument('-n', '--n_threads', type=int, default=1, help='Number of cores to use')
    args = parser.parse_args()
    main(args)



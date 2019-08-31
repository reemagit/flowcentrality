"""
Module Docstring
"""

__author__ = "Your Name"
__version__ = "0.1.0"
__license__ = "MIT"

import networkx as nx
import argparse
import pandas as pd
import flower
import utils

def main(args):
    print ("Loading SPM data...")

    spm_data = flower.load_spm(args.spm_file)

    srcnodes = utils.load_nodeset_file(args.srcnodes_file, sep=args.sep, as_column=args.as_col)
    destnodes = utils.load_nodeset_file(args.destnodes_file, sep=args.sep, as_column=args.as_col)

    print(len(srcnodes),len(destnodes))
    if not isinstance(spm_data['nodelist'][0], str):
        srcnodes = list(map(int, srcnodes))
        destnodes = list(map(int, destnodes))
    print ("Evaluating flows...")

    flows = flower.eval_flow_centrality_nx(srcnodes, destnodes, spm=spm_data)

    print ("Completed.")

    print (flows.iloc[:10])

    print ("Writing to file...")
    flows.to_csv(args.output_file, sep='\t')
    print ("Completed.")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Evaluate flow centrality values')
    parser.add_argument('srcnodes_file', type=str, help='Source nodes IDs in one row separated by --sep')
    parser.add_argument('destnodes_file', type=str, help='Destination nodes IDs in one row separated by --sep')
    parser.add_argument('spm_file', type=str, help='Shortest Path Metrics file')
    parser.add_argument('output_file', type=str, help='Flow values output filepath')
    parser.add_argument('--sep', type=str, default='\t', help='Separator character for modules files')
    parser.add_argument('--as_col', action='store_true', help='Whether to load srcnodes and destnodes as column file (--sep is ignored)')
    args = parser.parse_args()
    main(args)
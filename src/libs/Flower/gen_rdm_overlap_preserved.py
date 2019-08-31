"""
Module Docstring
"""

__author__ = "Your Name"
__version__ = "0.1.0"
__license__ = "MIT"

import argparse
import pandas as pd
import deg_preserve_generator as gen
import utils
import networkx as nx

def main(args):

    print("Loading data...")
    nodetype = int if args.int_nodeid else str
    G = nx.read_edgelist(args.network_file, nodetype=nodetype)

    nodeset1 = utils.load_nodeset_file(args.nodeset1_file, sep=args.sep)
    if args.int_nodeid:
        nodeset1 = list(map(int, nodeset1))
    nodeset2 = utils.load_nodeset_file(args.nodeset2_file, sep=args.sep)
    if args.int_nodeid:
        nodeset2 = list(map(int, nodeset2))


    print("Generating...")

    samples1, samples2 = gen.gen_overlap_preserved_sets(nodeset1, nodeset2, G, 1000, fix_nodeset1=args.fixed_src, fix_nodeset2=args.fixed_dest)

    print ("Writing to file...")

    samples1_df = pd.DataFrame(samples1)
    samples1_df.to_csv(args.output1_file, sep=args.sep, index=False, header=False)
    samples2_df = pd.DataFrame(samples2)
    samples2_df.to_csv(args.output2_file, sep=args.sep, index=False, header=False)
    print ("Completed.")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Evaluate flow centrality values')
    parser.add_argument('nodeset1_file', type=str, help='Nodeset 1 file path')
    parser.add_argument('nodeset2_file', type=str, help='Nodeset 2 file path')
    parser.add_argument('network_file', type=str, help='Network file path')
    parser.add_argument('output1_file', type=str, help='Sample output file path for nodeset 1')
    parser.add_argument('output2_file', type=str, help='Sample output file path for nodeset 2')
    parser.add_argument('--N_samples', type=int, default=1000, help='Number of samples')
    parser.add_argument('--N_per_bin', type=int, default=30, help='Minimum number of nodes per degree bin')
    parser.add_argument('--fixed_src', action='store_true', help='Keep the source module fixed')
    parser.add_argument('--fixed_dest', action='store_true', help='Keep the destination module fixed')
    parser.add_argument('-i', '--int_nodeid', action='store_true', help='Treat the node IDs as integers')
    parser.add_argument('--sep', type=str, default='\t', help='Separator character for nodesets files and output')
    args = parser.parse_args()
    main(args)
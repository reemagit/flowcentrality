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

    nodeset = utils.load_nodeset_file(args.nodeset_file, sep=args.sep)
    if args.int_nodeid:
        nodeset = list(map(int, nodeset))

    print("Generating...")
    samples = gen.gen_degree_preserved_sets(nodeset, G, args.N_samples, args.N_per_bin, rdmseed=args.rdmseed)

    print ("Writing to file...")
    samples_df = pd.DataFrame(samples)
    samples_df.to_csv(args.output_file, sep=args.sep, index=False, header=False)
    print ("Completed.")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Evaluate flow centrality values')
    parser.add_argument('nodeset_file', type=str, help='Nodeset file path')
    parser.add_argument('network_file', type=str, help='Network file path')
    parser.add_argument('output_file', type=str, help='Sample output file path')
    parser.add_argument('--N_samples', type=int, default=1000, help='Number of samples')
    parser.add_argument('--N_per_bin', type=int, default=30, help='Minimum number of nodes per degree bin')
    parser.add_argument('-i', '--int_nodeid', action='store_true', help='Treat the node IDs as integers')
    parser.add_argument('--sep', type=str, default='\t', help='Separator character for nodesets files and output')
    parser.add_argument('--rdmseed', type=int, default=None,
                        help='Random seed')
    args = parser.parse_args()
    main(args)
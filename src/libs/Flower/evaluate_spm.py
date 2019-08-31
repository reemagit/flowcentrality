"""
Module Docstring
"""

__author__ = "Your Name"
__version__ = "0.1.0"
__license__ = "MIT"


import networkx as nx
import argparse
import flower

def main(args):
    """ Main entry point of the app """

    print ("Loading graph...")

    nodetype = int if args.int_nodeid else str
    G = nx.read_edgelist(args.network_file,nodetype=nodetype)

    nodelist = list(G.nodes())

    A = nx.adjacency_matrix(G, nodelist=nodelist)

    print("Number of nodes: ", len(G))

    print("Completed.")

    print("Evaluating Shortest Path Metrics...")
    num_paths, path_lengths, deglist, curr_iter = flower.calculate_spm(A, args.max_path_length)
    print("Completed.")

    print("Writing...")
    flower.save_spm(args.output, num_paths=num_paths, path_lengths=path_lengths, nodelist=nodelist, deglist=deglist,
             curr_iter=curr_iter)
    print("Completed.")


if __name__ == "__main__":
    """ This is executed when run from the command line """
    parser = argparse.ArgumentParser(description='Evaluate Shortest Path Metrics (SPM)')
    parser.add_argument('network_file', type=str, help='Input network filepath as edge list')
    parser.add_argument('output', type=str, default=None, help='Output SPM file (.spm)')
    parser.add_argument('--max_path_length', type=int, default=15, help='Maximum shortest path length')
    parser.add_argument('-i','--int_nodeid', action='store_true', help='Treat the node IDs as integers')
    args = parser.parse_args()
    main(args)
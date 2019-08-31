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

    if args.rdm_fc_path is None and (args.rdm_src_path is None or args.rdm_dest_path is None):
        raise ValueError('Either rdm_fc_path or (rdm_src_path, rdm_dest_path) have to be specified!')

    print ("Loading SPM data...")

    spm = flower.load_spm(args.spm_file)

    nodelist = spm['nodelist']
    srcnodes = utils.load_nodeset_file(args.srcnodes_file, sep=args.sep, as_column=args.as_col)
    destnodes = utils.load_nodeset_file(args.destnodes_file, sep=args.sep, as_column=args.as_col)

    if not isinstance(nodelist[0], str):
        srcnodes = list(map(int, srcnodes))
        destnodes = list(map(int, destnodes))

    print ("Evaluating flows...")

    if args.rdm_fc_path is None:
        rdm_srcmodules = utils.load_nodeset_file(args.rdm_src_path, sep=args.sep)
        rdm_destmodules = utils.load_nodeset_file(args.rdm_dest_path, sep=args.sep)
        if not isinstance(nodelist[0], str):
            rdm_srcmodules = map(lambda x: map(int, x), rdm_srcmodules)
            rdm_destmodules = map(lambda x: map(int, x), rdm_destmodules)

        fcs = flower.evaluate_fcs_nx(srcnodes, destnodes, rdm_srcmodules, rdm_destmodules, spm, fill_na=args.fill_na, n_threads=args.n_threads)

    else:
        rdm_fc = pd.read_csv(args.rdm_fc_path,sep='\t',index_col=0)
        fc = flower.eval_flow_centrality_nx(srcnodes,destnodes,spm)
        fcs = flower.evaluate_flows_statistics_from_batch_nx(rdm_fc, fc)
        fcs = flower.enrich_flows_table_nx(srcnodes, destnodes, fcs, spm, fill_na=args.fill_na)

    print ("Completed.")

    print ("Writing to file...")
    fcs.to_csv(args.output_file, sep=args.sep)
    print ("Completed.")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Evaluate flow centrality scores')
    parser.add_argument('srcnodes_file', type=str, help='Source nodes, (sep)-separated')
    parser.add_argument('destnodes_file', type=str, help='Destination nodes, (sep)-separated')
    parser.add_argument('spm_file', type=str, help='Shortest Path Metrics file')
    parser.add_argument('output_file', type=str, help='Flow values output filepath')
    parser.add_argument('--rdm_fc_path', type=str, default=None, help='Filepath of precalculated random FC values')
    parser.add_argument('--rdm_src_path', type=str, default=None, help='Randomized source modules, one node set per line, (sep)-separated, ignored if {rdm_fc_path} is provided')
    parser.add_argument('--rdm_dest_path', type=str, default=None, help='Randomized destination modules, one node set per line, (sep)-separated, ignored if {rdm_fc_path} is provided')
    parser.add_argument('--fill_na', action='store_true', help='Whether to replace the NaN and inf zscores values with 0 values')
    parser.add_argument('-n', '--n_threads', type=int, default=1, help='Number of cores to use')
    parser.add_argument('--sep', type=str, default='\t', help='Separator character for node set files')
    parser.add_argument('--as_col', action='store_true', help='Whether to load srcnodes and destnodes as column file (--sep is ignored)')
    args = parser.parse_args()
    main(args)
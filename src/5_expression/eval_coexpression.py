

"""
Module Docstring
"""

__author__ = "Enrico Maiorino"
__version__ = "0.1.0"
__license__ = "MIT"

import argparse
import logging
from funcs import utils
import numpy as np
from os.path import dirname
from tqdm.autonotebook import tqdm

def get_abscorr(i, j, corrdata):
    method = 'pearson' if not args.spearman else 'spearman'
    corrmatr = corrdata.loc[[i, j]].T.corr(method)
    return corrmatr.abs().groupby('ENTREZ_GENE_ID').apply(lambda x: x.max()).T.groupby('ENTREZ_GENE_ID').apply(lambda x: x.max()).values[0, 1]

def get_seq_corr(path, corrdata):
    if not np.all([gene in corrdata.index.tolist() for gene in path]):
        return np.nan
    return np.mean([get_abscorr(path[i], path[i + 1], corrdata) for i in range(len(path) - 1)])

def wrapper(wrapped):
    return get_seq_corr(*wrapped)

def main(args):
    logging.basicConfig(level=logging.INFO,
                        format='%(module)s:%(levelname)s:%(asctime)s:%(message)s',
                        handlers=[logging.FileHandler("../logs/report.log"),
                                  logging.StreamHandler()])
    logging.info(args)

    paths = utils.read_paths(args.paths_file)
    expr = utils.read_expr(args.expr_file)
    gsm = utils.read_text(args.gsm_file)
    expr = expr[gsm]

    if args.n_cores > 1:
        seqcorrs = utils.parallel_process(wrapper, [(path, expr) for path in paths], n_jobs=args.n_cores) # for some reason this is slower
    else:
        seqcorrs = []
        for path in tqdm(paths):
            seqcorrs.append(get_seq_corr(path, expr))
        #seqcorrs = list(map(wrapper, tqdm([(path, expr) for path in paths])))
    utils.create_dir_if_not_exist(dirname(args.out_seqcorr_file))
    np.savetxt(args.out_seqcorr_file, seqcorrs)



if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Evaluate sequential coexpression')
    parser.add_argument('paths_file', type=str, help='Filename of paths file')
    parser.add_argument('expr_file', type=str, help='Filename of expression file')
    parser.add_argument('gsm_file', type=str, help='Filename of GSM IDs to consider')
    parser.add_argument('out_seqcorr_file', type=str, help='Output sequential correlation file')
    parser.add_argument('-s', '--spearman', action='store_true', help='Whether to use Spearman correlation')
    parser.add_argument('-n','--n_cores', type=int, default=1, help='Number of cores')
    args = parser.parse_args()
    main(args)
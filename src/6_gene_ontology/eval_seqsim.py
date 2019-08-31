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
from p_tqdm import p_map

from goatools import obo_parser
from goatools.associations import read_ncbi_gene2go
from goatools.semantic import TermCounts, get_info_content
from goatools.semantic import resnik_sim, lin_sim


def get_sim(genes_pair, go, gene2go, termcounts):
    # sim_measure = lin_sim
    i,j = genes_pair[0],genes_pair[1]
    i_go = [goterm for goterm in gene2go[i] if goterm in go]
    j_go = [goterm for goterm in gene2go[j] if goterm in go]
    sims = []
    for i_go_term in i_go:
        def wrap(j_go_term):
            return resnik_sim(i_go_term, j_go_term, go, termcounts)
        simlist = [sim for sim in map(wrap, j_go) if sim is not None]
        if len(simlist):
            sims.append(max(simlist))
    for j_go_term in j_go:
        def wrap(i_go_term):
            return resnik_sim(i_go_term, j_go_term, go, termcounts)
        simlist = [sim for sim in map(wrap, i_go) if sim is not None]
        if len(simlist):
            sims.append(max(simlist))
    return np.mean(sims)

def get_path_sim(path, go, gene2go, termcounts):
    if np.all([gene in gene2go.keys() for gene in path]):
        sims = []
        for i in range(len(path)-1):
            sims.append(get_sim([path[i],path[i+1]], go=go, gene2go=gene2go, termcounts=termcounts))
        return np.mean(sims)
    else:
        return np.nan

def wrap(wrapped):
    return get_path_sim(*wrapped)

def main(args):
    logging.basicConfig(level=logging.INFO,
                        format='%(module)s:%(levelname)s:%(asctime)s:%(message)s',
                        handlers=[logging.FileHandler("../logs/report.log"),
                                  logging.StreamHandler()])
    logging.info(args)

    paths = utils.read_paths(args.paths_file)

    go = obo_parser.GODag(args.obo_file)
    gene2go = read_ncbi_gene2go(args.gene2go_file, taxids=[9606])
    termcounts = TermCounts(go, gene2go)

    if args.namespace is not None:
        if args.namespace == 'cc':
            go = {go_term: values for go_term, values in go.items() if values.namespace == 'cellular_component'}
        elif args.namespace == 'mf':
            go = {go_term: values for go_term, values in go.items() if values.namespace == 'molecular_function'}
        elif args.namespace == 'bp':
            go = {go_term: values for go_term, values in go.items() if values.namespace == 'biological_process'}
        else:
            raise ValueError('namespace can be only cc, mf or bp')

    wrapped = [[path, go, gene2go, termcounts] for path in paths]
    if args.n_cores > 1:
        sims = list(p_map(wrap, wrapped))
    else:
        sims = list(map(wrap, tqdm(wrapped)))

    utils.create_dir_if_not_exist(dirname(args.out_sims_file))
    np.savetxt(args.out_sims_file, sims)



if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Evaluate sequential coexpression')
    parser.add_argument('paths_file', type=str, help='Filename of paths file')
    parser.add_argument('obo_file', type=str, help='Filename of OBO file')
    parser.add_argument('gene2go_file', type=str, help='Filename of gene2go file')

    parser.add_argument('out_sims_file', type=str, help='Output sequential similarity file')
    parser.add_argument('-s','--namespace', type=str, default=None, help='Namespace (cc, mf, bp)')
    parser.add_argument('-n','--n_cores', type=int, default=1, help='Number of cores')
    args = parser.parse_args()
    main(args)
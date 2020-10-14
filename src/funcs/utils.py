import pandas as pd
#from MyPythonLibs3 import bio
import networkx as nx
from tqdm.autonotebook import tqdm
from concurrent.futures import ProcessPoolExecutor, as_completed
import numpy as np
import os
from os.path import join, exists
from scipy.stats import mannwhitneyu
import matplotlib.pyplot as plt

def create_gidmap():
    from funcs.gidmap import GeneIDMap
    gmap = GeneIDMap()
    gmap.load_table('biomart', 'data/gene_info_genenames.txt', col2idtype_map={'Approved symbol':'symbol','NCBI Gene ID':'entrez','Ensembl gene ID':'ensembl'})
    #gmap.load_dict('ppi', ms.GENE_ID_CACHE_DATA)
    return gmap

gm = create_gidmap()

def read_gene_list(filepath):
    return pd.read_csv(filepath, header=None)[0].tolist()
def write_gene_list(filepath, genelist):
    pd.Series(genelist).to_csv(filepath, index=False, header=False)
def write_genesets_list(filepath, genesets):
    np.savetxt(filepath, genesets, fmt='%d', delimiter='\t')
def read_genesets_list(filepath):
    return np.loadtxt(filepath, delimiter='\t')

def read_network(filepath):
    return nx.read_edgelist(filepath, nodetype=int, delimiter='\t')

def read_flows(filepath):
    return pd.read_csv(filepath,sep='\t',index_col=0)

def read_paths(filepath):
    with open(filepath, 'r') as f:
        return [list(map(int,line.rstrip().split(','))) for line in f.readlines()]
def write_paths(filepath, paths):
    with open(filepath, 'w') as f:
        for path in paths:
            f.write(','.join(map(str,path)) + '\n')

def read_text(filepath):
    with open(filepath, 'r') as f:
        return [line.rstrip() for line in f.readlines()]

def write_text(filepath, lines):
    with open(filepath, 'w') as f:
        for line in lines:
            f.write(line + '\n')

def read_expr(filepath):
    return pd.read_csv(filepath, sep='\t',index_col='ENTREZ_GENE_ID')

def write_expr(filepath, expr):
    expr.to_csv(filepath, sep='\t')


def read_nonrectangular(filepath):
    with open(filepath, 'r') as f:
        return [list(map(float,line.rstrip().split(','))) for line in f.readlines()]
def write_nonrectangular(filepath, lines):
    with open(filepath, 'w') as f:
        for line in lines:
            f.write(','.join(map(str,line)) + '\n')

def read_config(filepath):
    import yaml
    with open(filepath, 'r') as stream:
        try:
            return yaml.safe_load(stream)
        except yaml.YAMLError as exc:
            print(exc)

def create_dir_if_not_exist(dirpath):
    if not exists(dirpath):
        os.makedirs(dirpath)

def parallel_process(function, array, n_jobs=None, use_kwargs=False, front_num=0, leave=True, mute=False):
    """
        A parallel version of the map function with a progress bar.

        Args:
            array (array-like): An array to iterate over.
            function (function): A python function to apply to the elements of array
            n_jobs (int, default=16): The number of cores to use
            use_kwargs (boolean, default=False): Whether to consider the elements of array as dictionaries of
                keyword arguments to function
            front_num (int, default=3): The number of iterations to run serially before kicking off the parallel job.
                Useful for catching bugs
        Returns:
            [function(array[0]), function(array[1]), ...]
    """
    bar_func = tqdm
    if mute:
        def identity(x, *args, **kwargs):
            return x
        bar_func = identity

    front = []
    #We run the first few iterations serially to catch bugs
    if front_num > 0:
        front = [function(**a) if use_kwargs else function(a) for a in array[:front_num]]
    #If we set n_jobs to 1, just run a list comprehension. This is useful for benchmarking and debugging.
    if n_jobs==1:
        return front + [function(**a) if use_kwargs else function(a) for a in tqdm(array[front_num:])]
    #Assemble the workers
    with ProcessPoolExecutor(max_workers=n_jobs) as pool:
        #Pass the elements of array into function
        if use_kwargs:
            futures = [pool.submit(function, **a) for a in array[front_num:]]
        else:
            futures = [pool.submit(function, a) for a in array[front_num:]]
        kwargs = {
            'total': len(futures),
            'unit': 'it',
            'unit_scale': True,
            'leave': leave
        }
        #Print out the progress as tasks complete

        for f in bar_func(as_completed(futures), **kwargs):
            pass
    out = []
    #Get the results from the futures.
    for i, future in bar_func(enumerate(futures)):
        try:
            out.append(future.result())
        except Exception as e:
            out.append(e)
    return front + out

def pack_variables(list_var, *other_vars):
    return [[elem]+list(other_vars) for elem in list_var]

def fisher_overlap(n_overlap, n1, n2, n_background):
    import fisher
    return fisher.pvalue(n_background - (n1 + n2 - n_overlap), n2 - n_overlap, n1 - n_overlap, n_overlap).right_tail

def fisher_overlap_set(set1, set2, background, check_consistency=True):
    if check_consistency:
        assert len(set1) == len(set(set1))
        assert len(set2) == len(set(set2))
        assert len(background) == len(set(background))
        assert set(set1).issubset(set(background))
        assert set(set2).issubset(set(background))
    n_overlap = len(set(set1).intersection(set(set2)))
    n1 = len(set1)
    n2 = len(set2)
    n_background = len(background)
    return fisher_overlap(n_overlap=n_overlap, n1=n1, n2=n2, n_background=n_background)

def non_nan(arr):
    arr = np.asarray(arr)
    return arr[~np.isnan(arr)]
def mwpval(obs,rdm):
    return mannwhitneyu(non_nan(obs),non_nan(rdm),alternative='greater').pvalue

def trim_text(string, maxchar=10):
    if len(string) > maxchar:
        return string[:maxchar-3] + '...'
    return string

def plot_significances(data_list, pos_list = None, delta_ratio = 30, bounds=None, no_fliers=False):
    if no_fliers:
        def whiskmax(data):
            iqr = np.percentile(data, 75) - np.percentile(data, 25)
            return data[data <= np.percentile(data, 75) + 1.5 * iqr].max()
        def whiskmin(data):
            iqr = np.percentile(data, 75) - np.percentile(data, 25)
            return data[data >= np.percentile(data, 25) - 1.5 * iqr].min()
        min_ = min([whiskmin(non_nan(data)) for pair in data_list for data in pair])
        max_ = max([whiskmax(non_nan(data)) for pair in data_list for data in pair])
    else:
        min_ = min([min(non_nan(data)) for pair in data_list for data in pair])
        max_ = max([max(non_nan(data)) for pair in data_list for data in pair])
    delta = (max_ - min_) / delta_ratio
    offset = 0
    if bounds is None:
        bounds = [1e-10, 1e-4, 0.05]
    bounds = [-np.inf] + bounds + [np.inf]
    sigtexts = ['***','**','*','n.s.']
    for pair,pos in zip(data_list, pos_list):
        pval = mwpval(non_nan(pair[1]), non_nan(pair[0]))
        sigtext = sigtexts[np.digitize(pval, bounds)-1]
        x1,x2 = pos
        y = max_+offset+delta
        plt.plot([x1, x1, x2, x2], [y, y+delta, y+delta, y], lw=1., c='black')
        plt.text((x1 + x2) * .5, y+delta, sigtext, ha='center', va='bottom', color='black')
        offset += delta * 4
    if plt.gca().get_ylim()[1] < max_ + offset + delta:
        plt.gca().set_ylim([None, max_ + offset + 3*delta])

def plot_significances_paths(data_list, pos=None, delta_ratio = 30, no_fliers=False):
    if pos is None:
        pos = [1,2,3]
    plot_significances([[data_list[1],data_list[2]], [data_list[0],data_list[2]]], [[pos[1],pos[2]],[pos[0],pos[2]]], delta_ratio = delta_ratio, no_fliers=no_fliers)
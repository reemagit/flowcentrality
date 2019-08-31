from __future__ import division
import numpy as np
from scipy.sparse import csr_matrix, issparse
import networkx as nx
import utils
import pandas as pd
from tqdm.auto import tqdm

def calculate_spm(A_matr, max_path_length, verbose=True):
    from tqdm.auto import tqdm
    if not issparse(A_matr):
        A = csr_matrix(A_matr)
    else:
        A = A_matr
    curr_iter = 1
    if curr_iter < max_path_length:
        if curr_iter == 1:
            if verbose:
                print("First iteration...")
            num_paths = A.copy()
            path_lengths = A.copy()
            curr_state = A.copy()
            curr_iter += 1
        if verbose:
            print( "Paths calculation...")
        pbar = tqdm(range(curr_iter, max_path_length + 1), desc="Calculating paths")
        for i in pbar:
            if float(num_paths.getnnz()) / (A.shape[0] ** 2) == 1:
                print("Execution finished earlier, all paths have been already calculated at maximum distance {}".format(curr_iter-1))
                curr_iter = -1
                break
            pbar.set_description("Dot product (1/5)")
            pbar.refresh()
            curr_state = np.dot(A, curr_state)
            pbar.set_description("Masking (2/5)")
            pbar.refresh()
            msk = (1 - np.sign(num_paths.todense()))
            pbar.set_description("Var num_paths_temp (3/5)")
            pbar.refresh()
            num_paths_temp = curr_state.multiply(msk)
            pbar.set_description("Summing num_paths (4/5)")
            pbar.refresh()
            num_paths += num_paths_temp
            pbar.set_description("Summing path_lengths (5/5)")
            pbar.refresh()
            path_lengths += num_paths_temp.sign() * i
            curr_iter += 1
        num_paths_d = np.asarray(num_paths.todense())
        path_lengths_d = np.asarray(path_lengths.todense())

        np.fill_diagonal(num_paths_d, 0)
        np.fill_diagonal(path_lengths_d, 0)
    deglist = np.asarray(A.sum(axis=0))[0,:]
    return num_paths_d, path_lengths_d, deglist, curr_iter

def calculate_spm_nx(nxgraph, max_path_length, nodelist=None, verbose=True):
    if nodelist is None:
        nodelist = list(nxgraph.nodes())
    num_paths, path_lengths, deglist , curr_iter = calculate_spm(nx.adjacency_matrix(nxgraph, nodelist=nodelist), max_path_length=max_path_length, verbose=verbose)
    return {'num_paths':num_paths, 'path_lengths': path_lengths, 'nodelist':nodelist, 'deglist':deglist, 'curr_iter':curr_iter}

def eval_flow_centrality(nodes_src, nodes_dest, spm=None, num_paths=None, path_lengths=None, deglist=None, output_mode='ALL', progressbar=True):
    if spm is None:
        if num_paths is None or path_lengths is None or deglist is None:
            raise ValueError("eval_flow_centrality has to receive as input either (1) spm dictionary or (2) num_paths, path_lengths and deglist variables.")
    else:
        num_paths = spm['num_paths']
        path_lengths = spm['path_lengths']
        deglist = spm['deglist']
    N = num_paths.shape[0]
    ratios = np.zeros([N, 3])
    N_dest, N_src = len(nodes_dest), len(nodes_src)

    nodes_dest_np = np.array(nodes_dest)[:, None]
    nodes_src_np = np.array(nodes_src)

    if not progressbar:
        rangefun = range(N)
    else:
        from tqdm.auto import trange
        rangefun = trange(N, desc="Calculating flows...", leave=True)
    path_lengths_msk = path_lengths[nodes_dest_np, nodes_src_np]
    path_lengths_msk_dest = path_lengths[nodes_dest_np[:,0], :]
    path_lengths_msk_src = path_lengths[:, nodes_src_np]

    num_paths_msk = num_paths[nodes_dest_np, nodes_src_np]
    num_paths_msk_dest = num_paths[nodes_dest_np[:,0], :]
    num_paths_msk_src = num_paths[:, nodes_src_np]

    for node_i in rangefun:
        if deglist[node_i] == 1:  # if the degree of the node is 1 it has no flow centrality so ignore it
            ratios[node_i, :] = [0, 0, 0]
        else:
            msk1 = path_lengths_msk == path_lengths_msk_dest[:, node_i, None] + path_lengths_msk_src[None, node_i, :]
            msk2 = (path_lengths_msk_dest[:, node_i, None] >= 1) & (path_lengths_msk_src[None, node_i, :] >= 1) # to avoid having repeated nodes in path
            msk = msk1 & msk2
            n_paths = (num_paths_msk_dest[:, node_i, None] * num_paths_msk_src[None, node_i, :])[msk]
            tot_paths_pairs = num_paths_msk[msk]
            ratio = (n_paths / tot_paths_pairs).sum()
            norm_ratio = ratio / N_dest / N_src
            ratios[node_i, :] = [norm_ratio, ratio, n_paths.sum()]
    if output_mode == 'ALL':
        return ratios
    elif output_mode == 'FLOWS_NORM':
        return ratios[:,0]
    elif output_mode == 'FLOWS_UNNORM':
        return ratios[:,1]
    elif output_mode == 'N_PATHS':
        return ratios[:,2]
    else:
        raise ValueError('output_mode parameter can be only: ALL, FLOWS_NORM, FLOWS_UNNORM, N_PATHS (selected=' + output_mode + ')')

def eval_flow_centrality_nx(nodes_src, nodes_dest, spm, progressbar=True):
    nodeid2idx = {gid: i for i, gid in enumerate(spm['nodelist'])}
    nodes_dest = [nodeid2idx[nodeid] for nodeid in nodes_dest]
    nodes_src = [nodeid2idx[nodeid] for nodeid in nodes_src]
    flows = eval_flow_centrality(nodes_src, nodes_dest, spm=spm, output_mode='ALL', progressbar=progressbar)
    return pd.DataFrame(flows, index=spm['nodelist'], columns=['FC','FC_unnorm','N_paths'])

def evaluate_flows_batch_p(pair): # public wrapper because python multiprocessing sucks...
    nodes_dest, nodes_src, spm = pair[0],pair[1],pair[2]
    return eval_flow_centrality(nodes_src, nodes_dest, spm=spm, output_mode='FLOWS_NORM', progressbar=False)

def evaluate_flows_batch(srcnodes_list, destnodes_list, spm, n_threads=1):
    if n_threads == 1:
        flow_values_all = []
        for srcnodes, destnodes in tqdm(list(zip(srcnodes_list, destnodes_list))):
            flow_values_all.append(evaluate_flows_batch_p([srcnodes, destnodes, spm]))
    else:
        raise NotImplementedError('Parallel processing still doesnt work')
        procdata = list(zip(list(srcnodes_list), list(destnodes_list),list([spm]*len(list(srcnodes_list)))))
        flow_values_all = utils.parallel_process(evaluate_flows_batch_p, procdata)
    return np.asarray(flow_values_all).T

def evaluate_flows_batch_nx(srcnodes_list, destnodes_list, spm, n_threads=1):
    gm = utils.GIDMapper(nodelist=spm['nodelist'])
    nodes_dest_list = list(map(gm.gid2id, destnodes_list))
    nodes_src_list = list(map(gm.gid2id, srcnodes_list))
    flows_batch = evaluate_flows_batch(nodes_src_list, nodes_dest_list, spm, n_threads=n_threads)
    return pd.DataFrame(flows_batch, index=spm['nodelist'])

def evaluate_flows_statistics_from_batch(flows_batch, true_flows):
    mean = flows_batch.mean(axis=1)
    std = flows_batch.std(axis=1)
    median = np.median(flows_batch,axis=1)
    one_tail_right = (flows_batch > true_flows[:,None]).sum(axis=1) / flows_batch.shape[1]
    one_tail_left = (flows_batch < true_flows[:,None]).sum(axis=1) / flows_batch.shape[1]
    zscore = (true_flows - mean) / std
    return pd.DataFrame({'FCS':zscore, 'FC': true_flows, 'mean':mean, 'std':std, 'median':median, 'one_tail_right':one_tail_right,'one_tail_left':one_tail_left})

def evaluate_flows_statistics_from_batch_nx(flows_batch, true_flows):
    flows_batch_arr = flows_batch.values
    stats = evaluate_flows_statistics_from_batch(flows_batch_arr, true_flows.FC.values)
    stats.index = true_flows.index
    stats['N_paths'] = true_flows.N_paths.values
    stats['FC_unnorm'] = true_flows.FC_unnorm.values
    return stats

def enrich_flows_table_nx(srcnodes, destnodes, fc_table, spm, fill_na=True):
    fc_table['degree'] = spm['deglist']
    fc_table['in_src'] = fc_table.index.isin(srcnodes)
    fc_table['in_dest'] = fc_table.index.isin(destnodes)
    if fill_na:
        fc_table.loc[pd.isnull(fc_table.FCS), 'FCS'] = 0
    return fc_table.sort_values('FCS', ascending=False)

def evaluate_fcs_nx(srcnodes, destnodes, rdm_srcnodes_list, rdm_destnodes_list, spm, fill_na=True, n_threads=1, progressbar=True):
    flows = eval_flow_centrality_nx(srcnodes, destnodes, spm, progressbar=progressbar)
    flows_batch = evaluate_flows_batch_nx(rdm_srcnodes_list, rdm_destnodes_list, spm, n_threads=n_threads)
    fcs = evaluate_flows_statistics_from_batch_nx(flows_batch, flows)
    return enrich_flows_table_nx(srcnodes, destnodes, fcs, spm, fill_na=fill_na)

def eval_distances(path_lengths, nodes_src, nodes_dest):
    nodes_dest_np = np.asarray(nodes_dest)[:, None]
    nodes_src_np = np.asarray(nodes_src)
    return path_lengths[nodes_dest_np, nodes_src_np]

def eval_distances_nx(path_lengths, nodelist, nodes_src, nodes_dest):
    nodeid2idx = {gid: i for i, gid in enumerate(nodelist)}
    nodes_dest_np = [nodeid2idx[nodeid] for nodeid in nodes_dest]
    nodes_src_np = [nodeid2idx[nodeid] for nodeid in nodes_src]
    return eval_distances(path_lengths, nodes_dest_np, nodes_src_np)

def eval_min_distance(path_lengths, nodes_src, nodes_dest):
    return eval_distances(path_lengths, nodes_src, nodes_dest).min(axis=0)

def eval_min_distance_nx(path_lengths, nodelist, nodes_src, nodes_dest):
    return eval_distances_nx(path_lengths, nodelist, nodes_src, nodes_dest).min(axis=0)

def eval_avg_distance(path_lengths, nodes_src, nodes_dest):
    return eval_distances(path_lengths, nodes_src, nodes_dest).mean(axis=0)

def eval_avg_distance_nx(path_lengths, nodelist, nodes_src, nodes_dest):
    return eval_distances_nx(path_lengths, nodelist, nodes_src, nodes_dest).mean(axis=0)

def eval_separation(path_lengths, nodes_A, nodes_B, return_partials = False):
    import numpy.ma as ma
    if path_lengths[0,0] != 0: #fast and dirty control to see if we are using 0-diag or 2-diag
        raise ValueError('Path lengths matrix has to be zero-diagonal!')
    module_A_ma = ma.masked_array(path_lengths[nodes_A,:][:,nodes_A], mask=np.sign(np.eye(len(nodes_A))),copy=False)
    module_B_ma = ma.masked_array(path_lengths[nodes_B,:][:,nodes_B], mask=np.sign(np.eye(len(nodes_B))),copy=False)
    dists_AA = float(module_A_ma.min(axis=0).mean())
    dists_BB = float(module_B_ma.min(axis=0).mean())

    dists_AB = path_lengths[nodes_A,:][:,nodes_B].min(axis=0)
    dists_BA = path_lengths[nodes_B,:][:,nodes_A].min(axis=0)
    dists_extra = (dists_AB.sum() + dists_BA.sum()) / (len(dists_AB) + len(dists_BA))
    if return_partials:
        return dists_extra - (dists_AA + dists_BB) / 2., dists_extra, dists_AA, dists_BB
    return dists_extra - (dists_AA + dists_BB) / 2.

def eval_separation_nx(path_lengths, nodelist, nodes_A, nodes_B, return_partials=False):
    nodeid2idx = {gid: i for i, gid in enumerate(nodelist)}
    nodes_dest_np = [nodeid2idx[nodeid] for nodeid in nodes_B]
    nodes_src_np = [nodeid2idx[nodeid] for nodeid in nodes_A]
    return eval_separation(path_lengths, nodes_dest_np, nodes_src_np, return_partials)

def save_spm(out_file, spm=None, num_paths=None, path_lengths=None, nodelist=None, deglist=None, curr_iter=None):
    import h5py
    with h5py.File(out_file, 'w') as hf:
        if spm is not None:
            if isinstance(spm['nodelist'][0], str):
                nodelist = np.string_(spm['nodelist']) # to fix unicode incompatibility between numpy and h5
                hf.create_dataset("nodelist", data=nodelist, dtype="S10")
            else:
                hf.create_dataset("nodelist", data=spm['nodelist'])
            hf.create_dataset("num_paths", data=spm['num_paths'], compression="gzip")
            hf.create_dataset("path_lengths", data=spm['path_lengths'], compression="gzip")
            hf.create_dataset('deglist', data=spm['deglist']) #
            hf.create_dataset("curr_iter", data=spm['curr_iter'])
        else:
            if isinstance(nodelist[0], str):
                nodelist = np.string_(nodelist) # to fix unicode incompatibility between numpy and h5
                hf.create_dataset("nodelist", data=nodelist, dtype="S10")
            else:
                hf.create_dataset("nodelist", data=nodelist)
            hf.create_dataset("num_paths", data=num_paths, compression="gzip")
            hf.create_dataset("path_lengths", data=path_lengths, compression="gzip")
            hf.create_dataset('deglist', data=deglist) #
            hf.create_dataset("curr_iter", data=curr_iter)

def load_spm(filepath):
    import h5py
    with h5py.File(filepath, 'r') as hf:
        data = {}
        data['num_paths'] = hf['num_paths'][:]
        data['path_lengths'] = hf['path_lengths'][:]
        data['nodelist'] = hf['nodelist'][:]
        data['deglist'] = hf['deglist'][:]
        data['curr_iter'] = hf['curr_iter'][()]
        if isinstance(data['nodelist'][0], str):
            data['nodelist'] = [a.decode('utf-8') for a in data['nodelist']]
    return data
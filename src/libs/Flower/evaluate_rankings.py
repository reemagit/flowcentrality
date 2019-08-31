from __future__ import division
from MyPythonLibs import utils, net, bio, sci
from MyPythonLibs.Flower import flower
import networkx as nx
import argparse
import pandas as pd
import numpy as np
import os

parser = argparse.ArgumentParser(description='Evaluate flow centrality values')
parser.add_argument('flows_file', type=str, help='Input flow values filepath (generated with evaluate_flows.py)')
parser.add_argument('flows_stats_file', type=str, help='Input flow statistics filepath (generated with evaluate_flows_statistics.py)')
parser.add_argument('network_file', type=str, help='Input network filepath')
parser.add_argument('destnodes_file', type=str, help='Destination nodes filename')
parser.add_argument('srcnodes_file', type=str, help='Source nodes filename')
parser.add_argument('spm_file', type=str, help='Shortest Path Metrics file')
parser.add_argument('output_file', type=str, help='Flow values output filepath')
parser.add_argument('--dry','--dry_run', action='store_true', help='Dry run')
args = parser.parse_args()

ppi = utils.load_cpickle(args.network_file)

flows = pd.read_csv(args.flows_file,sep='\t')
flows_stats = pd.read_csv(args.flows_stats_file,sep='\t')

_, dest_ext = os.path.splitext(args.destnodes_file)
_, src_ext = os.path.splitext(args.srcnodes_file)

if dest_ext == '.pickle' and src_ext == '.pickle': # binary file format
    destnodes = utils.load_cpickle(args.destnodes_file)
    srcnodes = utils.load_cpickle(args.srcnodes_file)
elif dest_ext == '.dat' and src_ext == '.dat': # just integer IDs
	destnodes = np.loadtxt(args.destnodes_file, dtype=int)
	srcnodes = np.loadtxt(args.srcnodes_file, dtype=int)
else: # .tsv or rich table
    destnodes = pd.read_csv(args.destnodes_file,sep='\t').EntrezID.values.tolist()
    srcnodes = pd.read_csv(args.srcnodes_file,sep='\t').EntrezID.values.tolist()

# flows: ['EntrezID', 'Flow_value', 'Flow_value_unnorm','Num_paths']
# flows_stats: ['EntrezID', 'Flow_mean', 'Flow_std']

flows = flows.merge(flows_stats, left_on='EntrezID', right_on='EntrezID', how='outer')

flows['zscore'] = (flows.Flow_value.values - flows.Flow_mean.values) / flows.Flow_std.values

flows[np.abs(flows.zscore) == np.inf].zscore = None

print "Creating rich columns..."

# NOTE: this operation cannot be parallelized when gene symbols have to be retrieved on mygene server, probably the sock connection to the mygene server doesn't work in parallel
flows['Symbol'] = utils.parallel_process(bio.gid2symb, flows.EntrezID.values.tolist(), n_jobs=1)

flows['Degree'] = flows.apply(lambda row: nx.degree(ppi, row.EntrezID),axis=1)

flows['in_DestModule'] = flows.apply(lambda row: row.EntrezID in destnodes,axis=1)
flows['in_SrcModule'] = flows.apply(lambda row: row.EntrezID in srcnodes,axis=1)

flows['P_hyp_DestModule'] = flows.apply(lambda row: sci.hypergeom_pval(ppi.neighbors(row.EntrezID),destnodes,ppi),axis=1)
flows['P_hyp_SrcModule'] = flows.apply(lambda row: sci.hypergeom_pval(ppi.neighbors(row.EntrezID),srcnodes,ppi),axis=1)

print "Calculating distance statistics..."

spm = flower.load_spm(args.spm_file)

gm = net.GIDMapper(spm['nodelist'])

destnodes_ids = gm.gid2id(destnodes)
srcnodes_ids = gm.gid2id(srcnodes)
ids = gm.gid2id(flows.EntrezID.values)

flows['min_dist_dest'] = flower.eval_min_distance(spm['path_lengths'], destnodes_ids, ids)
flows['min_dist_src'] = flower.eval_min_distance(spm['path_lengths'], srcnodes_ids, ids)

flows['avg_dist_dest'] = flower.eval_avg_distance(spm['path_lengths'], destnodes_ids, ids)
flows['avg_dist_src'] = flower.eval_avg_distance(spm['path_lengths'], srcnodes_ids, ids)

print "Sorting..."

flows.sort_values('zscore', ascending=False, inplace=True)

flows = flows[['EntrezID', 'Symbol', 'Flow_value', 'zscore', 'Degree', 'in_DestModule', 'in_SrcModule', 'P_hyp_DestModule', 'P_hyp_SrcModule', 'min_dist_dest', 'min_dist_src', 'avg_dist_dest', 'avg_dist_src','Flow_mean', 'Flow_std', 'Flow_value_unnorm', 'Num_paths']]

print "Completed."

print flows.head()

print "Writing..."

flows.to_csv(args.output_file, sep='\t', index=False)
# Functions for generating degree-preserved sets of nodes in a networkX graph

def get_degree_binning(g, bin_size):
    # adaptive degree binning. bin_size is the minimum nodes present in each bin
    degree_to_nodes = {}
    for node, degree in dict(g.degree()).items():
        degree_to_nodes.setdefault(degree, []).append(node)
    values = degree_to_nodes.keys()
    values = sorted(values)
    bins = []
    i = 0
    while i < len(values):
        low = values[i]
        val = degree_to_nodes[values[i]]
        while len(val) < bin_size:
            i += 1
            if i == len(values):
                break
            val.extend(degree_to_nodes[values[i]])
        if i == len(values):
            i -= 1
        high = values[i]
        i += 1
        # print low, high, len(val)
        if len(val) < bin_size:
            low_, high_, val_ = bins[-1]
            bins[-1] = (low_, high, val_ + val)
        else:
            bins.append((low, high, val))
    return bins


def get_degree_equivalents(seeds, bins, g):
    seed_to_nodes = {}
    for seed in seeds:
        d = g.degree(seed)
        for l, h, nodes in bins:
            if l <= d and h >= d:
                mod_nodes = nodes
                seed_to_nodes[seed] = mod_nodes
                break
    return seed_to_nodes


def pick_random_nodes_matching_selected(network, bins, nodes_selected, n_random, degree_aware=True, connected=False, exclusion_list=None, ordered=False, rdmseed=None):
    """
    Use get_degree_binning to get bins
    """
    import random
    if rdmseed is not None:
        random.seed(rdmseed)
    values = []
    nodes = list(network.nodes())
    if exclusion_list is None:
        exclusion_list = []
    for i in range(n_random):
        if degree_aware:
            if connected:
                raise ValueError("Not implemented!")
            nodes_random = []
            node_to_equivalent_nodes = get_degree_equivalents(nodes_selected, bins, network)
            if ordered: # added by Maiorino
                for node in nodes_selected:
                    equivalent_nodes = node_to_equivalent_nodes[node]
                    rdm_node = random.choice(equivalent_nodes)
                    while rdm_node in nodes_random or rdm_node in exclusion_list:
                        rdm_node = random.choice(equivalent_nodes)
                    nodes_random.append(rdm_node)
            else:
                for node, equivalent_nodes in node_to_equivalent_nodes.items():
                    rdm_node = random.choice(equivalent_nodes)
                    while rdm_node in nodes_random or rdm_node in exclusion_list:
                        rdm_node = random.choice(equivalent_nodes)
                    nodes_random.append(rdm_node)
        else:
            if connected:
                nodes_random = [random.choice(nodes)]
                i = 1
                while True:
                    if i == len(nodes_selected):
                        break
                    node_random = random.choice(nodes_random)
                    node_selected = random.choice(network.neighbors(node_random))
                    if node_selected in nodes_random:
                        continue
                    nodes_random.append(node_selected)
                    i += 1
            else:
                nodes_random = random.sample(nodes, len(nodes_selected))
        values.append(nodes_random)
    return values

def gen_degree_preserved_sets(nodeset, network, n_samples, bin_minimum_occupancy=30, exclusion_list=None, ordered=False, rdmseed=None):
    """
        Sample degree-preserved sets of nodes, where degree sequence is extracted from nodeset

        Parameters
        ----------
        nodeset : list
            List of nodes of network from which the degree sequence is to be extracted

        network : networkX graph
            Network

        n_samples : int
            Number of samples to generate

        bin_minimum_occupancy : int
            Parameter for adaptive binning. Bin boundaries are adapted such that each bin is populated by at least bin_minimum_occupancy elements

        Returns
        -------
        list of lists
            List where each element is a list of random nodes with degree sequence equivalent to the one of nodeset

    """
    bins = get_degree_binning(network, bin_minimum_occupancy)
    return pick_random_nodes_matching_selected(network=network, bins=bins, nodes_selected=nodeset, n_random=n_samples, exclusion_list=exclusion_list, ordered=ordered, rdmseed=rdmseed)

def gen_overlap_preserved_sets(nodeset1, nodeset2, network, n_samples, fix_nodeset1=False, fix_nodeset2=False, bin_minimum_occupancy=30, ordered=False):
    """
        Sample overlap-preserved sets of nodes

        Parameters
        ----------
        nodeset1 : list
            List of nodes of network from which the degree sequence is to be extracted
        nodeset2 : list
            List of nodes of network from which the degree sequence is to be extracted

        network : networkX graph
            Network

        n_samples : int
            Number of samples to generate

        bin_minimum_occupancy : int
            Parameter for adaptive binning. Bin boundaries are adapted such that each bin is populated by at least bin_minimum_occupancy elements

        Returns
        -------
        list of lists
            List where each element is a list of random nodes with degree sequence equivalent to the one of nodeset

    """
    import random
    if fix_nodeset1 and fix_nodeset2:
        raise ValueError('Cannot fix nodeset 1 and 2 simultaneously')
    bins = get_degree_binning(network, bin_minimum_occupancy)
    in_1_only = [node for node in nodeset1 if node not in nodeset2]
    in_2_only = [node for node in nodeset2 if node not in nodeset1]
    in_both = [node for node in nodeset1 if node in nodeset2]

    samples1 = []
    samples2 = []
    for i in range(n_samples):
        if len(in_both) > 0:
            if fix_nodeset1 or fix_nodeset2:
                in_both_sample = in_both
            else:
                in_both_sample = pick_random_nodes_matching_selected(network=network, bins=bins, nodes_selected=in_both, n_random=1, ordered=ordered)[0]
        else:
            in_both_sample = []
        if (not fix_nodeset1) and (not fix_nodeset2):
            if random.randint(0,1) == 0: # to avoid asymmetry between module 1 and 2
                in_1_only_sample = pick_random_nodes_matching_selected(network=network, bins=bins, nodes_selected=in_1_only, n_random=1, exclusion_list=in_both_sample, ordered=ordered)[0]
                in_2_only_sample = pick_random_nodes_matching_selected(network=network, bins=bins, nodes_selected=in_2_only, n_random=1, exclusion_list=in_both_sample + in_1_only_sample, ordered=ordered)[0]
            else:
                in_2_only_sample = pick_random_nodes_matching_selected(network=network, bins=bins, nodes_selected=in_2_only, n_random=1, exclusion_list=in_both_sample, ordered=ordered)[0]
                in_1_only_sample = pick_random_nodes_matching_selected(network=network, bins=bins, nodes_selected=in_1_only, n_random=1, exclusion_list=in_both_sample + in_2_only_sample, ordered=ordered)[0]
        elif fix_nodeset1:
            in_1_only_sample = in_1_only
            in_2_only_sample = pick_random_nodes_matching_selected(network=network, bins=bins, nodes_selected=in_2_only, n_random=1, exclusion_list=in_both_sample + in_1_only_sample, ordered=ordered)[0]
        elif fix_nodeset2:
            in_2_only_sample = in_2_only
            in_1_only_sample = pick_random_nodes_matching_selected(network=network, bins=bins, nodes_selected=in_1_only, n_random=1, exclusion_list=in_both_sample + in_2_only_sample, ordered=ordered)[0]
        samples1.append(in_1_only_sample + in_both_sample)
        samples2.append(in_2_only_sample + in_both_sample)

    return samples1, samples2
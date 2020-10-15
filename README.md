# flowcentrality

Source code to reproduce the paper "Discovering the genes mediating the interactions between chronic respiratory diseases in the human interactome", Maiorino et al.

Note: documentation is still being prepared.

# Main requirements

- conda
- pandas
- xlrd
- mygene
- networkx
- scipy
- tqdm 
- fisher
- matplotlib
- h5py
- p_tqdm
- GEOparse
- goatools==0.8.12
- sklearn
- pyYaml

# Installation

**Note: While the source code of flow centrality implemented in python 3 is available in this repository, visit the companion repository https://github.com/reemagit/Flower for a dedicated implementation of Flow Centrality in python 2.6, with demos and documentation**

1. from command line, enter the folder where to download the source code and clone the repo

```
cd path/to/folder
git clone https://github.com/reemagit/flowcentrality.git
```

The source code will be in the directory `path/to/folder/centrality`

2. Install a conda environment named "flowcentrality_paper" (or whatever name you prefer) with the necessary packages. The activate the environment and install the packages

```
conda create -n flowcentrality_paper python=3.6.7
conda activate flowcentrality_paper
pip install -r logs/requirements.txt
```

3. Download the data with make

```
cd src
make download_data
```

4. (Optional) To download the precalculated results of the paper, execute the command below

```
make download_results
```

Note: this operation is recommended since several operation are quite expensive to perform, and most results depend from intermediate files that would have to be calculated.

The package is now installed. You can use the make commands to perform the calculations and plot the figures.

# Usage

Assuming that the current directory of the command line is `flowcentrality/src`, you can perform calculations by executing the make command `make {command}`, where `{command}` is chosen from the list below:

### Processing

`process_biobank`: Process Biobank data
`process_expression`: Process all the GEO expression datasets 
`process_disgenet`: Process DisGeNet database data

### Calculations


`eval_fcs`: Evaluate flow centrality scores
`eval_paths`: Evaluate paths between asthma and copd modules
`eval_all_coexpression`: Evaluate the sequential coexpressions of the asthma-COPD paths for each GEO dataset
`eval_all_coexpression_spearman`: Evaluate the spearman sequential coexpressions of the asthma-COPD paths for each GEO dataset
`eval_go`: Evaluate sequential similarities of the asthma-COPD paths
`eval_do_sims`: Evaluate Disease Ontology similarities

### Plots

`plot_go_asthma_copd`: Sequential similarity of asthma-COPD paths
`plot_go_asthma_copd_bp_mf_cc`: Sequential similarity of asthma-COPD paths partitioned in BP/MF/CC
`plot_disease_pairs_go`: Sequential similarity of disease pairs paths
`plot_disease_pairs_go_pvals_vert`: P-values of sequential similarity of disease pairs paths
`plot_disease_sims_heatmap`: Similarities between diseases
`plot_disease_sims_distribution`: Distribution of similarities between diseases
`plot_diseases_vs_rdmgenesets_pvals_heatmap`: Sequential similarity of disease pairs compared to random sets
`plot_coexpr_disease_boxplots`: Sequential coexpression of asthma-COPD paths (disease conditions)
`plot_coexpr_healthy_boxplots`: Sequential coexpression of asthma-COPD paths (healthy conditions)
`plot_ukb_overlap_pvals`: Cutoff of asthma and COPD DIAMOnD ranking
`plot_asthma_pneumonia_ipf`: Sequential coexpression of asthma-pneumonia, asthma-IPF and asthma-COPD paths
`plot_copd_pneumonia_ipf`: Sequential coexpression of copd-pneumonia, copd-IPF and asthma-COPD paths
`plot_asthma_copd_random_diseases_gse4302_boxplot`: Sequential coexpression of asthma-COPD paths compared to asthma-random diseases
`plot_asthma_copd_random_diseases_gse57148_boxplot`: Sequential coexpression of asthma-COPD paths compared to COPD-random diseases
`plot_coexpr_scores_asthmacopd`: Significance scores of sequential coexpression for each GEO dataset
`plot_GSE4302_boxplot`: Sequential coexpression of asthma-COPD paths in GSE4302 dataset
`plot_GSE57148_boxplot`: Sequential coexpression of asthma-COPD paths in GSE57148 dataset
`plot_disease_pairs_go_pvals_horiz;`: Significance scores of sequential coexpression between related disease pairs

# Flow centrality



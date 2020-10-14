SEED=100
N_DIAMOND=1000
N_SAMPLES=1000
N_CORES=8
FC_THRESH=2
N_RDMPATHS=10000
N_PATH_THRESH=5# threshold for minimum number of N_paths in fcs file
MIN_DISEASE_SIZE=50# min disease size for related pairs evaluations

MIN_DISEASE_SIZE_RDM_DISGENET=24# min disease size for test between asthma/copd and random diseases
MAX_DISEASE_SIZE_RDM_DISGENET=36# min disease size for test between asthma/copd and random diseases
N_SAMPLES_RDM_DISGENET=500

############ DIRECTORIES #############

MAINDIR=..

NETWORK_DIR=${MAINDIR}/data/networks
ASTHMABENJI_DIR=${MAINDIR}/data/disease_genes/asthma_benji
COPDSEED_DIR=${MAINDIR}/data/disease_genes/copd_genes_03_08_2017

GENDATA_DIR=${MAINDIR}/gendata
DATA_DIR=${MAINDIR}/data

BIOBANK_DIR=${DATA_DIR}/gwas
DO_DIR=${DATA_DIR}/disease_ontology

DIAMOND_DIR=${GENDATA_DIR}/diamond_modules
ASTHMAMODULE_DIR=${DIAMOND_DIR}/asthma
COPDMODULE_DIR=${DIAMOND_DIR}/copd

FLOWER_DIR=libs/Flower
FC_DIR=${GENDATA_DIR}/fc

PATHS_DIR=${GENDATA_DIR}/paths

EXPR_DIR=${DATA_DIR}/expression

COEXPR_DIR=${GENDATA_DIR}/coexpression

SEQSIM_DIR=${GENDATA_DIR}/seqsim

DO_GEN_DIR=${GENDATA_DIR}/disease_ontology

RDM_DISGENET_DIR=${GENDATA_DIR}/coexpression/rdm_disgenet

MEASURES_DIR=${GENDATA_DIR}/measures

PLOT_DIR=${GENDATA_DIR}/plots

############ FILES #############

PPI2016=${NETWORK_DIR}/PPI_2016_feixiong/processed/PPI_2016_conn_noself.tsv
ASTHMASEED=${ASTHMABENJI_DIR}/processed/asthma_benji_in_ppi.entrezlist
COPDSEED=${COPDSEED_DIR}/processed/copd_genes_03_08_2017_in_ppi.entrezlist

ASTHMA_BIOBANK=${BIOBANK_DIR}/asthma/processed/asthma_biobank.entrezlist
COPD_BIOBANK=${BIOBANK_DIR}/copd/processed/copd_biobank.entrezlist

ASTHMA_TOPN=${ASTHMAMODULE_DIR}/asthma_diamond_topN.entrezlist
COPD_TOPN=${COPDMODULE_DIR}/copd_diamond_topN.entrezlist

SPM_FILE=${GENDATA_DIR}/spm/PPI_2016_conn_noself_py3.h5

ASTHMA_MODULE_FILE=${ASTHMAMODULE_DIR}/asthma_diamond.entrezlist
COPD_MODULE_FILE=${COPDMODULE_DIR}/copd_diamond.entrezlist

ASTHMA_SAMPLES_FILE=${ASTHMAMODULE_DIR}/asthma_diamond_samples_rerun.entrezlist
COPD_SAMPLES_FILE=${COPDMODULE_DIR}/copd_diamond_samples_rerun.entrezlist

FLOWS_FILE=${FC_DIR}/flows.tsv
RDMFLOWS_FILE=${FC_DIR}/rdmflows.tsv
FCS_FILE=${FC_DIR}/fcs.tsv

ALLPATHS_FILE=${PATHS_DIR}/all_paths.pathlist
FCPATHS_FILE=${PATHS_DIR}/fc_paths.pathlist
RDMPATHS_A_FILE=${PATHS_DIR}/rdm_paths_A.pathlist
RDMPATHS_B_FILE=${PATHS_DIR}/rdm_paths_B.pathlist

FCPATHS_1000_FILE=${PATHS_DIR}/fc_paths_1000.pathlist
RDMPATHS_1000_A_FILE=${PATHS_DIR}/rdm_paths_A_1000.pathlist
RDMPATHS_1000_B_FILE=${PATHS_DIR}/rdm_paths_B_1000.pathlist
FCPATHS_1000_NOTHRESH_FILE=${PATHS_DIR}/fc_paths_nothresh_1000.pathlist

OBO_FILE=${DATA_DIR}/go/go-basic.obo
GENE2GO_FILE=${DATA_DIR}/go/gene2go

GDA_FILE=${DATA_DIR}/disease_genes/disgenet/processed/curated_gene_disease_associations_size_min_${MIN_DISEASE_SIZE}.tsv
DIS_FILE=${DO_DIR}/processed/diseases_size_min_${MIN_DISEASE_SIZE}.tsv
DOID_FILE=${DO_DIR}/processed/doid_size_min_${MIN_DISEASE_SIZE}.tsv

RELATED_DIS_FILE=${DO_GEN_DIR}/disease_pairs/related_pairs_minsize_${MIN_DISEASE_SIZE}_maxoverlap_10_sim90perc.tsv
UNRELATED_DIS_FILE=${DO_GEN_DIR}/disease_pairs/unrelated_pairs_minsize_${MIN_DISEASE_SIZE}_maxoverlap_10_sim0.tsv
SIMS_DIS_FILE=${DO_GEN_DIR}/disease_pairs/disease_similarities_minsize_${MIN_DISEASE_SIZE}.tsv

GDA_FILE_RDM_DISGENET=${DATA_DIR}/disease_genes/disgenet/processed/curated_gene_disease_associations_size_min_${MIN_DISEASE_SIZE_RDM_DISGENET}_max_${MAX_DISEASE_SIZE_RDM_DISGENET}.tsv
DIS_FILE_RDM_DISGENET=${RDM_DISGENET_DIR}/diseases_size_min_${MIN_DISEASE_SIZE_RDM_DISGENET}_max_${MAX_DISEASE_SIZE_RDM_DISGENET}.tsv
DOID_FILE_RDM_DISGENET=${RDM_DISGENET_DIR}/doid_size_min_${MIN_DISEASE_SIZE_RDM_DISGENET}_max_${MAX_DISEASE_SIZE_RDM_DISGENET}.tsv

# the following line is to prevent makefile removing the intermediate files generated with implicit rules, such as the plots
.SECONDARY: 

nothresh_paths: ${FCPATHS_1000_NOTHRESH_FILE}

plot: plot_go_asthma_copd plot_go_asthma_copd_bp_mf_cc plot_disease_pairs_go plot_disease_pairs_go_pvals_vert \
	plot_disease_sims_heatmap plot_disease_sims_distribution plot_diseases_vs_rdmgenesets_pvals_heatmap \
	plot_coexpr_disease_boxplots plot_coexpr_healthy_boxplots plot_coexpr_scores plot_ukb_overlap_pvals \
	plot_asthma_pneumonia_ipf plot_copd_pneumonia_ipf plot_asthma_copd_random_diseases_gse4302_boxplot \
	plot_asthma_copd_random_diseases_gse57148_boxplot plot_coexpr_scores_asthmacopd plot_GSE4302_boxplot \
	plot_GSE57148_boxplot plot_disease_pairs_go_pvals_horiz;


plot_%: ${PLOT_DIR}/%.pdf;

${PLOT_DIR}/%.pdf: plot_config.yaml 9_plots/plot_%.py
	python 9_plots/plot_${*}.py --config plot_config.yaml --out_file ${PLOT_DIR}/${*}.pdf --no_show
	open ${PLOT_DIR}/${*}.pdf


#gen_disease_samples: ${DO_GEN_DIR}/disease_genes
#	python 7_disease_ontology/generate_degpres_samples.py ${DO_GEN_DIR}/disease_genes ${PPI2016} ${DO_GEN_DIR}/random_disease_genes --N_samples 300 --rdmseed ${SEED}

eval_measures:
	#python 8_measures/eval_measures.py ${PPI2016} degree ${MEASURES_DIR}/degree.tsv
	#python 8_measures/eval_measures.py ${PPI2016} betweenness ${MEASURES_DIR}/betweenness.tsv
	python 8_measures/eval_measures.py ${PPI2016} current ${MEASURES_DIR}/current.tsv
	#python 8_measures/eval_measures.py ${PPI2016} communicability ${MEASURES_DIR}/communicability.tsv
	#matlab -nodisplay -nodesktop -r "run 8_measures/eval_rsp_measures.m"

eval_pneumonia_ipf_coexpr: eval_copd_ipf_coexpr eval_copd_pneumonia_coexpr;

eval_copd_ipf_coexpr: eval_asthma_ipf_coexpr
	python ${FLOWER_DIR}/evaluate_fcs.py ${COPD_MODULE_FILE} ${GENDATA_DIR}/diamond_modules/ipf/ipf_diamond.entrezlist ${SPM_FILE} ${FC_DIR}/copd_ipf/fcs.tsv --rdm_src_path ${COPD_SAMPLES_FILE} --rdm_dest_path ${GENDATA_DIR}/diamond_modules/ipf/ipf_diamond_samples.entrezlist -n 1 --as_col
	python 4_fc_paths/evaluate_fc_paths.py ${COPDSEED} ${DATA_DIR}/disease_genes/ipf_disgenet/ipf.entrezlist ${PPI2016} ${FC_DIR}/copd_ipf/fcs.tsv ${PATHS_DIR}/copd_ipf/fc_paths.pathlist --fc_thresh ${FC_THRESH} --npath_thresh ${N_PATH_THRESH} --N_cores ${N_CORES}
	python 5_expression/eval_coexpression_parallel.py ${PATHS_DIR}/copd_ipf/fc_paths.pathlist ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${COEXPR_DIR}/copd_ipf/seqcorrs_disease_gsms.dat -n ${N_CORES}
	python 5_expression/eval_coexpression_parallel.py ${PATHS_DIR}/copd_ipf/fc_paths.pathlist ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${COEXPR_DIR}/copd_ipf/seqcorrs_healthy_gsms.dat -n ${N_CORES}

eval_copd_pneumonia_coexpr: eval_asthma_pneumonia_coexpr
	python ${FLOWER_DIR}/evaluate_fcs.py ${COPD_MODULE_FILE} ${GENDATA_DIR}/diamond_modules/pneumonia/pneumonia_diamond.entrezlist ${SPM_FILE} ${FC_DIR}/copd_pneumonia/fcs.tsv --rdm_src_path ${COPD_SAMPLES_FILE} --rdm_dest_path ${GENDATA_DIR}/diamond_modules/pneumonia/pneumonia_diamond_samples.entrezlist -n 1 --as_col
	python 4_fc_paths/evaluate_fc_paths.py ${COPDSEED} ${DATA_DIR}/disease_genes/pneumonia_disgenet/pneumonia.entrezlist ${PPI2016} ${FC_DIR}/copd_pneumonia/fcs.tsv ${PATHS_DIR}/copd_pneumonia/fc_paths.pathlist --fc_thresh ${FC_THRESH} --npath_thresh ${N_PATH_THRESH} --N_cores ${N_CORES}
	python 5_expression/eval_coexpression_parallel.py ${PATHS_DIR}/copd_pneumonia/fc_paths.pathlist ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${COEXPR_DIR}/copd_pneumonia/seqcorrs_disease_gsms.dat -n ${N_CORES}
	python 5_expression/eval_coexpression_parallel.py ${PATHS_DIR}/copd_pneumonia/fc_paths.pathlist ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${COEXPR_DIR}/copd_pneumonia/seqcorrs_healthy_gsms.dat -n ${N_CORES}


eval_asthma_ipf_coexpr:
	python 2_module_construction/eval_disgenet_disease_module.py ${DATA_DIR}/disease_genes/disgenet/raw/curated_gene_disease_associations.tsv ${PPI2016} C1800706 228 ${GENDATA_DIR}/diamond_modules/ipf/ipf_diamond.entrezlist
	python 3_random_samples/generate_diamond_samples.py ${DATA_DIR}/disease_genes/ipf_disgenet/ipf.entrezlist ${GENDATA_DIR}/diamond_modules/ipf/ipf_diamond.entrezlist ${PPI2016} ${GENDATA_DIR}/diamond_modules/ipf/ipf_diamond_samples.entrezlist --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --rdmseed ${SEED}
	python ${FLOWER_DIR}/evaluate_fcs.py ${ASTHMA_MODULE_FILE} ${GENDATA_DIR}/diamond_modules/ipf/ipf_diamond.entrezlist ${SPM_FILE} ${FC_DIR}/asthma_ipf/fcs.tsv --rdm_src_path ${ASTHMA_SAMPLES_FILE} --rdm_dest_path ${GENDATA_DIR}/diamond_modules/ipf/ipf_diamond_samples.entrezlist -n 1 --as_col
	python 4_fc_paths/evaluate_fc_paths.py ${ASTHMASEED} ${DATA_DIR}/disease_genes/ipf_disgenet/ipf.entrezlist ${PPI2016} ${FC_DIR}/asthma_ipf/fcs.tsv ${PATHS_DIR}/asthma_ipf/fc_paths.pathlist --fc_thresh ${FC_THRESH} --npath_thresh ${N_PATH_THRESH} --N_cores ${N_CORES}
	python 5_expression/eval_coexpression_parallel.py ${PATHS_DIR}/asthma_ipf/fc_paths.pathlist ${EXPR_DIR}/GSE4302/processed/expr.tsv ${EXPR_DIR}/GSE4302/processed/disease_gsms.txt ${COEXPR_DIR}/asthma_ipf/seqcorrs_disease_gsms.dat -n ${N_CORES}
	python 5_expression/eval_coexpression_parallel.py ${PATHS_DIR}/asthma_ipf/fc_paths.pathlist ${EXPR_DIR}/GSE4302/processed/expr.tsv ${EXPR_DIR}/GSE4302/processed/healthy_gsms.txt ${COEXPR_DIR}/asthma_ipf/seqcorrs_healthy_gsms.dat -n ${N_CORES}

eval_asthma_pneumonia_coexpr:
	python 2_module_construction/eval_disgenet_disease_module.py ${DATA_DIR}/disease_genes/disgenet/raw/curated_gene_disease_associations.tsv ${PPI2016} C0032285 228 ${GENDATA_DIR}/diamond_modules/pneumonia/pneumonia_diamond.entrezlist
	python 3_random_samples/generate_diamond_samples.py ${DATA_DIR}/disease_genes/pneumonia_disgenet/pneumonia.entrezlist ${GENDATA_DIR}/diamond_modules/pneumonia/pneumonia_diamond.entrezlist ${PPI2016} ${GENDATA_DIR}/diamond_modules/pneumonia/pneumonia_diamond_samples.entrezlist --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --rdmseed ${SEED}
	python ${FLOWER_DIR}/evaluate_fcs.py ${ASTHMA_MODULE_FILE} ${GENDATA_DIR}/diamond_modules/pneumonia/pneumonia_diamond.entrezlist ${SPM_FILE} ${FC_DIR}/asthma_pneumonia/fcs.tsv --rdm_src_path ${ASTHMA_SAMPLES_FILE} --rdm_dest_path ${GENDATA_DIR}/diamond_modules/pneumonia/pneumonia_diamond_samples.entrezlist -n 1 --as_col
	python 4_fc_paths/evaluate_fc_paths.py ${ASTHMASEED} ${DATA_DIR}/disease_genes/pneumonia_disgenet/pneumonia.entrezlist ${PPI2016} ${FC_DIR}/asthma_pneumonia/fcs.tsv ${PATHS_DIR}/asthma_pneumonia/fc_paths.pathlist --fc_thresh ${FC_THRESH} --npath_thresh ${N_PATH_THRESH} --N_cores ${N_CORES}
	python 5_expression/eval_coexpression_parallel.py ${PATHS_DIR}/asthma_pneumonia/fc_paths.pathlist ${EXPR_DIR}/GSE4302/processed/expr.tsv ${EXPR_DIR}/GSE4302/processed/disease_gsms.txt ${COEXPR_DIR}/asthma_pneumonia/seqcorrs_disease_gsms.dat -n ${N_CORES}
	python 5_expression/eval_coexpression_parallel.py ${PATHS_DIR}/asthma_pneumonia/fc_paths.pathlist ${EXPR_DIR}/GSE4302/processed/expr.tsv ${EXPR_DIR}/GSE4302/processed/healthy_gsms.txt ${COEXPR_DIR}/asthma_pneumonia/seqcorrs_healthy_gsms.dat -n ${N_CORES}


eval_disease_pairs: ${GENDATA_DIR}/disease_ontology/similarities/sims_resnik.tsv
	python 7_disease_ontology/eval_disease_pairs.py ${GDA_FILE} ${GENDATA_DIR}/disease_ontology/similarities/sims_resnik.tsv ${DIS_FILE} \
		${RELATED_DIS_FILE} ${UNRELATED_DIS_FILE} ${SIMS_DIS_FILE} ${DO_GEN_DIR}/disease_genes --rdmseed ${SEED}


# eval_rdm_disgenet_paths: EXECUTED ON CLUSTER

# eval_go_diseases_related: EXECUTED ON CLUSTER

# eval_fcs_related: EXECUTED ON CLUSTER

# eval_fcs_related: EXECUTED ON CLUSTER


eval_do_sims: process_disgenet
	7_disease_ontology/eval_do_sims.R ${DOID_FILE} Resnik ${DO_GEN_DIR}/similarities/sims_resnik.tsv

process_disgenet:
	python 1_data_processing/process_disgenet.py ${DATA_DIR}/disease_genes/disgenet/raw/curated_gene_disease_associations.tsv ${DO_DIR}/raw/disease_mappings.tsv ${PPI2016} ${GDA_FILE} ${DIS_FILE} ${DOID_FILE} --min_disease_size ${MIN_DISEASE_SIZE}
	python 1_data_processing/process_disgenet.py ${DATA_DIR}/disease_genes/disgenet/raw/curated_gene_disease_associations.tsv ${DO_DIR}/raw/disease_mappings.tsv ${PPI2016} ${GDA_FILE_RDM_DISGENET} ${DIS_FILE_RDM_DISGENET} ${DOID_FILE_RDM_DISGENET} --min_disease_size ${MIN_DISEASE_SIZE_RDM_DISGENET} --max_disease_size=${MAX_DISEASE_SIZE_RDM_DISGENET}

eval_go: ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 6_gene_ontology/eval_seqsim_parallel.py ${FCPATHS_1000_FILE} ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/seqsims_fc_1000.dat -n ${N_CORES}
	python 6_gene_ontology/eval_seqsim_parallel.py ${RDMPATHS_1000_A_FILE} ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/seqsims_rdm_a_1000.dat -n ${N_CORES}
	python 6_gene_ontology/eval_seqsim_parallel.py ${RDMPATHS_1000_B_FILE} ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/seqsims_rdm_b_1000.dat -n ${N_CORES}

	python 6_gene_ontology/eval_seqsim_parallel.py ${FCPATHS_1000_FILE} ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/seqsims_fc_cc_1000.dat -n ${N_CORES} -s cc
	python 6_gene_ontology/eval_seqsim_parallel.py ${RDMPATHS_1000_A_FILE} ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/seqsims_rdm_a_cc_1000.dat -n ${N_CORES}  -s cc
	python 6_gene_ontology/eval_seqsim_parallel.py ${RDMPATHS_1000_B_FILE} ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/seqsims_rdm_b_cc_1000.dat -n ${N_CORES} -s cc

	python 6_gene_ontology/eval_seqsim_parallel.py ${FCPATHS_1000_FILE} ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/seqsims_fc_mf_1000.dat -n ${N_CORES} -s mf
	python 6_gene_ontology/eval_seqsim_parallel.py ${RDMPATHS_1000_A_FILE} ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/seqsims_rdm_a_mf_1000.dat -n ${N_CORES}  -s mf
	python 6_gene_ontology/eval_seqsim_parallel.py ${RDMPATHS_1000_B_FILE} ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/seqsims_rdm_b_mf_1000.dat -n ${N_CORES} -s mf

	python 6_gene_ontology/eval_seqsim_parallel.py ${FCPATHS_1000_FILE} ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/seqsims_fc_bp_1000.dat -n ${N_CORES} -s bp
	python 6_gene_ontology/eval_seqsim_parallel.py ${RDMPATHS_1000_A_FILE} ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/seqsims_rdm_a_bp_1000.dat -n ${N_CORES}  -s bp
	python 6_gene_ontology/eval_seqsim_parallel.py ${RDMPATHS_1000_B_FILE} ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/seqsims_rdm_b_bp_1000.dat -n ${N_CORES} -s bp


eval_all_coexpression: \
			${COEXPR_DIR}/GSE104468/seqcorrs_asthma_bronch_gsms_1000.dat ${COEXPR_DIR}/GSE104468/seqcorrs_asthma_bronch_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE104468/seqcorrs_asthma_bronch_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE104468/seqcorrs_asthma_nasal_gsms_1000.dat ${COEXPR_DIR}/GSE104468/seqcorrs_asthma_nasal_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE104468/seqcorrs_asthma_nasal_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE104468/seqcorrs_asthma_pbmc_gsms_1000.dat ${COEXPR_DIR}/GSE104468/seqcorrs_asthma_pbmc_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE104468/seqcorrs_asthma_pbmc_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE104468/seqcorrs_normal_bronch_gsms_1000.dat ${COEXPR_DIR}/GSE104468/seqcorrs_normal_bronch_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE104468/seqcorrs_normal_bronch_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE104468/seqcorrs_normal_nasal_gsms_1000.dat ${COEXPR_DIR}/GSE104468/seqcorrs_normal_nasal_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE104468/seqcorrs_normal_nasal_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE104468/seqcorrs_normal_pbmc_gsms_1000.dat ${COEXPR_DIR}/GSE104468/seqcorrs_normal_pbmc_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE104468/seqcorrs_normal_pbmc_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE13896/seqcorrs_disease_gsms_1000.dat ${COEXPR_DIR}/GSE13896/seqcorrs_disease_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE13896/seqcorrs_disease_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE13896/seqcorrs_healthy_gsms_1000.dat ${COEXPR_DIR}/GSE13896/seqcorrs_healthy_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE13896/seqcorrs_healthy_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE13896/seqcorrs_healthy_non_smoker_gsms_1000.dat ${COEXPR_DIR}/GSE13896/seqcorrs_healthy_non_smoker_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE13896/seqcorrs_healthy_non_smoker_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE16032/seqcorrs_disease_gsms_1000.dat ${COEXPR_DIR}/GSE16032/seqcorrs_disease_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE16032/seqcorrs_disease_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE16972/seqcorrs_control_gsms_1000.dat ${COEXPR_DIR}/GSE16972/seqcorrs_control_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE16972/seqcorrs_control_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE16972/seqcorrs_copd_gsms_1000.dat ${COEXPR_DIR}/GSE16972/seqcorrs_copd_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE16972/seqcorrs_copd_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE18965/seqcorrs_disease_gsms_1000.dat ${COEXPR_DIR}/GSE18965/seqcorrs_disease_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE18965/seqcorrs_disease_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE18965/seqcorrs_healthy_gsms_1000.dat ${COEXPR_DIR}/GSE18965/seqcorrs_healthy_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE18965/seqcorrs_healthy_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE22148/seqcorrs_disease_gsms_1000.dat ${COEXPR_DIR}/GSE22148/seqcorrs_disease_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE22148/seqcorrs_disease_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE31773/seqcorrs_healthy_gsms_1000.dat ${COEXPR_DIR}/GSE31773/seqcorrs_healthy_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE31773/seqcorrs_healthy_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE31773/seqcorrs_asthma_severe_gsms_1000.dat ${COEXPR_DIR}/GSE31773/seqcorrs_asthma_severe_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE31773/seqcorrs_asthma_severe_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE31773/seqcorrs_cd4_healthy_gsms_1000.dat ${COEXPR_DIR}/GSE31773/seqcorrs_cd4_healthy_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE31773/seqcorrs_cd4_healthy_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE31773/seqcorrs_cd4_non_severe_gsms_1000.dat ${COEXPR_DIR}/GSE31773/seqcorrs_cd4_non_severe_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE31773/seqcorrs_cd4_non_severe_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE31773/seqcorrs_cd4_severe_gsms_1000.dat ${COEXPR_DIR}/GSE31773/seqcorrs_cd4_severe_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE31773/seqcorrs_cd4_severe_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE31773/seqcorrs_cd8_healthy_gsms_1000.dat ${COEXPR_DIR}/GSE31773/seqcorrs_cd8_healthy_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE31773/seqcorrs_cd8_healthy_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE31773/seqcorrs_cd8_non_severe_gsms_1000.dat ${COEXPR_DIR}/GSE31773/seqcorrs_cd8_non_severe_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE31773/seqcorrs_cd8_non_severe_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE31773/seqcorrs_cd8_severe_gsms_1000.dat ${COEXPR_DIR}/GSE31773/seqcorrs_cd8_severe_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE31773/seqcorrs_cd8_severe_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE37147/seqcorrs_disease_gsms_1000.dat ${COEXPR_DIR}/GSE37147/seqcorrs_disease_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE37147/seqcorrs_disease_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE37147/seqcorrs_disease_no_history_asthma_gsms_1000.dat ${COEXPR_DIR}/GSE37147/seqcorrs_disease_no_history_asthma_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE37147/seqcorrs_disease_no_history_asthma_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE37147/seqcorrs_healthy_gsms_1000.dat ${COEXPR_DIR}/GSE37147/seqcorrs_healthy_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE37147/seqcorrs_healthy_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE37147/seqcorrs_healthy_no_history_asthma_gsms_1000.dat ${COEXPR_DIR}/GSE37147/seqcorrs_healthy_no_history_asthma_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE37147/seqcorrs_healthy_no_history_asthma_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE42057/seqcorrs_disease_gsms_1000.dat ${COEXPR_DIR}/GSE42057/seqcorrs_disease_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE42057/seqcorrs_disease_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE42057/seqcorrs_healthy_gsms_1000.dat ${COEXPR_DIR}/GSE42057/seqcorrs_healthy_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE42057/seqcorrs_healthy_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE4302/seqcorrs_disease_gsms_1000.dat ${COEXPR_DIR}/GSE4302/seqcorrs_disease_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE4302/seqcorrs_disease_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE4302/seqcorrs_healthy_gsms_1000.dat ${COEXPR_DIR}/GSE4302/seqcorrs_healthy_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE4302/seqcorrs_healthy_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE473/seqcorrs_asthma_med_nonatop_gsms_1000.dat ${COEXPR_DIR}/GSE473/seqcorrs_asthma_med_nonatop_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE473/seqcorrs_asthma_med_nonatop_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE473/seqcorrs_control_nonatop_gsms_1000.dat ${COEXPR_DIR}/GSE473/seqcorrs_control_nonatop_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE473/seqcorrs_control_nonatop_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE47460/seqcorrs_disease_gsms_1000.dat ${COEXPR_DIR}/GSE47460/seqcorrs_disease_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE47460/seqcorrs_disease_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE47460/seqcorrs_healthy_gsms_1000.dat ${COEXPR_DIR}/GSE47460/seqcorrs_healthy_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE47460/seqcorrs_healthy_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE54837/seqcorrs_disease_gsms_1000.dat ${COEXPR_DIR}/GSE54837/seqcorrs_disease_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE54837/seqcorrs_disease_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE54837/seqcorrs_healthy_gsms_1000.dat ${COEXPR_DIR}/GSE54837/seqcorrs_healthy_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE54837/seqcorrs_healthy_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE57148/seqcorrs_disease_gsms_1000.dat ${COEXPR_DIR}/GSE57148/seqcorrs_disease_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE57148/seqcorrs_disease_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE57148/seqcorrs_healthy_gsms_1000.dat ${COEXPR_DIR}/GSE57148/seqcorrs_healthy_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE57148/seqcorrs_healthy_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE64913/seqcorrs_asthma_cae_gsms_1000.dat ${COEXPR_DIR}/GSE64913/seqcorrs_asthma_cae_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE64913/seqcorrs_asthma_cae_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE64913/seqcorrs_asthma_pae_gsms_1000.dat ${COEXPR_DIR}/GSE64913/seqcorrs_asthma_pae_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE64913/seqcorrs_asthma_pae_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE64913/seqcorrs_healthy_cae_gsms_1000.dat ${COEXPR_DIR}/GSE64913/seqcorrs_healthy_cae_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE64913/seqcorrs_healthy_cae_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE64913/seqcorrs_healthy_pae_gsms_1000.dat ${COEXPR_DIR}/GSE64913/seqcorrs_healthy_pae_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE64913/seqcorrs_healthy_pae_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE85567/seqcorrs_disease_gsms_1000.dat ${COEXPR_DIR}/GSE85567/seqcorrs_disease_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE85567/seqcorrs_disease_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE85567/seqcorrs_healthy_gsms_1000.dat ${COEXPR_DIR}/GSE85567/seqcorrs_healthy_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE85567/seqcorrs_healthy_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE8581/seqcorrs_disease_gsms_1000.dat ${COEXPR_DIR}/GSE8581/seqcorrs_disease_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE8581/seqcorrs_disease_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE8581/seqcorrs_healthy_gsms_1000.dat ${COEXPR_DIR}/GSE8581/seqcorrs_healthy_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE8581/seqcorrs_healthy_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE89809/seqcorrs_Healthy_BAL_gsms_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_Healthy_BAL_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_Healthy_BAL_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE89809/seqcorrs_Healthy_Epithelial_gsms_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_Healthy_Epithelial_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_Healthy_Epithelial_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE89809/seqcorrs_Healthy_Spm_gsms_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_Healthy_Spm_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_Healthy_Spm_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE89809/seqcorrs_Mild_BAL_gsms_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_Mild_BAL_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_Mild_BAL_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE89809/seqcorrs_Mild_Epithelial_gsms_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_Mild_Epithelial_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_Mild_Epithelial_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE89809/seqcorrs_Mild_Spm_gsms_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_Mild_Spm_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_Mild_Spm_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE89809/seqcorrs_Moderate_BAL_gsms_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_Moderate_BAL_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_Moderate_BAL_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE89809/seqcorrs_Moderate_Epithelial_gsms_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_Moderate_Epithelial_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_Moderate_Epithelial_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE89809/seqcorrs_Moderate_Spm_gsms_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_Moderate_Spm_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_Moderate_Spm_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE89809/seqcorrs_Severe_BAL_gsms_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_Severe_BAL_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_Severe_BAL_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE89809/seqcorrs_Severe_Epithelial_gsms_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_Severe_Epithelial_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_Severe_Epithelial_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE89809/seqcorrs_Severe_Spm_gsms_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_Severe_Spm_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_Severe_Spm_gsms_rdm_b_1000.dat \

eval_all_coexpression_spearman: \
			${COEXPR_DIR}/GSE104468/seqcorrs_spearman_asthma_bronch_gsms_1000.dat ${COEXPR_DIR}/GSE104468/seqcorrs_spearman_asthma_bronch_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE104468/seqcorrs_spearman_asthma_bronch_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE104468/seqcorrs_spearman_asthma_nasal_gsms_1000.dat ${COEXPR_DIR}/GSE104468/seqcorrs_spearman_asthma_nasal_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE104468/seqcorrs_spearman_asthma_nasal_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE104468/seqcorrs_spearman_asthma_pbmc_gsms_1000.dat ${COEXPR_DIR}/GSE104468/seqcorrs_spearman_asthma_pbmc_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE104468/seqcorrs_spearman_asthma_pbmc_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE104468/seqcorrs_spearman_normal_bronch_gsms_1000.dat ${COEXPR_DIR}/GSE104468/seqcorrs_spearman_normal_bronch_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE104468/seqcorrs_spearman_normal_bronch_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE104468/seqcorrs_spearman_normal_nasal_gsms_1000.dat ${COEXPR_DIR}/GSE104468/seqcorrs_spearman_normal_nasal_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE104468/seqcorrs_spearman_normal_nasal_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE104468/seqcorrs_spearman_normal_pbmc_gsms_1000.dat ${COEXPR_DIR}/GSE104468/seqcorrs_spearman_normal_pbmc_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE104468/seqcorrs_spearman_normal_pbmc_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE13896/seqcorrs_spearman_disease_gsms_1000.dat ${COEXPR_DIR}/GSE13896/seqcorrs_spearman_disease_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE13896/seqcorrs_spearman_disease_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE13896/seqcorrs_spearman_healthy_gsms_1000.dat ${COEXPR_DIR}/GSE13896/seqcorrs_spearman_healthy_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE13896/seqcorrs_spearman_healthy_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE13896/seqcorrs_spearman_healthy_non_smoker_gsms_1000.dat ${COEXPR_DIR}/GSE13896/seqcorrs_spearman_healthy_non_smoker_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE13896/seqcorrs_spearman_healthy_non_smoker_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE16032/seqcorrs_spearman_disease_gsms_1000.dat ${COEXPR_DIR}/GSE16032/seqcorrs_spearman_disease_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE16032/seqcorrs_spearman_disease_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE16972/seqcorrs_spearman_control_gsms_1000.dat ${COEXPR_DIR}/GSE16972/seqcorrs_spearman_control_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE16972/seqcorrs_spearman_control_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE16972/seqcorrs_spearman_copd_gsms_1000.dat ${COEXPR_DIR}/GSE16972/seqcorrs_spearman_copd_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE16972/seqcorrs_spearman_copd_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE18965/seqcorrs_spearman_disease_gsms_1000.dat ${COEXPR_DIR}/GSE18965/seqcorrs_spearman_disease_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE18965/seqcorrs_spearman_disease_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE18965/seqcorrs_spearman_healthy_gsms_1000.dat ${COEXPR_DIR}/GSE18965/seqcorrs_spearman_healthy_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE18965/seqcorrs_spearman_healthy_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE22148/seqcorrs_spearman_disease_gsms_1000.dat ${COEXPR_DIR}/GSE22148/seqcorrs_spearman_disease_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE22148/seqcorrs_spearman_disease_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE31773/seqcorrs_spearman_healthy_gsms_1000.dat ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_healthy_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_healthy_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE31773/seqcorrs_spearman_asthma_severe_gsms_1000.dat ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_asthma_severe_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_asthma_severe_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd4_healthy_gsms_1000.dat ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd4_healthy_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd4_healthy_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd4_non_severe_gsms_1000.dat ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd4_non_severe_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd4_non_severe_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd4_severe_gsms_1000.dat ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd4_severe_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd4_severe_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd8_healthy_gsms_1000.dat ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd8_healthy_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd8_healthy_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd8_non_severe_gsms_1000.dat ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd8_non_severe_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd8_non_severe_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd8_severe_gsms_1000.dat ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd8_severe_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd8_severe_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE37147/seqcorrs_spearman_disease_gsms_1000.dat ${COEXPR_DIR}/GSE37147/seqcorrs_spearman_disease_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE37147/seqcorrs_spearman_disease_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE37147/seqcorrs_spearman_disease_no_history_asthma_gsms_1000.dat ${COEXPR_DIR}/GSE37147/seqcorrs_spearman_disease_no_history_asthma_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE37147/seqcorrs_spearman_disease_no_history_asthma_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE37147/seqcorrs_spearman_healthy_gsms_1000.dat ${COEXPR_DIR}/GSE37147/seqcorrs_spearman_healthy_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE37147/seqcorrs_spearman_healthy_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE37147/seqcorrs_spearman_healthy_no_history_asthma_gsms_1000.dat ${COEXPR_DIR}/GSE37147/seqcorrs_spearman_healthy_no_history_asthma_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE37147/seqcorrs_spearman_healthy_no_history_asthma_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE42057/seqcorrs_spearman_disease_gsms_1000.dat ${COEXPR_DIR}/GSE42057/seqcorrs_spearman_disease_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE42057/seqcorrs_spearman_disease_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE42057/seqcorrs_spearman_healthy_gsms_1000.dat ${COEXPR_DIR}/GSE42057/seqcorrs_spearman_healthy_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE42057/seqcorrs_spearman_healthy_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE4302/seqcorrs_spearman_disease_gsms_1000.dat ${COEXPR_DIR}/GSE4302/seqcorrs_spearman_disease_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE4302/seqcorrs_spearman_disease_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE4302/seqcorrs_spearman_healthy_gsms_1000.dat ${COEXPR_DIR}/GSE4302/seqcorrs_spearman_healthy_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE4302/seqcorrs_spearman_healthy_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE473/seqcorrs_spearman_asthma_med_nonatop_gsms_1000.dat ${COEXPR_DIR}/GSE473/seqcorrs_spearman_asthma_med_nonatop_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE473/seqcorrs_spearman_asthma_med_nonatop_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE473/seqcorrs_spearman_control_nonatop_gsms_1000.dat ${COEXPR_DIR}/GSE473/seqcorrs_spearman_control_nonatop_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE473/seqcorrs_spearman_control_nonatop_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE47460/seqcorrs_spearman_disease_gsms_1000.dat ${COEXPR_DIR}/GSE47460/seqcorrs_spearman_disease_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE47460/seqcorrs_spearman_disease_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE47460/seqcorrs_spearman_healthy_gsms_1000.dat ${COEXPR_DIR}/GSE47460/seqcorrs_spearman_healthy_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE47460/seqcorrs_spearman_healthy_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE54837/seqcorrs_spearman_disease_gsms_1000.dat ${COEXPR_DIR}/GSE54837/seqcorrs_spearman_disease_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE54837/seqcorrs_spearman_disease_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE54837/seqcorrs_spearman_healthy_gsms_1000.dat ${COEXPR_DIR}/GSE54837/seqcorrs_spearman_healthy_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE54837/seqcorrs_spearman_healthy_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE57148/seqcorrs_spearman_disease_gsms_1000.dat ${COEXPR_DIR}/GSE57148/seqcorrs_spearman_disease_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE57148/seqcorrs_spearman_disease_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE57148/seqcorrs_spearman_healthy_gsms_1000.dat ${COEXPR_DIR}/GSE57148/seqcorrs_spearman_healthy_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE57148/seqcorrs_spearman_healthy_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE64913/seqcorrs_spearman_asthma_cae_gsms_1000.dat ${COEXPR_DIR}/GSE64913/seqcorrs_spearman_asthma_cae_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE64913/seqcorrs_spearman_asthma_cae_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE64913/seqcorrs_spearman_asthma_pae_gsms_1000.dat ${COEXPR_DIR}/GSE64913/seqcorrs_spearman_asthma_pae_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE64913/seqcorrs_spearman_asthma_pae_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE64913/seqcorrs_spearman_healthy_cae_gsms_1000.dat ${COEXPR_DIR}/GSE64913/seqcorrs_spearman_healthy_cae_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE64913/seqcorrs_spearman_healthy_cae_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE64913/seqcorrs_spearman_healthy_pae_gsms_1000.dat ${COEXPR_DIR}/GSE64913/seqcorrs_spearman_healthy_pae_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE64913/seqcorrs_spearman_healthy_pae_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE85567/seqcorrs_spearman_disease_gsms_1000.dat ${COEXPR_DIR}/GSE85567/seqcorrs_spearman_disease_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE85567/seqcorrs_spearman_disease_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE85567/seqcorrs_spearman_healthy_gsms_1000.dat ${COEXPR_DIR}/GSE85567/seqcorrs_spearman_healthy_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE85567/seqcorrs_spearman_healthy_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE8581/seqcorrs_spearman_disease_gsms_1000.dat ${COEXPR_DIR}/GSE8581/seqcorrs_spearman_disease_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE8581/seqcorrs_spearman_disease_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE8581/seqcorrs_spearman_healthy_gsms_1000.dat ${COEXPR_DIR}/GSE8581/seqcorrs_spearman_healthy_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE8581/seqcorrs_spearman_healthy_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Healthy_BAL_gsms_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Healthy_BAL_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Healthy_BAL_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Healthy_Epithelial_gsms_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Healthy_Epithelial_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Healthy_Epithelial_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Healthy_Spm_gsms_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Healthy_Spm_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Healthy_Spm_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Mild_BAL_gsms_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Mild_BAL_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Mild_BAL_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Mild_Epithelial_gsms_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Mild_Epithelial_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Mild_Epithelial_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Mild_Spm_gsms_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Mild_Spm_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Mild_Spm_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Moderate_BAL_gsms_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Moderate_BAL_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Moderate_BAL_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Moderate_Epithelial_gsms_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Moderate_Epithelial_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Moderate_Epithelial_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Moderate_Spm_gsms_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Moderate_Spm_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Moderate_Spm_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Severe_BAL_gsms_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Severe_BAL_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Severe_BAL_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Severe_Epithelial_gsms_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Severe_Epithelial_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Severe_Epithelial_gsms_rdm_b_1000.dat \
			${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Severe_Spm_gsms_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Severe_Spm_gsms_rdm_a_1000.dat ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Severe_Spm_gsms_rdm_b_1000.dat \

#eval_coexpression_%: process_expression
#	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_FILE} ${EXPR_DIR}/${*}/processed/expr.tsv ${EXPR_DIR}/${*}/processed/${cls}.txt ${COEXPR_DIR}/${*}/seqcorrs_${cls}.dat -n ${N_CORES}
#	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_A_FILE} ${EXPR_DIR}/${*}/processed/expr.tsv ${EXPR_DIR}/${*}/processed/${cls}.txt ${COEXPR_DIR}/${*}/seqcorrs_${cls}_rdm_a.dat -n ${N_CORES}
#	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_B_FILE} ${EXPR_DIR}/${*}/processed/expr.tsv ${EXPR_DIR}/${*}/processed/${cls}.txt ${COEXPR_DIR}/${*}/seqcorrs_${cls}_rdm_b.dat -n ${N_CORES}
#	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_FILE} ${EXPR_DIR}/${*}/processed/expr.tsv ${EXPR_DIR}/${*}/processed/healthy_gsms.txt ${COEXPR_DIR}/${*}/seqcorrs_healthy.dat -n ${N_CORES}
#	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_A_FILE} ${EXPR_DIR}/${*}/processed/expr.tsv ${EXPR_DIR}/${*}/processed/healthy_gsms.txt ${COEXPR_DIR}/${*}/seqcorrs_healthy_rdm_a.dat -n ${N_CORES}
#	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_B_FILE} ${EXPR_DIR}/${*}/processed/expr.tsv ${EXPR_DIR}/${*}/processed/healthy_gsms.txt ${COEXPR_DIR}/${*}/seqcorrs_healthy_rdm_b.dat -n ${N_CORES}

process_expression: ${EXPR_DIR}/GSE4302 ${EXPR_DIR}/GSE37147 ${EXPR_DIR}/GSE13896 ${EXPR_DIR}/GSE22148 \
					${EXPR_DIR}/GSE42057 ${EXPR_DIR}/GSE47460 ${EXPR_DIR}/GSE54837 ${EXPR_DIR}/GSE8581 \
					${EXPR_DIR}/GSE16032 ${EXPR_DIR}/GSE18965 ${EXPR_DIR}/GSE31773 ${EXPR_DIR}/GSE104468 \
					${EXPR_DIR}/GSE64913 ${EXPR_DIR}/GSE89809 ${EXPR_DIR}/GSE85567 ${EXPR_DIR}/GSE57148 \
					${EXPR_DIR}/GSE473 ${EXPR_DIR}/GSE16972;

eval_paths: ${ALLPATHS_FILE} ${FCPATHS_FILE} ${RDMPATHS_A_FILE} ${RDMPATHS_B_FILE};

eval_fcs: ${FCS_FILE};

generate_samples: gen_samples_asthma gen_samples_copd;
gen_samples_asthma: ${ASTHMA_SAMPLES_FILE};
gen_samples_copd: ${COPD_SAMPLES_FILE};

build_modules: build_asthma build_copd;
build_asthma: ${ASTHMA_MODULE_FILE};
build_copd: ${COPD_MODULE_FILE};

eval_spm: ${SPM_FILE};

process_biobank: 
	python 1_data_processing/process_biobank_genes.py ${BIOBANK_DIR}/asthma/raw/Asthma-biobank.xlsx ${ASTHMA_BIOBANK}
	python 1_data_processing/process_biobank_genes.py ${BIOBANK_DIR}/copd/raw/COPD-biobank.xlsx ${COPD_BIOBANK}


setup: download_data download_results;

download_data:
	cd ..
	wget -r https://zenodo.org/record/4088674/files/data.zip -O data.zip
	unzip data.zip
	cd src

download_results:
	cd ..
	wget -r https://zenodo.org/record/4088914/files/gendata.zip -O gendata.zip
	unzip gendata.zip
	cd src

setup_env:
	conda create -n flowcentrality_paper python=3.6.7
	conda activate flowcentrality_paper
	pip install -r logs/requirements.txt


#########################################################

#             	SEQUENTIAL COEXPRESSION                 #

#########################################################

${COEXPR_DIR}/GSE104468/seqcorrs_asthma_bronch_gsms_1000.dat: ${EXPR_DIR}/GSE104468 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE104468/processed/expr.tsv ${EXPR_DIR}/GSE104468/processed/asthma_bronch_gsms.txt ${COEXPR_DIR}/GSE104468/seqcorrs_asthma_bronch_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE104468/seqcorrs_asthma_bronch_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE104468 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE104468/processed/expr.tsv ${EXPR_DIR}/GSE104468/processed/asthma_bronch_gsms.txt ${COEXPR_DIR}/GSE104468/seqcorrs_asthma_bronch_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE104468/seqcorrs_asthma_bronch_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE104468 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE104468/processed/expr.tsv ${EXPR_DIR}/GSE104468/processed/asthma_bronch_gsms.txt ${COEXPR_DIR}/GSE104468/seqcorrs_asthma_bronch_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE104468/seqcorrs_asthma_nasal_gsms_1000.dat: ${EXPR_DIR}/GSE104468 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE104468/processed/expr.tsv ${EXPR_DIR}/GSE104468/processed/asthma_nasal_gsms.txt ${COEXPR_DIR}/GSE104468/seqcorrs_asthma_nasal_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE104468/seqcorrs_asthma_nasal_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE104468 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE104468/processed/expr.tsv ${EXPR_DIR}/GSE104468/processed/asthma_nasal_gsms.txt ${COEXPR_DIR}/GSE104468/seqcorrs_asthma_nasal_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE104468/seqcorrs_asthma_nasal_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE104468 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE104468/processed/expr.tsv ${EXPR_DIR}/GSE104468/processed/asthma_nasal_gsms.txt ${COEXPR_DIR}/GSE104468/seqcorrs_asthma_nasal_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE104468/seqcorrs_asthma_pbmc_gsms_1000.dat: ${EXPR_DIR}/GSE104468 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE104468/processed/expr.tsv ${EXPR_DIR}/GSE104468/processed/asthma_pbmc_gsms.txt ${COEXPR_DIR}/GSE104468/seqcorrs_asthma_pbmc_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE104468/seqcorrs_asthma_pbmc_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE104468 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE104468/processed/expr.tsv ${EXPR_DIR}/GSE104468/processed/asthma_pbmc_gsms.txt ${COEXPR_DIR}/GSE104468/seqcorrs_asthma_pbmc_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE104468/seqcorrs_asthma_pbmc_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE104468 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE104468/processed/expr.tsv ${EXPR_DIR}/GSE104468/processed/asthma_pbmc_gsms.txt ${COEXPR_DIR}/GSE104468/seqcorrs_asthma_pbmc_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE104468/seqcorrs_normal_bronch_gsms_1000.dat: ${EXPR_DIR}/GSE104468 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE104468/processed/expr.tsv ${EXPR_DIR}/GSE104468/processed/normal_bronch_gsms.txt ${COEXPR_DIR}/GSE104468/seqcorrs_normal_bronch_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE104468/seqcorrs_normal_bronch_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE104468 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE104468/processed/expr.tsv ${EXPR_DIR}/GSE104468/processed/normal_bronch_gsms.txt ${COEXPR_DIR}/GSE104468/seqcorrs_normal_bronch_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE104468/seqcorrs_normal_bronch_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE104468 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE104468/processed/expr.tsv ${EXPR_DIR}/GSE104468/processed/normal_bronch_gsms.txt ${COEXPR_DIR}/GSE104468/seqcorrs_normal_bronch_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE104468/seqcorrs_normal_nasal_gsms_1000.dat: ${EXPR_DIR}/GSE104468 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE104468/processed/expr.tsv ${EXPR_DIR}/GSE104468/processed/normal_nasal_gsms.txt ${COEXPR_DIR}/GSE104468/seqcorrs_normal_nasal_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE104468/seqcorrs_normal_nasal_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE104468 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE104468/processed/expr.tsv ${EXPR_DIR}/GSE104468/processed/normal_nasal_gsms.txt ${COEXPR_DIR}/GSE104468/seqcorrs_normal_nasal_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE104468/seqcorrs_normal_nasal_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE104468 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE104468/processed/expr.tsv ${EXPR_DIR}/GSE104468/processed/normal_nasal_gsms.txt ${COEXPR_DIR}/GSE104468/seqcorrs_normal_nasal_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE104468/seqcorrs_normal_pbmc_gsms_1000.dat: ${EXPR_DIR}/GSE104468 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE104468/processed/expr.tsv ${EXPR_DIR}/GSE104468/processed/normal_pbmc_gsms.txt ${COEXPR_DIR}/GSE104468/seqcorrs_normal_pbmc_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE104468/seqcorrs_normal_pbmc_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE104468 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE104468/processed/expr.tsv ${EXPR_DIR}/GSE104468/processed/normal_pbmc_gsms.txt ${COEXPR_DIR}/GSE104468/seqcorrs_normal_pbmc_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE104468/seqcorrs_normal_pbmc_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE104468 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE104468/processed/expr.tsv ${EXPR_DIR}/GSE104468/processed/normal_pbmc_gsms.txt ${COEXPR_DIR}/GSE104468/seqcorrs_normal_pbmc_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE13896/seqcorrs_disease_gsms_1000.dat: ${EXPR_DIR}/GSE13896 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE13896/processed/expr.tsv ${EXPR_DIR}/GSE13896/processed/disease_gsms.txt ${COEXPR_DIR}/GSE13896/seqcorrs_disease_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE13896/seqcorrs_disease_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE13896 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE13896/processed/expr.tsv ${EXPR_DIR}/GSE13896/processed/disease_gsms.txt ${COEXPR_DIR}/GSE13896/seqcorrs_disease_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE13896/seqcorrs_disease_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE13896 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE13896/processed/expr.tsv ${EXPR_DIR}/GSE13896/processed/disease_gsms.txt ${COEXPR_DIR}/GSE13896/seqcorrs_disease_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE13896/seqcorrs_healthy_gsms_1000.dat: ${EXPR_DIR}/GSE13896 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE13896/processed/expr.tsv ${EXPR_DIR}/GSE13896/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE13896/seqcorrs_healthy_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE13896/seqcorrs_healthy_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE13896 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE13896/processed/expr.tsv ${EXPR_DIR}/GSE13896/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE13896/seqcorrs_healthy_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE13896/seqcorrs_healthy_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE13896 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE13896/processed/expr.tsv ${EXPR_DIR}/GSE13896/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE13896/seqcorrs_healthy_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE13896/seqcorrs_healthy_non_smoker_gsms_1000.dat: ${EXPR_DIR}/GSE13896 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE13896/processed/expr.tsv ${EXPR_DIR}/GSE13896/processed/healthy_non_smoker_gsms.txt ${COEXPR_DIR}/GSE13896/seqcorrs_healthy_non_smoker_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE13896/seqcorrs_healthy_non_smoker_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE13896 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE13896/processed/expr.tsv ${EXPR_DIR}/GSE13896/processed/healthy_non_smoker_gsms.txt ${COEXPR_DIR}/GSE13896/seqcorrs_healthy_non_smoker_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE13896/seqcorrs_healthy_non_smoker_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE13896 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE13896/processed/expr.tsv ${EXPR_DIR}/GSE13896/processed/healthy_non_smoker_gsms.txt ${COEXPR_DIR}/GSE13896/seqcorrs_healthy_non_smoker_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE16032/seqcorrs_disease_gsms_1000.dat: ${EXPR_DIR}/GSE16032 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE16032/processed/expr.tsv ${EXPR_DIR}/GSE16032/processed/disease_gsms.txt ${COEXPR_DIR}/GSE16032/seqcorrs_disease_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE16032/seqcorrs_disease_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE16032 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE16032/processed/expr.tsv ${EXPR_DIR}/GSE16032/processed/disease_gsms.txt ${COEXPR_DIR}/GSE16032/seqcorrs_disease_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE16032/seqcorrs_disease_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE16032 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE16032/processed/expr.tsv ${EXPR_DIR}/GSE16032/processed/disease_gsms.txt ${COEXPR_DIR}/GSE16032/seqcorrs_disease_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE16972/seqcorrs_control_gsms_1000.dat: ${EXPR_DIR}/GSE16972 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE16972/processed/expr.tsv ${EXPR_DIR}/GSE16972/processed/control_gsms.txt ${COEXPR_DIR}/GSE16972/seqcorrs_control_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE16972/seqcorrs_control_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE16972 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE16972/processed/expr.tsv ${EXPR_DIR}/GSE16972/processed/control_gsms.txt ${COEXPR_DIR}/GSE16972/seqcorrs_control_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE16972/seqcorrs_control_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE16972 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE16972/processed/expr.tsv ${EXPR_DIR}/GSE16972/processed/control_gsms.txt ${COEXPR_DIR}/GSE16972/seqcorrs_control_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE16972/seqcorrs_copd_gsms_1000.dat: ${EXPR_DIR}/GSE16972 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE16972/processed/expr.tsv ${EXPR_DIR}/GSE16972/processed/copd_gsms.txt ${COEXPR_DIR}/GSE16972/seqcorrs_copd_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE16972/seqcorrs_copd_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE16972 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE16972/processed/expr.tsv ${EXPR_DIR}/GSE16972/processed/copd_gsms.txt ${COEXPR_DIR}/GSE16972/seqcorrs_copd_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE16972/seqcorrs_copd_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE16972 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE16972/processed/expr.tsv ${EXPR_DIR}/GSE16972/processed/copd_gsms.txt ${COEXPR_DIR}/GSE16972/seqcorrs_copd_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE18965/seqcorrs_disease_gsms_1000.dat: ${EXPR_DIR}/GSE18965 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE18965/processed/expr.tsv ${EXPR_DIR}/GSE18965/processed/disease_gsms.txt ${COEXPR_DIR}/GSE18965/seqcorrs_disease_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE18965/seqcorrs_disease_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE18965 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE18965/processed/expr.tsv ${EXPR_DIR}/GSE18965/processed/disease_gsms.txt ${COEXPR_DIR}/GSE18965/seqcorrs_disease_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE18965/seqcorrs_disease_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE18965 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE18965/processed/expr.tsv ${EXPR_DIR}/GSE18965/processed/disease_gsms.txt ${COEXPR_DIR}/GSE18965/seqcorrs_disease_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE18965/seqcorrs_healthy_gsms_1000.dat: ${EXPR_DIR}/GSE18965 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE18965/processed/expr.tsv ${EXPR_DIR}/GSE18965/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE18965/seqcorrs_healthy_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE18965/seqcorrs_healthy_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE18965 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE18965/processed/expr.tsv ${EXPR_DIR}/GSE18965/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE18965/seqcorrs_healthy_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE18965/seqcorrs_healthy_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE18965 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE18965/processed/expr.tsv ${EXPR_DIR}/GSE18965/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE18965/seqcorrs_healthy_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE22148/seqcorrs_disease_gsms_1000.dat: ${EXPR_DIR}/GSE22148 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE22148/processed/expr.tsv ${EXPR_DIR}/GSE22148/processed/disease_gsms.txt ${COEXPR_DIR}/GSE22148/seqcorrs_disease_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE22148/seqcorrs_disease_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE22148 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE22148/processed/expr.tsv ${EXPR_DIR}/GSE22148/processed/disease_gsms.txt ${COEXPR_DIR}/GSE22148/seqcorrs_disease_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE22148/seqcorrs_disease_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE22148 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE22148/processed/expr.tsv ${EXPR_DIR}/GSE22148/processed/disease_gsms.txt ${COEXPR_DIR}/GSE22148/seqcorrs_disease_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE31773/seqcorrs_healthy_gsms_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_healthy_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE31773/seqcorrs_healthy_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_healthy_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE31773/seqcorrs_healthy_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_healthy_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE31773/seqcorrs_asthma_severe_gsms_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/asthma_severe_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_asthma_severe_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE31773/seqcorrs_asthma_severe_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/asthma_severe_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_asthma_severe_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE31773/seqcorrs_asthma_severe_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/asthma_severe_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_asthma_severe_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE31773/seqcorrs_cd4_healthy_gsms_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/cd4_healthy_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_cd4_healthy_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE31773/seqcorrs_cd4_healthy_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/cd4_healthy_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_cd4_healthy_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE31773/seqcorrs_cd4_healthy_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/cd4_healthy_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_cd4_healthy_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE31773/seqcorrs_cd4_non_severe_gsms_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/cd4_non_severe_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_cd4_non_severe_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE31773/seqcorrs_cd4_non_severe_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/cd4_non_severe_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_cd4_non_severe_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE31773/seqcorrs_cd4_non_severe_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/cd4_non_severe_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_cd4_non_severe_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE31773/seqcorrs_cd4_severe_gsms_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/cd4_severe_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_cd4_severe_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE31773/seqcorrs_cd4_severe_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/cd4_severe_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_cd4_severe_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE31773/seqcorrs_cd4_severe_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/cd4_severe_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_cd4_severe_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE31773/seqcorrs_cd8_healthy_gsms_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/cd8_healthy_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_cd8_healthy_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE31773/seqcorrs_cd8_healthy_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/cd8_healthy_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_cd8_healthy_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE31773/seqcorrs_cd8_healthy_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/cd8_healthy_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_cd8_healthy_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE31773/seqcorrs_cd8_non_severe_gsms_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/cd8_non_severe_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_cd8_non_severe_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE31773/seqcorrs_cd8_non_severe_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/cd8_non_severe_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_cd8_non_severe_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE31773/seqcorrs_cd8_non_severe_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/cd8_non_severe_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_cd8_non_severe_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE31773/seqcorrs_cd8_severe_gsms_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/cd8_severe_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_cd8_severe_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE31773/seqcorrs_cd8_severe_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/cd8_severe_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_cd8_severe_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE31773/seqcorrs_cd8_severe_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/cd8_severe_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_cd8_severe_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE37147/seqcorrs_disease_gsms_1000.dat: ${EXPR_DIR}/GSE37147 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE37147/processed/expr.tsv ${EXPR_DIR}/GSE37147/processed/disease_gsms.txt ${COEXPR_DIR}/GSE37147/seqcorrs_disease_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE37147/seqcorrs_disease_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE37147 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE37147/processed/expr.tsv ${EXPR_DIR}/GSE37147/processed/disease_gsms.txt ${COEXPR_DIR}/GSE37147/seqcorrs_disease_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE37147/seqcorrs_disease_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE37147 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE37147/processed/expr.tsv ${EXPR_DIR}/GSE37147/processed/disease_gsms.txt ${COEXPR_DIR}/GSE37147/seqcorrs_disease_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE37147/seqcorrs_disease_no_history_asthma_gsms_1000.dat: ${EXPR_DIR}/GSE37147 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE37147/processed/expr.tsv ${EXPR_DIR}/GSE37147/processed/disease_no_history_asthma_gsms.txt ${COEXPR_DIR}/GSE37147/seqcorrs_disease_no_history_asthma_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE37147/seqcorrs_disease_no_history_asthma_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE37147 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE37147/processed/expr.tsv ${EXPR_DIR}/GSE37147/processed/disease_no_history_asthma_gsms.txt ${COEXPR_DIR}/GSE37147/seqcorrs_disease_no_history_asthma_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE37147/seqcorrs_disease_no_history_asthma_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE37147 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE37147/processed/expr.tsv ${EXPR_DIR}/GSE37147/processed/disease_no_history_asthma_gsms.txt ${COEXPR_DIR}/GSE37147/seqcorrs_disease_no_history_asthma_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE37147/seqcorrs_healthy_gsms_1000.dat: ${EXPR_DIR}/GSE37147 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE37147/processed/expr.tsv ${EXPR_DIR}/GSE37147/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE37147/seqcorrs_healthy_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE37147/seqcorrs_healthy_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE37147 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE37147/processed/expr.tsv ${EXPR_DIR}/GSE37147/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE37147/seqcorrs_healthy_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE37147/seqcorrs_healthy_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE37147 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE37147/processed/expr.tsv ${EXPR_DIR}/GSE37147/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE37147/seqcorrs_healthy_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE37147/seqcorrs_healthy_no_history_asthma_gsms_1000.dat: ${EXPR_DIR}/GSE37147 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE37147/processed/expr.tsv ${EXPR_DIR}/GSE37147/processed/healthy_no_history_asthma_gsms.txt ${COEXPR_DIR}/GSE37147/seqcorrs_healthy_no_history_asthma_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE37147/seqcorrs_healthy_no_history_asthma_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE37147 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE37147/processed/expr.tsv ${EXPR_DIR}/GSE37147/processed/healthy_no_history_asthma_gsms.txt ${COEXPR_DIR}/GSE37147/seqcorrs_healthy_no_history_asthma_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE37147/seqcorrs_healthy_no_history_asthma_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE37147 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE37147/processed/expr.tsv ${EXPR_DIR}/GSE37147/processed/healthy_no_history_asthma_gsms.txt ${COEXPR_DIR}/GSE37147/seqcorrs_healthy_no_history_asthma_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE42057/seqcorrs_disease_gsms_1000.dat: ${EXPR_DIR}/GSE42057 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE42057/processed/expr.tsv ${EXPR_DIR}/GSE42057/processed/disease_gsms.txt ${COEXPR_DIR}/GSE42057/seqcorrs_disease_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE42057/seqcorrs_disease_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE42057 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE42057/processed/expr.tsv ${EXPR_DIR}/GSE42057/processed/disease_gsms.txt ${COEXPR_DIR}/GSE42057/seqcorrs_disease_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE42057/seqcorrs_disease_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE42057 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE42057/processed/expr.tsv ${EXPR_DIR}/GSE42057/processed/disease_gsms.txt ${COEXPR_DIR}/GSE42057/seqcorrs_disease_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE42057/seqcorrs_healthy_gsms_1000.dat: ${EXPR_DIR}/GSE42057 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE42057/processed/expr.tsv ${EXPR_DIR}/GSE42057/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE42057/seqcorrs_healthy_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE42057/seqcorrs_healthy_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE42057 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE42057/processed/expr.tsv ${EXPR_DIR}/GSE42057/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE42057/seqcorrs_healthy_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE42057/seqcorrs_healthy_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE42057 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE42057/processed/expr.tsv ${EXPR_DIR}/GSE42057/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE42057/seqcorrs_healthy_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE4302/seqcorrs_disease_gsms_1000.dat: ${EXPR_DIR}/GSE4302 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE4302/processed/expr.tsv ${EXPR_DIR}/GSE4302/processed/disease_gsms.txt ${COEXPR_DIR}/GSE4302/seqcorrs_disease_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE4302/seqcorrs_disease_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE4302 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE4302/processed/expr.tsv ${EXPR_DIR}/GSE4302/processed/disease_gsms.txt ${COEXPR_DIR}/GSE4302/seqcorrs_disease_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE4302/seqcorrs_disease_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE4302 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE4302/processed/expr.tsv ${EXPR_DIR}/GSE4302/processed/disease_gsms.txt ${COEXPR_DIR}/GSE4302/seqcorrs_disease_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE4302/seqcorrs_healthy_gsms_1000.dat: ${EXPR_DIR}/GSE4302 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE4302/processed/expr.tsv ${EXPR_DIR}/GSE4302/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE4302/seqcorrs_healthy_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE4302/seqcorrs_healthy_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE4302 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE4302/processed/expr.tsv ${EXPR_DIR}/GSE4302/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE4302/seqcorrs_healthy_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE4302/seqcorrs_healthy_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE4302 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE4302/processed/expr.tsv ${EXPR_DIR}/GSE4302/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE4302/seqcorrs_healthy_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE473/seqcorrs_asthma_med_nonatop_gsms_1000.dat: ${EXPR_DIR}/GSE473 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE473/processed/expr.tsv ${EXPR_DIR}/GSE473/processed/asthma_med_nonatop_gsms.txt ${COEXPR_DIR}/GSE473/seqcorrs_asthma_med_nonatop_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE473/seqcorrs_asthma_med_nonatop_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE473 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE473/processed/expr.tsv ${EXPR_DIR}/GSE473/processed/asthma_med_nonatop_gsms.txt ${COEXPR_DIR}/GSE473/seqcorrs_asthma_med_nonatop_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE473/seqcorrs_asthma_med_nonatop_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE473 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE473/processed/expr.tsv ${EXPR_DIR}/GSE473/processed/asthma_med_nonatop_gsms.txt ${COEXPR_DIR}/GSE473/seqcorrs_asthma_med_nonatop_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE473/seqcorrs_control_nonatop_gsms_1000.dat: ${EXPR_DIR}/GSE473 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE473/processed/expr.tsv ${EXPR_DIR}/GSE473/processed/control_nonatop_gsms.txt ${COEXPR_DIR}/GSE473/seqcorrs_control_nonatop_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE473/seqcorrs_control_nonatop_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE473 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE473/processed/expr.tsv ${EXPR_DIR}/GSE473/processed/control_nonatop_gsms.txt ${COEXPR_DIR}/GSE473/seqcorrs_control_nonatop_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE473/seqcorrs_control_nonatop_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE473 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE473/processed/expr.tsv ${EXPR_DIR}/GSE473/processed/control_nonatop_gsms.txt ${COEXPR_DIR}/GSE473/seqcorrs_control_nonatop_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE47460/seqcorrs_disease_gsms_1000.dat: ${EXPR_DIR}/GSE47460 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE47460/processed/expr.tsv ${EXPR_DIR}/GSE47460/processed/disease_gsms.txt ${COEXPR_DIR}/GSE47460/seqcorrs_disease_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE47460/seqcorrs_disease_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE47460 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE47460/processed/expr.tsv ${EXPR_DIR}/GSE47460/processed/disease_gsms.txt ${COEXPR_DIR}/GSE47460/seqcorrs_disease_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE47460/seqcorrs_disease_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE47460 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE47460/processed/expr.tsv ${EXPR_DIR}/GSE47460/processed/disease_gsms.txt ${COEXPR_DIR}/GSE47460/seqcorrs_disease_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE47460/seqcorrs_healthy_gsms_1000.dat: ${EXPR_DIR}/GSE47460 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE47460/processed/expr.tsv ${EXPR_DIR}/GSE47460/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE47460/seqcorrs_healthy_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE47460/seqcorrs_healthy_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE47460 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE47460/processed/expr.tsv ${EXPR_DIR}/GSE47460/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE47460/seqcorrs_healthy_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE47460/seqcorrs_healthy_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE47460 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE47460/processed/expr.tsv ${EXPR_DIR}/GSE47460/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE47460/seqcorrs_healthy_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE54837/seqcorrs_disease_gsms_1000.dat: ${EXPR_DIR}/GSE54837 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE54837/processed/expr.tsv ${EXPR_DIR}/GSE54837/processed/disease_gsms.txt ${COEXPR_DIR}/GSE54837/seqcorrs_disease_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE54837/seqcorrs_disease_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE54837 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE54837/processed/expr.tsv ${EXPR_DIR}/GSE54837/processed/disease_gsms.txt ${COEXPR_DIR}/GSE54837/seqcorrs_disease_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE54837/seqcorrs_disease_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE54837 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE54837/processed/expr.tsv ${EXPR_DIR}/GSE54837/processed/disease_gsms.txt ${COEXPR_DIR}/GSE54837/seqcorrs_disease_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE54837/seqcorrs_healthy_gsms_1000.dat: ${EXPR_DIR}/GSE54837 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE54837/processed/expr.tsv ${EXPR_DIR}/GSE54837/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE54837/seqcorrs_healthy_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE54837/seqcorrs_healthy_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE54837 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE54837/processed/expr.tsv ${EXPR_DIR}/GSE54837/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE54837/seqcorrs_healthy_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE54837/seqcorrs_healthy_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE54837 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE54837/processed/expr.tsv ${EXPR_DIR}/GSE54837/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE54837/seqcorrs_healthy_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE57148/seqcorrs_disease_gsms_1000.dat: ${EXPR_DIR}/GSE57148 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${COEXPR_DIR}/GSE57148/seqcorrs_disease_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE57148/seqcorrs_disease_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE57148 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${COEXPR_DIR}/GSE57148/seqcorrs_disease_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE57148/seqcorrs_disease_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE57148 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${COEXPR_DIR}/GSE57148/seqcorrs_disease_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE57148/seqcorrs_healthy_gsms_1000.dat: ${EXPR_DIR}/GSE57148 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE57148/seqcorrs_healthy_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE57148/seqcorrs_healthy_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE57148 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE57148/seqcorrs_healthy_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE57148/seqcorrs_healthy_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE57148 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE57148/seqcorrs_healthy_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE64913/seqcorrs_asthma_cae_gsms_1000.dat: ${EXPR_DIR}/GSE64913 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE64913/processed/expr.tsv ${EXPR_DIR}/GSE64913/processed/asthma_cae_gsms.txt ${COEXPR_DIR}/GSE64913/seqcorrs_asthma_cae_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE64913/seqcorrs_asthma_cae_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE64913 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE64913/processed/expr.tsv ${EXPR_DIR}/GSE64913/processed/asthma_cae_gsms.txt ${COEXPR_DIR}/GSE64913/seqcorrs_asthma_cae_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE64913/seqcorrs_asthma_cae_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE64913 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE64913/processed/expr.tsv ${EXPR_DIR}/GSE64913/processed/asthma_cae_gsms.txt ${COEXPR_DIR}/GSE64913/seqcorrs_asthma_cae_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE64913/seqcorrs_asthma_pae_gsms_1000.dat: ${EXPR_DIR}/GSE64913 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE64913/processed/expr.tsv ${EXPR_DIR}/GSE64913/processed/asthma_pae_gsms.txt ${COEXPR_DIR}/GSE64913/seqcorrs_asthma_pae_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE64913/seqcorrs_asthma_pae_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE64913 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE64913/processed/expr.tsv ${EXPR_DIR}/GSE64913/processed/asthma_pae_gsms.txt ${COEXPR_DIR}/GSE64913/seqcorrs_asthma_pae_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE64913/seqcorrs_asthma_pae_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE64913 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE64913/processed/expr.tsv ${EXPR_DIR}/GSE64913/processed/asthma_pae_gsms.txt ${COEXPR_DIR}/GSE64913/seqcorrs_asthma_pae_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE64913/seqcorrs_healthy_cae_gsms_1000.dat: ${EXPR_DIR}/GSE64913 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE64913/processed/expr.tsv ${EXPR_DIR}/GSE64913/processed/healthy_cae_gsms.txt ${COEXPR_DIR}/GSE64913/seqcorrs_healthy_cae_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE64913/seqcorrs_healthy_cae_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE64913 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE64913/processed/expr.tsv ${EXPR_DIR}/GSE64913/processed/healthy_cae_gsms.txt ${COEXPR_DIR}/GSE64913/seqcorrs_healthy_cae_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE64913/seqcorrs_healthy_cae_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE64913 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE64913/processed/expr.tsv ${EXPR_DIR}/GSE64913/processed/healthy_cae_gsms.txt ${COEXPR_DIR}/GSE64913/seqcorrs_healthy_cae_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE64913/seqcorrs_healthy_pae_gsms_1000.dat: ${EXPR_DIR}/GSE64913 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE64913/processed/expr.tsv ${EXPR_DIR}/GSE64913/processed/healthy_pae_gsms.txt ${COEXPR_DIR}/GSE64913/seqcorrs_healthy_pae_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE64913/seqcorrs_healthy_pae_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE64913 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE64913/processed/expr.tsv ${EXPR_DIR}/GSE64913/processed/healthy_pae_gsms.txt ${COEXPR_DIR}/GSE64913/seqcorrs_healthy_pae_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE64913/seqcorrs_healthy_pae_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE64913 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE64913/processed/expr.tsv ${EXPR_DIR}/GSE64913/processed/healthy_pae_gsms.txt ${COEXPR_DIR}/GSE64913/seqcorrs_healthy_pae_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE85567/seqcorrs_disease_gsms_1000.dat: ${EXPR_DIR}/GSE85567 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE85567/processed/expr.tsv ${EXPR_DIR}/GSE85567/processed/disease_gsms.txt ${COEXPR_DIR}/GSE85567/seqcorrs_disease_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE85567/seqcorrs_disease_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE85567 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE85567/processed/expr.tsv ${EXPR_DIR}/GSE85567/processed/disease_gsms.txt ${COEXPR_DIR}/GSE85567/seqcorrs_disease_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE85567/seqcorrs_disease_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE85567 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE85567/processed/expr.tsv ${EXPR_DIR}/GSE85567/processed/disease_gsms.txt ${COEXPR_DIR}/GSE85567/seqcorrs_disease_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE85567/seqcorrs_healthy_gsms_1000.dat: ${EXPR_DIR}/GSE85567 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE85567/processed/expr.tsv ${EXPR_DIR}/GSE85567/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE85567/seqcorrs_healthy_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE85567/seqcorrs_healthy_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE85567 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE85567/processed/expr.tsv ${EXPR_DIR}/GSE85567/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE85567/seqcorrs_healthy_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE85567/seqcorrs_healthy_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE85567 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE85567/processed/expr.tsv ${EXPR_DIR}/GSE85567/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE85567/seqcorrs_healthy_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE8581/seqcorrs_disease_gsms_1000.dat: ${EXPR_DIR}/GSE8581 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE8581/processed/expr.tsv ${EXPR_DIR}/GSE8581/processed/disease_gsms.txt ${COEXPR_DIR}/GSE8581/seqcorrs_disease_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE8581/seqcorrs_disease_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE8581 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE8581/processed/expr.tsv ${EXPR_DIR}/GSE8581/processed/disease_gsms.txt ${COEXPR_DIR}/GSE8581/seqcorrs_disease_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE8581/seqcorrs_disease_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE8581 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE8581/processed/expr.tsv ${EXPR_DIR}/GSE8581/processed/disease_gsms.txt ${COEXPR_DIR}/GSE8581/seqcorrs_disease_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE8581/seqcorrs_healthy_gsms_1000.dat: ${EXPR_DIR}/GSE8581 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE8581/processed/expr.tsv ${EXPR_DIR}/GSE8581/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE8581/seqcorrs_healthy_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE8581/seqcorrs_healthy_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE8581 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE8581/processed/expr.tsv ${EXPR_DIR}/GSE8581/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE8581/seqcorrs_healthy_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE8581/seqcorrs_healthy_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE8581 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE8581/processed/expr.tsv ${EXPR_DIR}/GSE8581/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE8581/seqcorrs_healthy_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE89809/seqcorrs_Healthy_BAL_gsms_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Healthy_BAL_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_Healthy_BAL_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE89809/seqcorrs_Healthy_BAL_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Healthy_BAL_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_Healthy_BAL_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE89809/seqcorrs_Healthy_BAL_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Healthy_BAL_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_Healthy_BAL_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE89809/seqcorrs_Healthy_Epithelial_gsms_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Healthy_Epithelial_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_Healthy_Epithelial_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE89809/seqcorrs_Healthy_Epithelial_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Healthy_Epithelial_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_Healthy_Epithelial_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE89809/seqcorrs_Healthy_Epithelial_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Healthy_Epithelial_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_Healthy_Epithelial_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE89809/seqcorrs_Healthy_Spm_gsms_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Healthy_Spm_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_Healthy_Spm_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE89809/seqcorrs_Healthy_Spm_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Healthy_Spm_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_Healthy_Spm_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE89809/seqcorrs_Healthy_Spm_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Healthy_Spm_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_Healthy_Spm_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE89809/seqcorrs_Mild_BAL_gsms_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Mild_BAL_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_Mild_BAL_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE89809/seqcorrs_Mild_BAL_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Mild_BAL_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_Mild_BAL_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE89809/seqcorrs_Mild_BAL_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Mild_BAL_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_Mild_BAL_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE89809/seqcorrs_Mild_Epithelial_gsms_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Mild_Epithelial_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_Mild_Epithelial_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE89809/seqcorrs_Mild_Epithelial_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Mild_Epithelial_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_Mild_Epithelial_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE89809/seqcorrs_Mild_Epithelial_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Mild_Epithelial_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_Mild_Epithelial_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE89809/seqcorrs_Mild_Spm_gsms_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Mild_Spm_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_Mild_Spm_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE89809/seqcorrs_Mild_Spm_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Mild_Spm_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_Mild_Spm_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE89809/seqcorrs_Mild_Spm_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Mild_Spm_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_Mild_Spm_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE89809/seqcorrs_Moderate_BAL_gsms_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Moderate_BAL_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_Moderate_BAL_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE89809/seqcorrs_Moderate_BAL_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Moderate_BAL_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_Moderate_BAL_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE89809/seqcorrs_Moderate_BAL_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Moderate_BAL_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_Moderate_BAL_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE89809/seqcorrs_Moderate_Epithelial_gsms_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Moderate_Epithelial_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_Moderate_Epithelial_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE89809/seqcorrs_Moderate_Epithelial_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Moderate_Epithelial_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_Moderate_Epithelial_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE89809/seqcorrs_Moderate_Epithelial_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Moderate_Epithelial_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_Moderate_Epithelial_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE89809/seqcorrs_Moderate_Spm_gsms_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Moderate_Spm_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_Moderate_Spm_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE89809/seqcorrs_Moderate_Spm_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Moderate_Spm_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_Moderate_Spm_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE89809/seqcorrs_Moderate_Spm_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Moderate_Spm_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_Moderate_Spm_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE89809/seqcorrs_Severe_BAL_gsms_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Severe_BAL_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_Severe_BAL_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE89809/seqcorrs_Severe_BAL_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Severe_BAL_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_Severe_BAL_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE89809/seqcorrs_Severe_BAL_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Severe_BAL_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_Severe_BAL_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE89809/seqcorrs_Severe_Epithelial_gsms_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Severe_Epithelial_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_Severe_Epithelial_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE89809/seqcorrs_Severe_Epithelial_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Severe_Epithelial_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_Severe_Epithelial_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE89809/seqcorrs_Severe_Epithelial_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Severe_Epithelial_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_Severe_Epithelial_gsms_rdm_b_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE89809/seqcorrs_Severe_Spm_gsms_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Severe_Spm_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_Severe_Spm_gsms_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE89809/seqcorrs_Severe_Spm_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Severe_Spm_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_Severe_Spm_gsms_rdm_a_1000.dat -n ${N_CORES}
${COEXPR_DIR}/GSE89809/seqcorrs_Severe_Spm_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Severe_Spm_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_Severe_Spm_gsms_rdm_b_1000.dat -n ${N_CORES}

#########################################################

#          SEQUENTIAL COEXPRESSION (SPEARMAN)           #

#########################################################

${COEXPR_DIR}/GSE104468/seqcorrs_spearman_asthma_bronch_gsms_1000.dat: ${EXPR_DIR}/GSE104468 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE104468/processed/expr.tsv ${EXPR_DIR}/GSE104468/processed/asthma_bronch_gsms.txt ${COEXPR_DIR}/GSE104468/seqcorrs_spearman_asthma_bronch_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE104468/seqcorrs_spearman_asthma_bronch_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE104468 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE104468/processed/expr.tsv ${EXPR_DIR}/GSE104468/processed/asthma_bronch_gsms.txt ${COEXPR_DIR}/GSE104468/seqcorrs_spearman_asthma_bronch_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE104468/seqcorrs_spearman_asthma_bronch_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE104468 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE104468/processed/expr.tsv ${EXPR_DIR}/GSE104468/processed/asthma_bronch_gsms.txt ${COEXPR_DIR}/GSE104468/seqcorrs_spearman_asthma_bronch_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE104468/seqcorrs_spearman_asthma_nasal_gsms_1000.dat: ${EXPR_DIR}/GSE104468 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE104468/processed/expr.tsv ${EXPR_DIR}/GSE104468/processed/asthma_nasal_gsms.txt ${COEXPR_DIR}/GSE104468/seqcorrs_spearman_asthma_nasal_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE104468/seqcorrs_spearman_asthma_nasal_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE104468 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE104468/processed/expr.tsv ${EXPR_DIR}/GSE104468/processed/asthma_nasal_gsms.txt ${COEXPR_DIR}/GSE104468/seqcorrs_spearman_asthma_nasal_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE104468/seqcorrs_spearman_asthma_nasal_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE104468 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE104468/processed/expr.tsv ${EXPR_DIR}/GSE104468/processed/asthma_nasal_gsms.txt ${COEXPR_DIR}/GSE104468/seqcorrs_spearman_asthma_nasal_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE104468/seqcorrs_spearman_asthma_pbmc_gsms_1000.dat: ${EXPR_DIR}/GSE104468 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE104468/processed/expr.tsv ${EXPR_DIR}/GSE104468/processed/asthma_pbmc_gsms.txt ${COEXPR_DIR}/GSE104468/seqcorrs_spearman_asthma_pbmc_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE104468/seqcorrs_spearman_asthma_pbmc_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE104468 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE104468/processed/expr.tsv ${EXPR_DIR}/GSE104468/processed/asthma_pbmc_gsms.txt ${COEXPR_DIR}/GSE104468/seqcorrs_spearman_asthma_pbmc_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE104468/seqcorrs_spearman_asthma_pbmc_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE104468 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE104468/processed/expr.tsv ${EXPR_DIR}/GSE104468/processed/asthma_pbmc_gsms.txt ${COEXPR_DIR}/GSE104468/seqcorrs_spearman_asthma_pbmc_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE104468/seqcorrs_spearman_normal_bronch_gsms_1000.dat: ${EXPR_DIR}/GSE104468 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE104468/processed/expr.tsv ${EXPR_DIR}/GSE104468/processed/normal_bronch_gsms.txt ${COEXPR_DIR}/GSE104468/seqcorrs_spearman_normal_bronch_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE104468/seqcorrs_spearman_normal_bronch_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE104468 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE104468/processed/expr.tsv ${EXPR_DIR}/GSE104468/processed/normal_bronch_gsms.txt ${COEXPR_DIR}/GSE104468/seqcorrs_spearman_normal_bronch_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE104468/seqcorrs_spearman_normal_bronch_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE104468 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE104468/processed/expr.tsv ${EXPR_DIR}/GSE104468/processed/normal_bronch_gsms.txt ${COEXPR_DIR}/GSE104468/seqcorrs_spearman_normal_bronch_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE104468/seqcorrs_spearman_normal_nasal_gsms_1000.dat: ${EXPR_DIR}/GSE104468 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE104468/processed/expr.tsv ${EXPR_DIR}/GSE104468/processed/normal_nasal_gsms.txt ${COEXPR_DIR}/GSE104468/seqcorrs_spearman_normal_nasal_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE104468/seqcorrs_spearman_normal_nasal_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE104468 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE104468/processed/expr.tsv ${EXPR_DIR}/GSE104468/processed/normal_nasal_gsms.txt ${COEXPR_DIR}/GSE104468/seqcorrs_spearman_normal_nasal_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE104468/seqcorrs_spearman_normal_nasal_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE104468 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE104468/processed/expr.tsv ${EXPR_DIR}/GSE104468/processed/normal_nasal_gsms.txt ${COEXPR_DIR}/GSE104468/seqcorrs_spearman_normal_nasal_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE104468/seqcorrs_spearman_normal_pbmc_gsms_1000.dat: ${EXPR_DIR}/GSE104468 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE104468/processed/expr.tsv ${EXPR_DIR}/GSE104468/processed/normal_pbmc_gsms.txt ${COEXPR_DIR}/GSE104468/seqcorrs_spearman_normal_pbmc_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE104468/seqcorrs_spearman_normal_pbmc_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE104468 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE104468/processed/expr.tsv ${EXPR_DIR}/GSE104468/processed/normal_pbmc_gsms.txt ${COEXPR_DIR}/GSE104468/seqcorrs_spearman_normal_pbmc_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE104468/seqcorrs_spearman_normal_pbmc_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE104468 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE104468/processed/expr.tsv ${EXPR_DIR}/GSE104468/processed/normal_pbmc_gsms.txt ${COEXPR_DIR}/GSE104468/seqcorrs_spearman_normal_pbmc_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE13896/seqcorrs_spearman_disease_gsms_1000.dat: ${EXPR_DIR}/GSE13896 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE13896/processed/expr.tsv ${EXPR_DIR}/GSE13896/processed/disease_gsms.txt ${COEXPR_DIR}/GSE13896/seqcorrs_spearman_disease_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE13896/seqcorrs_spearman_disease_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE13896 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE13896/processed/expr.tsv ${EXPR_DIR}/GSE13896/processed/disease_gsms.txt ${COEXPR_DIR}/GSE13896/seqcorrs_spearman_disease_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE13896/seqcorrs_spearman_disease_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE13896 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE13896/processed/expr.tsv ${EXPR_DIR}/GSE13896/processed/disease_gsms.txt ${COEXPR_DIR}/GSE13896/seqcorrs_spearman_disease_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE13896/seqcorrs_spearman_healthy_gsms_1000.dat: ${EXPR_DIR}/GSE13896 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE13896/processed/expr.tsv ${EXPR_DIR}/GSE13896/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE13896/seqcorrs_spearman_healthy_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE13896/seqcorrs_spearman_healthy_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE13896 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE13896/processed/expr.tsv ${EXPR_DIR}/GSE13896/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE13896/seqcorrs_spearman_healthy_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE13896/seqcorrs_spearman_healthy_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE13896 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE13896/processed/expr.tsv ${EXPR_DIR}/GSE13896/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE13896/seqcorrs_spearman_healthy_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE13896/seqcorrs_spearman_healthy_non_smoker_gsms_1000.dat: ${EXPR_DIR}/GSE13896 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE13896/processed/expr.tsv ${EXPR_DIR}/GSE13896/processed/healthy_non_smoker_gsms.txt ${COEXPR_DIR}/GSE13896/seqcorrs_spearman_healthy_non_smoker_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE13896/seqcorrs_spearman_healthy_non_smoker_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE13896 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE13896/processed/expr.tsv ${EXPR_DIR}/GSE13896/processed/healthy_non_smoker_gsms.txt ${COEXPR_DIR}/GSE13896/seqcorrs_spearman_healthy_non_smoker_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE13896/seqcorrs_spearman_healthy_non_smoker_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE13896 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE13896/processed/expr.tsv ${EXPR_DIR}/GSE13896/processed/healthy_non_smoker_gsms.txt ${COEXPR_DIR}/GSE13896/seqcorrs_spearman_healthy_non_smoker_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE16032/seqcorrs_spearman_disease_gsms_1000.dat: ${EXPR_DIR}/GSE16032 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE16032/processed/expr.tsv ${EXPR_DIR}/GSE16032/processed/disease_gsms.txt ${COEXPR_DIR}/GSE16032/seqcorrs_spearman_disease_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE16032/seqcorrs_spearman_disease_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE16032 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE16032/processed/expr.tsv ${EXPR_DIR}/GSE16032/processed/disease_gsms.txt ${COEXPR_DIR}/GSE16032/seqcorrs_spearman_disease_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE16032/seqcorrs_spearman_disease_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE16032 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE16032/processed/expr.tsv ${EXPR_DIR}/GSE16032/processed/disease_gsms.txt ${COEXPR_DIR}/GSE16032/seqcorrs_spearman_disease_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE16972/seqcorrs_spearman_control_gsms_1000.dat: ${EXPR_DIR}/GSE16972 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE16972/processed/expr.tsv ${EXPR_DIR}/GSE16972/processed/control_gsms.txt ${COEXPR_DIR}/GSE16972/seqcorrs_spearman_control_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE16972/seqcorrs_spearman_control_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE16972 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE16972/processed/expr.tsv ${EXPR_DIR}/GSE16972/processed/control_gsms.txt ${COEXPR_DIR}/GSE16972/seqcorrs_spearman_control_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE16972/seqcorrs_spearman_control_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE16972 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE16972/processed/expr.tsv ${EXPR_DIR}/GSE16972/processed/control_gsms.txt ${COEXPR_DIR}/GSE16972/seqcorrs_spearman_control_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE16972/seqcorrs_spearman_copd_gsms_1000.dat: ${EXPR_DIR}/GSE16972 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE16972/processed/expr.tsv ${EXPR_DIR}/GSE16972/processed/copd_gsms.txt ${COEXPR_DIR}/GSE16972/seqcorrs_spearman_copd_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE16972/seqcorrs_spearman_copd_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE16972 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE16972/processed/expr.tsv ${EXPR_DIR}/GSE16972/processed/copd_gsms.txt ${COEXPR_DIR}/GSE16972/seqcorrs_spearman_copd_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE16972/seqcorrs_spearman_copd_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE16972 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE16972/processed/expr.tsv ${EXPR_DIR}/GSE16972/processed/copd_gsms.txt ${COEXPR_DIR}/GSE16972/seqcorrs_spearman_copd_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE18965/seqcorrs_spearman_disease_gsms_1000.dat: ${EXPR_DIR}/GSE18965 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE18965/processed/expr.tsv ${EXPR_DIR}/GSE18965/processed/disease_gsms.txt ${COEXPR_DIR}/GSE18965/seqcorrs_spearman_disease_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE18965/seqcorrs_spearman_disease_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE18965 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE18965/processed/expr.tsv ${EXPR_DIR}/GSE18965/processed/disease_gsms.txt ${COEXPR_DIR}/GSE18965/seqcorrs_spearman_disease_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE18965/seqcorrs_spearman_disease_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE18965 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE18965/processed/expr.tsv ${EXPR_DIR}/GSE18965/processed/disease_gsms.txt ${COEXPR_DIR}/GSE18965/seqcorrs_spearman_disease_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE18965/seqcorrs_spearman_healthy_gsms_1000.dat: ${EXPR_DIR}/GSE18965 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE18965/processed/expr.tsv ${EXPR_DIR}/GSE18965/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE18965/seqcorrs_spearman_healthy_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE18965/seqcorrs_spearman_healthy_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE18965 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE18965/processed/expr.tsv ${EXPR_DIR}/GSE18965/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE18965/seqcorrs_spearman_healthy_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE18965/seqcorrs_spearman_healthy_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE18965 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE18965/processed/expr.tsv ${EXPR_DIR}/GSE18965/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE18965/seqcorrs_spearman_healthy_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE22148/seqcorrs_spearman_disease_gsms_1000.dat: ${EXPR_DIR}/GSE22148 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE22148/processed/expr.tsv ${EXPR_DIR}/GSE22148/processed/disease_gsms.txt ${COEXPR_DIR}/GSE22148/seqcorrs_spearman_disease_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE22148/seqcorrs_spearman_disease_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE22148 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE22148/processed/expr.tsv ${EXPR_DIR}/GSE22148/processed/disease_gsms.txt ${COEXPR_DIR}/GSE22148/seqcorrs_spearman_disease_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE22148/seqcorrs_spearman_disease_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE22148 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE22148/processed/expr.tsv ${EXPR_DIR}/GSE22148/processed/disease_gsms.txt ${COEXPR_DIR}/GSE22148/seqcorrs_spearman_disease_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE31773/seqcorrs_spearman_healthy_gsms_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_healthy_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE31773/seqcorrs_spearman_healthy_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_healthy_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE31773/seqcorrs_spearman_healthy_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_healthy_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE31773/seqcorrs_spearman_asthma_severe_gsms_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/asthma_severe_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_asthma_severe_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE31773/seqcorrs_spearman_asthma_severe_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/asthma_severe_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_asthma_severe_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE31773/seqcorrs_spearman_asthma_severe_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/asthma_severe_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_asthma_severe_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd4_healthy_gsms_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/cd4_healthy_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd4_healthy_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd4_healthy_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/cd4_healthy_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd4_healthy_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd4_healthy_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/cd4_healthy_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd4_healthy_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd4_non_severe_gsms_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/cd4_non_severe_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd4_non_severe_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd4_non_severe_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/cd4_non_severe_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd4_non_severe_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd4_non_severe_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/cd4_non_severe_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd4_non_severe_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd4_severe_gsms_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/cd4_severe_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd4_severe_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd4_severe_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/cd4_severe_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd4_severe_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd4_severe_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/cd4_severe_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd4_severe_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd8_healthy_gsms_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/cd8_healthy_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd8_healthy_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd8_healthy_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/cd8_healthy_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd8_healthy_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd8_healthy_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/cd8_healthy_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd8_healthy_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd8_non_severe_gsms_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/cd8_non_severe_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd8_non_severe_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd8_non_severe_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/cd8_non_severe_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd8_non_severe_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd8_non_severe_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/cd8_non_severe_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd8_non_severe_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd8_severe_gsms_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/cd8_severe_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd8_severe_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd8_severe_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/cd8_severe_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd8_severe_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd8_severe_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE31773 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE31773/processed/expr.tsv ${EXPR_DIR}/GSE31773/processed/cd8_severe_gsms.txt ${COEXPR_DIR}/GSE31773/seqcorrs_spearman_cd8_severe_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE37147/seqcorrs_spearman_disease_gsms_1000.dat: ${EXPR_DIR}/GSE37147 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE37147/processed/expr.tsv ${EXPR_DIR}/GSE37147/processed/disease_gsms.txt ${COEXPR_DIR}/GSE37147/seqcorrs_spearman_disease_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE37147/seqcorrs_spearman_disease_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE37147 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE37147/processed/expr.tsv ${EXPR_DIR}/GSE37147/processed/disease_gsms.txt ${COEXPR_DIR}/GSE37147/seqcorrs_spearman_disease_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE37147/seqcorrs_spearman_disease_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE37147 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE37147/processed/expr.tsv ${EXPR_DIR}/GSE37147/processed/disease_gsms.txt ${COEXPR_DIR}/GSE37147/seqcorrs_spearman_disease_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE37147/seqcorrs_spearman_disease_no_history_asthma_gsms_1000.dat: ${EXPR_DIR}/GSE37147 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE37147/processed/expr.tsv ${EXPR_DIR}/GSE37147/processed/disease_no_history_asthma_gsms.txt ${COEXPR_DIR}/GSE37147/seqcorrs_spearman_disease_no_history_asthma_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE37147/seqcorrs_spearman_disease_no_history_asthma_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE37147 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE37147/processed/expr.tsv ${EXPR_DIR}/GSE37147/processed/disease_no_history_asthma_gsms.txt ${COEXPR_DIR}/GSE37147/seqcorrs_spearman_disease_no_history_asthma_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE37147/seqcorrs_spearman_disease_no_history_asthma_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE37147 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE37147/processed/expr.tsv ${EXPR_DIR}/GSE37147/processed/disease_no_history_asthma_gsms.txt ${COEXPR_DIR}/GSE37147/seqcorrs_spearman_disease_no_history_asthma_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE37147/seqcorrs_spearman_healthy_gsms_1000.dat: ${EXPR_DIR}/GSE37147 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE37147/processed/expr.tsv ${EXPR_DIR}/GSE37147/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE37147/seqcorrs_spearman_healthy_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE37147/seqcorrs_spearman_healthy_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE37147 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE37147/processed/expr.tsv ${EXPR_DIR}/GSE37147/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE37147/seqcorrs_spearman_healthy_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE37147/seqcorrs_spearman_healthy_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE37147 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE37147/processed/expr.tsv ${EXPR_DIR}/GSE37147/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE37147/seqcorrs_spearman_healthy_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE37147/seqcorrs_spearman_healthy_no_history_asthma_gsms_1000.dat: ${EXPR_DIR}/GSE37147 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE37147/processed/expr.tsv ${EXPR_DIR}/GSE37147/processed/healthy_no_history_asthma_gsms.txt ${COEXPR_DIR}/GSE37147/seqcorrs_spearman_healthy_no_history_asthma_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE37147/seqcorrs_spearman_healthy_no_history_asthma_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE37147 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE37147/processed/expr.tsv ${EXPR_DIR}/GSE37147/processed/healthy_no_history_asthma_gsms.txt ${COEXPR_DIR}/GSE37147/seqcorrs_spearman_healthy_no_history_asthma_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE37147/seqcorrs_spearman_healthy_no_history_asthma_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE37147 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE37147/processed/expr.tsv ${EXPR_DIR}/GSE37147/processed/healthy_no_history_asthma_gsms.txt ${COEXPR_DIR}/GSE37147/seqcorrs_spearman_healthy_no_history_asthma_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE42057/seqcorrs_spearman_disease_gsms_1000.dat: ${EXPR_DIR}/GSE42057 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE42057/processed/expr.tsv ${EXPR_DIR}/GSE42057/processed/disease_gsms.txt ${COEXPR_DIR}/GSE42057/seqcorrs_spearman_disease_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE42057/seqcorrs_spearman_disease_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE42057 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE42057/processed/expr.tsv ${EXPR_DIR}/GSE42057/processed/disease_gsms.txt ${COEXPR_DIR}/GSE42057/seqcorrs_spearman_disease_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE42057/seqcorrs_spearman_disease_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE42057 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE42057/processed/expr.tsv ${EXPR_DIR}/GSE42057/processed/disease_gsms.txt ${COEXPR_DIR}/GSE42057/seqcorrs_spearman_disease_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE42057/seqcorrs_spearman_healthy_gsms_1000.dat: ${EXPR_DIR}/GSE42057 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE42057/processed/expr.tsv ${EXPR_DIR}/GSE42057/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE42057/seqcorrs_spearman_healthy_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE42057/seqcorrs_spearman_healthy_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE42057 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE42057/processed/expr.tsv ${EXPR_DIR}/GSE42057/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE42057/seqcorrs_spearman_healthy_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE42057/seqcorrs_spearman_healthy_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE42057 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE42057/processed/expr.tsv ${EXPR_DIR}/GSE42057/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE42057/seqcorrs_spearman_healthy_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE4302/seqcorrs_spearman_disease_gsms_1000.dat: ${EXPR_DIR}/GSE4302 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE4302/processed/expr.tsv ${EXPR_DIR}/GSE4302/processed/disease_gsms.txt ${COEXPR_DIR}/GSE4302/seqcorrs_spearman_disease_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE4302/seqcorrs_spearman_disease_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE4302 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE4302/processed/expr.tsv ${EXPR_DIR}/GSE4302/processed/disease_gsms.txt ${COEXPR_DIR}/GSE4302/seqcorrs_spearman_disease_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE4302/seqcorrs_spearman_disease_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE4302 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE4302/processed/expr.tsv ${EXPR_DIR}/GSE4302/processed/disease_gsms.txt ${COEXPR_DIR}/GSE4302/seqcorrs_spearman_disease_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE4302/seqcorrs_spearman_healthy_gsms_1000.dat: ${EXPR_DIR}/GSE4302 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE4302/processed/expr.tsv ${EXPR_DIR}/GSE4302/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE4302/seqcorrs_spearman_healthy_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE4302/seqcorrs_spearman_healthy_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE4302 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE4302/processed/expr.tsv ${EXPR_DIR}/GSE4302/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE4302/seqcorrs_spearman_healthy_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE4302/seqcorrs_spearman_healthy_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE4302 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE4302/processed/expr.tsv ${EXPR_DIR}/GSE4302/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE4302/seqcorrs_spearman_healthy_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE473/seqcorrs_spearman_asthma_med_nonatop_gsms_1000.dat: ${EXPR_DIR}/GSE473 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE473/processed/expr.tsv ${EXPR_DIR}/GSE473/processed/asthma_med_nonatop_gsms.txt ${COEXPR_DIR}/GSE473/seqcorrs_spearman_asthma_med_nonatop_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE473/seqcorrs_spearman_asthma_med_nonatop_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE473 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE473/processed/expr.tsv ${EXPR_DIR}/GSE473/processed/asthma_med_nonatop_gsms.txt ${COEXPR_DIR}/GSE473/seqcorrs_spearman_asthma_med_nonatop_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE473/seqcorrs_spearman_asthma_med_nonatop_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE473 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE473/processed/expr.tsv ${EXPR_DIR}/GSE473/processed/asthma_med_nonatop_gsms.txt ${COEXPR_DIR}/GSE473/seqcorrs_spearman_asthma_med_nonatop_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE473/seqcorrs_spearman_control_nonatop_gsms_1000.dat: ${EXPR_DIR}/GSE473 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE473/processed/expr.tsv ${EXPR_DIR}/GSE473/processed/control_nonatop_gsms.txt ${COEXPR_DIR}/GSE473/seqcorrs_spearman_control_nonatop_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE473/seqcorrs_spearman_control_nonatop_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE473 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE473/processed/expr.tsv ${EXPR_DIR}/GSE473/processed/control_nonatop_gsms.txt ${COEXPR_DIR}/GSE473/seqcorrs_spearman_control_nonatop_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE473/seqcorrs_spearman_control_nonatop_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE473 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE473/processed/expr.tsv ${EXPR_DIR}/GSE473/processed/control_nonatop_gsms.txt ${COEXPR_DIR}/GSE473/seqcorrs_spearman_control_nonatop_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE47460/seqcorrs_spearman_disease_gsms_1000.dat: ${EXPR_DIR}/GSE47460 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE47460/processed/expr.tsv ${EXPR_DIR}/GSE47460/processed/disease_gsms.txt ${COEXPR_DIR}/GSE47460/seqcorrs_spearman_disease_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE47460/seqcorrs_spearman_disease_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE47460 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE47460/processed/expr.tsv ${EXPR_DIR}/GSE47460/processed/disease_gsms.txt ${COEXPR_DIR}/GSE47460/seqcorrs_spearman_disease_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE47460/seqcorrs_spearman_disease_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE47460 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE47460/processed/expr.tsv ${EXPR_DIR}/GSE47460/processed/disease_gsms.txt ${COEXPR_DIR}/GSE47460/seqcorrs_spearman_disease_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE47460/seqcorrs_spearman_healthy_gsms_1000.dat: ${EXPR_DIR}/GSE47460 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE47460/processed/expr.tsv ${EXPR_DIR}/GSE47460/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE47460/seqcorrs_spearman_healthy_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE47460/seqcorrs_spearman_healthy_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE47460 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE47460/processed/expr.tsv ${EXPR_DIR}/GSE47460/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE47460/seqcorrs_spearman_healthy_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE47460/seqcorrs_spearman_healthy_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE47460 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE47460/processed/expr.tsv ${EXPR_DIR}/GSE47460/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE47460/seqcorrs_spearman_healthy_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE54837/seqcorrs_spearman_disease_gsms_1000.dat: ${EXPR_DIR}/GSE54837 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE54837/processed/expr.tsv ${EXPR_DIR}/GSE54837/processed/disease_gsms.txt ${COEXPR_DIR}/GSE54837/seqcorrs_spearman_disease_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE54837/seqcorrs_spearman_disease_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE54837 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE54837/processed/expr.tsv ${EXPR_DIR}/GSE54837/processed/disease_gsms.txt ${COEXPR_DIR}/GSE54837/seqcorrs_spearman_disease_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE54837/seqcorrs_spearman_disease_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE54837 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE54837/processed/expr.tsv ${EXPR_DIR}/GSE54837/processed/disease_gsms.txt ${COEXPR_DIR}/GSE54837/seqcorrs_spearman_disease_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE54837/seqcorrs_spearman_healthy_gsms_1000.dat: ${EXPR_DIR}/GSE54837 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE54837/processed/expr.tsv ${EXPR_DIR}/GSE54837/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE54837/seqcorrs_spearman_healthy_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE54837/seqcorrs_spearman_healthy_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE54837 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE54837/processed/expr.tsv ${EXPR_DIR}/GSE54837/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE54837/seqcorrs_spearman_healthy_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE54837/seqcorrs_spearman_healthy_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE54837 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE54837/processed/expr.tsv ${EXPR_DIR}/GSE54837/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE54837/seqcorrs_spearman_healthy_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE57148/seqcorrs_spearman_disease_gsms_1000.dat: ${EXPR_DIR}/GSE57148 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${COEXPR_DIR}/GSE57148/seqcorrs_spearman_disease_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE57148/seqcorrs_spearman_disease_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE57148 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${COEXPR_DIR}/GSE57148/seqcorrs_spearman_disease_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE57148/seqcorrs_spearman_disease_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE57148 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${COEXPR_DIR}/GSE57148/seqcorrs_spearman_disease_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE57148/seqcorrs_spearman_healthy_gsms_1000.dat: ${EXPR_DIR}/GSE57148 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE57148/seqcorrs_spearman_healthy_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE57148/seqcorrs_spearman_healthy_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE57148 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE57148/seqcorrs_spearman_healthy_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE57148/seqcorrs_spearman_healthy_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE57148 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE57148/seqcorrs_spearman_healthy_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE64913/seqcorrs_spearman_asthma_cae_gsms_1000.dat: ${EXPR_DIR}/GSE64913 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE64913/processed/expr.tsv ${EXPR_DIR}/GSE64913/processed/asthma_cae_gsms.txt ${COEXPR_DIR}/GSE64913/seqcorrs_spearman_asthma_cae_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE64913/seqcorrs_spearman_asthma_cae_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE64913 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE64913/processed/expr.tsv ${EXPR_DIR}/GSE64913/processed/asthma_cae_gsms.txt ${COEXPR_DIR}/GSE64913/seqcorrs_spearman_asthma_cae_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE64913/seqcorrs_spearman_asthma_cae_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE64913 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE64913/processed/expr.tsv ${EXPR_DIR}/GSE64913/processed/asthma_cae_gsms.txt ${COEXPR_DIR}/GSE64913/seqcorrs_spearman_asthma_cae_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE64913/seqcorrs_spearman_asthma_pae_gsms_1000.dat: ${EXPR_DIR}/GSE64913 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE64913/processed/expr.tsv ${EXPR_DIR}/GSE64913/processed/asthma_pae_gsms.txt ${COEXPR_DIR}/GSE64913/seqcorrs_spearman_asthma_pae_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE64913/seqcorrs_spearman_asthma_pae_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE64913 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE64913/processed/expr.tsv ${EXPR_DIR}/GSE64913/processed/asthma_pae_gsms.txt ${COEXPR_DIR}/GSE64913/seqcorrs_spearman_asthma_pae_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE64913/seqcorrs_spearman_asthma_pae_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE64913 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE64913/processed/expr.tsv ${EXPR_DIR}/GSE64913/processed/asthma_pae_gsms.txt ${COEXPR_DIR}/GSE64913/seqcorrs_spearman_asthma_pae_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE64913/seqcorrs_spearman_healthy_cae_gsms_1000.dat: ${EXPR_DIR}/GSE64913 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE64913/processed/expr.tsv ${EXPR_DIR}/GSE64913/processed/healthy_cae_gsms.txt ${COEXPR_DIR}/GSE64913/seqcorrs_spearman_healthy_cae_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE64913/seqcorrs_spearman_healthy_cae_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE64913 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE64913/processed/expr.tsv ${EXPR_DIR}/GSE64913/processed/healthy_cae_gsms.txt ${COEXPR_DIR}/GSE64913/seqcorrs_spearman_healthy_cae_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE64913/seqcorrs_spearman_healthy_cae_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE64913 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE64913/processed/expr.tsv ${EXPR_DIR}/GSE64913/processed/healthy_cae_gsms.txt ${COEXPR_DIR}/GSE64913/seqcorrs_spearman_healthy_cae_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE64913/seqcorrs_spearman_healthy_pae_gsms_1000.dat: ${EXPR_DIR}/GSE64913 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE64913/processed/expr.tsv ${EXPR_DIR}/GSE64913/processed/healthy_pae_gsms.txt ${COEXPR_DIR}/GSE64913/seqcorrs_spearman_healthy_pae_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE64913/seqcorrs_spearman_healthy_pae_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE64913 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE64913/processed/expr.tsv ${EXPR_DIR}/GSE64913/processed/healthy_pae_gsms.txt ${COEXPR_DIR}/GSE64913/seqcorrs_spearman_healthy_pae_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE64913/seqcorrs_spearman_healthy_pae_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE64913 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE64913/processed/expr.tsv ${EXPR_DIR}/GSE64913/processed/healthy_pae_gsms.txt ${COEXPR_DIR}/GSE64913/seqcorrs_spearman_healthy_pae_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE85567/seqcorrs_spearman_disease_gsms_1000.dat: ${EXPR_DIR}/GSE85567 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE85567/processed/expr.tsv ${EXPR_DIR}/GSE85567/processed/disease_gsms.txt ${COEXPR_DIR}/GSE85567/seqcorrs_spearman_disease_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE85567/seqcorrs_spearman_disease_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE85567 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE85567/processed/expr.tsv ${EXPR_DIR}/GSE85567/processed/disease_gsms.txt ${COEXPR_DIR}/GSE85567/seqcorrs_spearman_disease_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE85567/seqcorrs_spearman_disease_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE85567 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE85567/processed/expr.tsv ${EXPR_DIR}/GSE85567/processed/disease_gsms.txt ${COEXPR_DIR}/GSE85567/seqcorrs_spearman_disease_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE85567/seqcorrs_spearman_healthy_gsms_1000.dat: ${EXPR_DIR}/GSE85567 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE85567/processed/expr.tsv ${EXPR_DIR}/GSE85567/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE85567/seqcorrs_spearman_healthy_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE85567/seqcorrs_spearman_healthy_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE85567 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE85567/processed/expr.tsv ${EXPR_DIR}/GSE85567/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE85567/seqcorrs_spearman_healthy_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE85567/seqcorrs_spearman_healthy_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE85567 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE85567/processed/expr.tsv ${EXPR_DIR}/GSE85567/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE85567/seqcorrs_spearman_healthy_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE8581/seqcorrs_spearman_disease_gsms_1000.dat: ${EXPR_DIR}/GSE8581 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE8581/processed/expr.tsv ${EXPR_DIR}/GSE8581/processed/disease_gsms.txt ${COEXPR_DIR}/GSE8581/seqcorrs_spearman_disease_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE8581/seqcorrs_spearman_disease_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE8581 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE8581/processed/expr.tsv ${EXPR_DIR}/GSE8581/processed/disease_gsms.txt ${COEXPR_DIR}/GSE8581/seqcorrs_spearman_disease_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE8581/seqcorrs_spearman_disease_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE8581 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE8581/processed/expr.tsv ${EXPR_DIR}/GSE8581/processed/disease_gsms.txt ${COEXPR_DIR}/GSE8581/seqcorrs_spearman_disease_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE8581/seqcorrs_spearman_healthy_gsms_1000.dat: ${EXPR_DIR}/GSE8581 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE8581/processed/expr.tsv ${EXPR_DIR}/GSE8581/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE8581/seqcorrs_spearman_healthy_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE8581/seqcorrs_spearman_healthy_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE8581 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE8581/processed/expr.tsv ${EXPR_DIR}/GSE8581/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE8581/seqcorrs_spearman_healthy_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE8581/seqcorrs_spearman_healthy_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE8581 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE8581/processed/expr.tsv ${EXPR_DIR}/GSE8581/processed/healthy_gsms.txt ${COEXPR_DIR}/GSE8581/seqcorrs_spearman_healthy_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Healthy_BAL_gsms_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Healthy_BAL_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Healthy_BAL_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Healthy_BAL_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Healthy_BAL_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Healthy_BAL_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Healthy_BAL_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Healthy_BAL_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Healthy_BAL_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Healthy_Epithelial_gsms_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Healthy_Epithelial_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Healthy_Epithelial_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Healthy_Epithelial_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Healthy_Epithelial_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Healthy_Epithelial_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Healthy_Epithelial_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Healthy_Epithelial_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Healthy_Epithelial_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Healthy_Spm_gsms_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Healthy_Spm_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Healthy_Spm_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Healthy_Spm_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Healthy_Spm_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Healthy_Spm_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Healthy_Spm_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Healthy_Spm_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Healthy_Spm_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Mild_BAL_gsms_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Mild_BAL_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Mild_BAL_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Mild_BAL_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Mild_BAL_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Mild_BAL_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Mild_BAL_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Mild_BAL_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Mild_BAL_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Mild_Epithelial_gsms_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Mild_Epithelial_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Mild_Epithelial_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Mild_Epithelial_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Mild_Epithelial_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Mild_Epithelial_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Mild_Epithelial_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Mild_Epithelial_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Mild_Epithelial_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Mild_Spm_gsms_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Mild_Spm_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Mild_Spm_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Mild_Spm_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Mild_Spm_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Mild_Spm_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Mild_Spm_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Mild_Spm_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Mild_Spm_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Moderate_BAL_gsms_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Moderate_BAL_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Moderate_BAL_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Moderate_BAL_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Moderate_BAL_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Moderate_BAL_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Moderate_BAL_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Moderate_BAL_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Moderate_BAL_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Moderate_Epithelial_gsms_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Moderate_Epithelial_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Moderate_Epithelial_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Moderate_Epithelial_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Moderate_Epithelial_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Moderate_Epithelial_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Moderate_Epithelial_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Moderate_Epithelial_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Moderate_Epithelial_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Moderate_Spm_gsms_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Moderate_Spm_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Moderate_Spm_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Moderate_Spm_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Moderate_Spm_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Moderate_Spm_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Moderate_Spm_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Moderate_Spm_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Moderate_Spm_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Severe_BAL_gsms_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Severe_BAL_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Severe_BAL_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Severe_BAL_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Severe_BAL_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Severe_BAL_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Severe_BAL_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Severe_BAL_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Severe_BAL_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Severe_Epithelial_gsms_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Severe_Epithelial_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Severe_Epithelial_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Severe_Epithelial_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Severe_Epithelial_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Severe_Epithelial_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Severe_Epithelial_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Severe_Epithelial_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Severe_Epithelial_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Severe_Spm_gsms_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${FCPATHS_1000_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Severe_Spm_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Severe_Spm_gsms_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Severe_Spm_gsms_rdm_a_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_A_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Severe_Spm_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Severe_Spm_gsms_rdm_a_1000.dat -n ${N_CORES} --spearman
${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Severe_Spm_gsms_rdm_b_1000.dat: ${EXPR_DIR}/GSE89809 ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}
	python 5_expression/eval_coexpression_parallel.py ${RDMPATHS_1000_B_FILE} ${EXPR_DIR}/GSE89809/processed/expr.tsv ${EXPR_DIR}/GSE89809/processed/Severe_Spm_gsms.txt ${COEXPR_DIR}/GSE89809/seqcorrs_spearman_Severe_Spm_gsms_rdm_b_1000.dat -n ${N_CORES} --spearman

#########################################################



${EXPR_DIR}/%:
	python 5_expression/${*}.py ${EXPR_DIR}/${*}

${FCPATHS_1000_NOTHRESH_FILE}:
	python 4_fc_paths/evaluate_fc_paths.py ${ASTHMASEED} ${COPDSEED} ${PPI2016} ${FCS_FILE} ${FCPATHS_1000_NOTHRESH_FILE} --fc_thresh ${FC_THRESH} --npath_thresh 10 --N_cores ${N_CORES}

${ALLPATHS_FILE} ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE}: ${FCS_FILE}
	python 4_fc_paths/evaluate_paths.py ${ASTHMASEED} ${COPDSEED} ${PPI2016} ${FCS_FILE} ${ALLPATHS_FILE} ${FCPATHS_1000_FILE} ${RDMPATHS_1000_A_FILE} ${RDMPATHS_1000_B_FILE} --fc_thresh ${FC_THRESH} --npath_thresh ${N_PATH_THRESH} --N_samples ${N_RDMPATHS} --seed ${SEED}

${ALLPATHS_FILE} ${FCPATHS_FILE} ${RDMPATHS_A_FILE} ${RDMPATHS_B_FILE}: ${FCS_FILE}
	python 4_fc_paths/evaluate_paths.py ${ASTHMASEED} ${COPDSEED} ${PPI2016} ${FCS_FILE} ${ALLPATHS_FILE} ${FCPATHS_FILE} ${RDMPATHS_A_FILE} ${RDMPATHS_B_FILE} --fc_thresh ${FC_THRESH} --N_samples ${N_RDMPATHS} --seed ${SEED}

${FCS_FILE}: ${FLOWS_FILE} ${RDMFLOWS_FILE}
	python ${FLOWER_DIR}/evaluate_fcs.py ${ASTHMA_MODULE_FILE} ${COPD_MODULE_FILE} ${SPM_FILE} ${FCS_FILE} --rdm_fc_path ${RDMFLOWS_FILE} -n ${N_CORES} --as_col

${RDMFLOWS_FILE}: ${ASTHMA_SAMPLES_FILE} ${COPD_SAMPLES_FILE} ${SPM_FILE}
	python ${FLOWER_DIR}/evaluate_flows_batch.py ${ASTHMA_SAMPLES_FILE} ${COPD_SAMPLES_FILE} ${SPM_FILE} ${RDMFLOWS_FILE} -n 1

${FLOWS_FILE}: ${ASTHMA_MODULE_FILE} ${COPD_MODULE_FILE} ${SPM_FILE}
	python ${FLOWER_DIR}/evaluate_flows.py ${ASTHMA_MODULE_FILE} ${COPD_MODULE_FILE} ${SPM_FILE} ${FLOWS_FILE} --as_col

${ASTHMA_SAMPLES_FILE}: ${ASTHMA_MODULE_FILE}
	python 3_random_samples/generate_diamond_samples.py ${ASTHMASEED} ${ASTHMA_MODULE_FILE} ${PPI2016} ${ASTHMA_SAMPLES_FILE} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --rdmseed ${SEED}
${COPD_SAMPLES_FILE}: ${COPD_MODULE_FILE}
	python 3_random_samples/generate_diamond_samples.py ${COPDSEED} ${COPD_MODULE_FILE} ${PPI2016} ${COPD_SAMPLES_FILE} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --rdmseed ${SEED}

${SPM_FILE}: ${PPI2016}
	python ${FLOWER_DIR}/evaluate_spm.py ${PPI2016} ${SPM_FILE} --max_path_length 30 --int_nodeid

${ASTHMA_MODULE_FILE}: ${ASTHMA_TOPN} 
	python 2_module_construction/cutoff_diamond_from_ext_source.py ${ASTHMASEED} ${ASTHMA_TOPN} ${ASTHMA_BIOBANK} ${PPI2016} ${ASTHMA_MODULE_FILE} ${MAINDIR}/gendata/diamond_modules/asthma/biobank_cutoff_pvals.dat --plot

${COPD_MODULE_FILE}: ${COPD_TOPN} 
	python 2_module_construction/cutoff_diamond_from_ext_source.py ${COPDSEED} ${COPD_TOPN} ${COPD_BIOBANK} ${PPI2016} ${COPD_MODULE_FILE} ${MAINDIR}/gendata/diamond_modules/copd/biobank_cutoff_pvals.dat --plot


${COPD_TOPN}: ${COPDSEED} ${PPI2016}
	python 2_module_construction/diamond_prioritize.py ${COPDSEED} ${PPI2016} ${COPD_TOPN} --N ${N_DIAMOND}

${ASTHMA_TOPN}: ${ASTHMASEED} ${PPI2016}
	python 2_module_construction/diamond_prioritize.py ${ASTHMASEED} ${PPI2016} ${ASTHMA_TOPN} --N ${N_DIAMOND}


${ASTHMASEED}: ${ASTHMABENJI_DIR}/interim/asthma_benji.symblist ${PPI2016}
	python 1_data_processing/process_genes.py ${ASTHMABENJI_DIR}/interim/asthma_benji.symblist \
											${ASTHMASEED} \
											--net_path ${PPI2016} \
											--from_symbols

${COPDSEED}: ${COPDSEED_DIR}/interim/copd_genes_03_08_2017.entrezlist ${PPI2016}
	python 1_data_processing/process_genes.py ${COPDSEED_DIR}/interim/copd_genes_03_08_2017.entrezlist \
											${COPDSEED} \
											--net_path ${PPI2016}





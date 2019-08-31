#!/bin/bash
#
#SBATCH --job-name=seqsims
#SBATCH --output=seqsims_output_related.txt
#SBATCH --partition=general
#SBATCH --mem-per-cpu=2000
#SBATCH --ntasks-per-node=8
#SBATCH -N 10
#

N_CORES=8
PATHS_DIR=../gendata/paths/disgenet_diseases/related
SEQSIM_DIR=../gendata/seqsim/disgenet_diseases/related
OBO_FILE=../data/go/go-basic.obo
GENE2GO_FILE=../data/go/gene2go

mkdir -p ${SEQSIM_DIR}/C0002395_C0002736
mkdir -p ${SEQSIM_DIR}/C0002395_C0020255
mkdir -p ${SEQSIM_DIR}/C0002395_C0023520
mkdir -p ${SEQSIM_DIR}/C0002395_C0032460
mkdir -p ${SEQSIM_DIR}/C0002395_C0037773
mkdir -p ${SEQSIM_DIR}/C0002395_C1136382
mkdir -p ${SEQSIM_DIR}/C0002736_C0030567
mkdir -p ${SEQSIM_DIR}/C0002736_C0276496
mkdir -p ${SEQSIM_DIR}/C0002736_C0750901
mkdir -p ${SEQSIM_DIR}/C0003873_C0087031
mkdir -p ${SEQSIM_DIR}/C0003873_C3495559
mkdir -p ${SEQSIM_DIR}/C0003873_C3714758
mkdir -p ${SEQSIM_DIR}/C0004153_C0162872
mkdir -p ${SEQSIM_DIR}/C0004153_C0751956
mkdir -p ${SEQSIM_DIR}/C0007194_C0018801
mkdir -p ${SEQSIM_DIR}/C0007194_C0018802
mkdir -p ${SEQSIM_DIR}/C0007194_C0023212
mkdir -p ${SEQSIM_DIR}/C0007194_C0235527
mkdir -p ${SEQSIM_DIR}/C0007194_C0242380
mkdir -p ${SEQSIM_DIR}/C0007194_C1959583
mkdir -p ${SEQSIM_DIR}/C0010054_C0162872
mkdir -p ${SEQSIM_DIR}/C0010054_C0751956
mkdir -p ${SEQSIM_DIR}/C0010278_C0013720
mkdir -p ${SEQSIM_DIR}/C0011616_C0030246
mkdir -p ${SEQSIM_DIR}/C0011616_C0033860
mkdir -p ${SEQSIM_DIR}/C0011616_C0162820
mkdir -p ${SEQSIM_DIR}/C0014544_C0038220
mkdir -p ${SEQSIM_DIR}/C0014544_C0270823
mkdir -p ${SEQSIM_DIR}/C0014544_C0311335
mkdir -p ${SEQSIM_DIR}/C0014544_C0393734
mkdir -p ${SEQSIM_DIR}/C0014544_C0751522
mkdir -p ${SEQSIM_DIR}/C0014544_C0751523
mkdir -p ${SEQSIM_DIR}/C0014544_C0751524
mkdir -p ${SEQSIM_DIR}/C0018801_C0242380
mkdir -p ${SEQSIM_DIR}/C0018802_C0242380
mkdir -p ${SEQSIM_DIR}/C0020255_C0023520
mkdir -p ${SEQSIM_DIR}/C0023212_C0242380
mkdir -p ${SEQSIM_DIR}/C0027051_C0162872
mkdir -p ${SEQSIM_DIR}/C0029408_C0087031
mkdir -p ${SEQSIM_DIR}/C0029408_C3495559
mkdir -p ${SEQSIM_DIR}/C0029408_C3714758
mkdir -p ${SEQSIM_DIR}/C0030246_C0162820
mkdir -p ${SEQSIM_DIR}/C0032460_C0037773
mkdir -p ${SEQSIM_DIR}/C0033860_C0162820
mkdir -p ${SEQSIM_DIR}/C0037773_C1136382
mkdir -p ${SEQSIM_DIR}/C0038220_C0086237
mkdir -p ${SEQSIM_DIR}/C0038220_C0751111
mkdir -p ${SEQSIM_DIR}/C0086237_C0270823
mkdir -p ${SEQSIM_DIR}/C0086237_C0311335
mkdir -p ${SEQSIM_DIR}/C0086237_C0393734
mkdir -p ${SEQSIM_DIR}/C0086237_C0751522
mkdir -p ${SEQSIM_DIR}/C0086237_C0751523
mkdir -p ${SEQSIM_DIR}/C0086237_C0751524
mkdir -p ${SEQSIM_DIR}/C0151744_C0162872
mkdir -p ${SEQSIM_DIR}/C0151744_C0751956
mkdir -p ${SEQSIM_DIR}/C0162872_C0751956
mkdir -p ${SEQSIM_DIR}/C0162872_C1956346
mkdir -p ${SEQSIM_DIR}/C0235527_C0242380
mkdir -p ${SEQSIM_DIR}/C0242380_C1959583
mkdir -p ${SEQSIM_DIR}/C0270823_C0751111
mkdir -p ${SEQSIM_DIR}/C0311335_C0751111
mkdir -p ${SEQSIM_DIR}/C0393734_C0751111
mkdir -p ${SEQSIM_DIR}/C0751111_C0751522
mkdir -p ${SEQSIM_DIR}/C0751111_C0751523
mkdir -p ${SEQSIM_DIR}/C0751111_C0751524
mkdir -p ${SEQSIM_DIR}/C0751956_C1956346
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0002395_C0002736/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0002395_C0002736/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0002395_C0002736/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0002395_C0002736/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0002395_C0002736/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0002395_C0002736/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0002395_C0020255/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0002395_C0020255/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0002395_C0020255/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0002395_C0020255/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0002395_C0020255/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0002395_C0020255/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0002395_C0023520/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0002395_C0023520/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0002395_C0023520/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0002395_C0023520/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0002395_C0023520/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0002395_C0023520/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0002395_C0032460/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0002395_C0032460/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0002395_C0032460/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0002395_C0032460/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0002395_C0032460/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0002395_C0032460/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0002395_C0037773/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0002395_C0037773/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0002395_C0037773/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0002395_C0037773/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0002395_C0037773/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0002395_C0037773/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0002395_C1136382/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0002395_C1136382/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0002395_C1136382/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0002395_C1136382/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0002395_C1136382/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0002395_C1136382/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0002736_C0030567/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0002736_C0030567/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0002736_C0030567/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0002736_C0030567/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0002736_C0030567/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0002736_C0030567/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0002736_C0276496/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0002736_C0276496/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0002736_C0276496/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0002736_C0276496/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0002736_C0276496/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0002736_C0276496/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0002736_C0750901/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0002736_C0750901/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0002736_C0750901/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0002736_C0750901/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0002736_C0750901/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0002736_C0750901/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0003873_C0087031/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0003873_C0087031/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0003873_C0087031/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0003873_C0087031/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0003873_C0087031/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0003873_C0087031/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0003873_C3495559/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0003873_C3495559/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0003873_C3495559/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0003873_C3495559/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0003873_C3495559/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0003873_C3495559/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0003873_C3714758/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0003873_C3714758/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0003873_C3714758/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0003873_C3714758/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0003873_C3714758/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0003873_C3714758/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0004153_C0162872/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0004153_C0162872/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0004153_C0162872/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0004153_C0162872/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0004153_C0162872/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0004153_C0162872/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0004153_C0751956/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0004153_C0751956/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0004153_C0751956/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0004153_C0751956/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0004153_C0751956/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0004153_C0751956/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0007194_C0018801/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0007194_C0018801/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0007194_C0018801/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0007194_C0018801/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0007194_C0018801/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0007194_C0018801/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0007194_C0018802/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0007194_C0018802/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0007194_C0018802/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0007194_C0018802/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0007194_C0018802/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0007194_C0018802/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0007194_C0023212/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0007194_C0023212/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0007194_C0023212/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0007194_C0023212/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0007194_C0023212/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0007194_C0023212/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0007194_C0235527/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0007194_C0235527/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0007194_C0235527/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0007194_C0235527/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0007194_C0235527/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0007194_C0235527/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0007194_C0242380/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0007194_C0242380/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0007194_C0242380/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0007194_C0242380/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0007194_C0242380/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0007194_C0242380/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0007194_C1959583/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0007194_C1959583/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0007194_C1959583/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0007194_C1959583/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0007194_C1959583/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0007194_C1959583/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0010054_C0162872/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0010054_C0162872/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0010054_C0162872/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0010054_C0162872/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0010054_C0162872/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0010054_C0162872/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0010054_C0751956/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0010054_C0751956/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0010054_C0751956/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0010054_C0751956/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0010054_C0751956/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0010054_C0751956/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0010278_C0013720/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0010278_C0013720/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0010278_C0013720/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0010278_C0013720/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0010278_C0013720/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0010278_C0013720/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011616_C0030246/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011616_C0030246/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011616_C0030246/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011616_C0030246/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011616_C0030246/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011616_C0030246/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011616_C0033860/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011616_C0033860/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011616_C0033860/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011616_C0033860/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011616_C0033860/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011616_C0033860/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011616_C0162820/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011616_C0162820/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011616_C0162820/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011616_C0162820/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011616_C0162820/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011616_C0162820/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0014544_C0038220/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0014544_C0038220/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0014544_C0038220/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0014544_C0038220/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0014544_C0038220/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0014544_C0038220/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0014544_C0270823/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0014544_C0270823/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0014544_C0270823/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0014544_C0270823/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0014544_C0270823/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0014544_C0270823/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0014544_C0311335/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0014544_C0311335/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0014544_C0311335/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0014544_C0311335/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0014544_C0311335/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0014544_C0311335/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0014544_C0393734/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0014544_C0393734/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0014544_C0393734/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0014544_C0393734/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0014544_C0393734/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0014544_C0393734/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0014544_C0751522/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0014544_C0751522/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0014544_C0751522/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0014544_C0751522/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0014544_C0751522/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0014544_C0751522/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0014544_C0751523/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0014544_C0751523/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0014544_C0751523/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0014544_C0751523/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0014544_C0751523/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0014544_C0751523/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0014544_C0751524/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0014544_C0751524/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0014544_C0751524/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0014544_C0751524/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0014544_C0751524/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0014544_C0751524/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0018801_C0242380/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0018801_C0242380/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0018801_C0242380/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0018801_C0242380/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0018801_C0242380/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0018801_C0242380/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0018802_C0242380/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0018802_C0242380/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0018802_C0242380/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0018802_C0242380/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0018802_C0242380/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0018802_C0242380/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0020255_C0023520/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0020255_C0023520/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0020255_C0023520/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0020255_C0023520/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0020255_C0023520/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0020255_C0023520/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0023212_C0242380/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0023212_C0242380/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0023212_C0242380/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0023212_C0242380/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0023212_C0242380/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0023212_C0242380/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0027051_C0162872/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0027051_C0162872/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0027051_C0162872/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0027051_C0162872/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0027051_C0162872/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0027051_C0162872/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0029408_C0087031/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0029408_C0087031/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0029408_C0087031/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0029408_C0087031/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0029408_C0087031/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0029408_C0087031/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0029408_C3495559/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0029408_C3495559/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0029408_C3495559/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0029408_C3495559/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0029408_C3495559/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0029408_C3495559/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0029408_C3714758/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0029408_C3714758/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0029408_C3714758/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0029408_C3714758/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0029408_C3714758/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0029408_C3714758/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0030246_C0162820/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0030246_C0162820/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0030246_C0162820/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0030246_C0162820/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0030246_C0162820/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0030246_C0162820/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0032460_C0037773/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0032460_C0037773/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0032460_C0037773/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0032460_C0037773/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0032460_C0037773/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0032460_C0037773/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0033860_C0162820/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0033860_C0162820/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0033860_C0162820/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0033860_C0162820/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0033860_C0162820/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0033860_C0162820/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0037773_C1136382/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0037773_C1136382/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0037773_C1136382/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0037773_C1136382/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0037773_C1136382/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0037773_C1136382/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0038220_C0086237/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0038220_C0086237/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0038220_C0086237/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0038220_C0086237/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0038220_C0086237/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0038220_C0086237/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0038220_C0751111/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0038220_C0751111/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0038220_C0751111/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0038220_C0751111/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0038220_C0751111/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0038220_C0751111/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0086237_C0270823/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0086237_C0270823/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0086237_C0270823/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0086237_C0270823/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0086237_C0270823/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0086237_C0270823/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0086237_C0311335/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0086237_C0311335/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0086237_C0311335/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0086237_C0311335/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0086237_C0311335/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0086237_C0311335/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0086237_C0393734/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0086237_C0393734/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0086237_C0393734/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0086237_C0393734/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0086237_C0393734/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0086237_C0393734/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0086237_C0751522/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0086237_C0751522/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0086237_C0751522/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0086237_C0751522/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0086237_C0751522/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0086237_C0751522/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0086237_C0751523/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0086237_C0751523/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0086237_C0751523/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0086237_C0751523/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0086237_C0751523/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0086237_C0751523/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0086237_C0751524/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0086237_C0751524/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0086237_C0751524/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0086237_C0751524/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0086237_C0751524/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0086237_C0751524/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0151744_C0162872/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0151744_C0162872/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0151744_C0162872/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0151744_C0162872/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0151744_C0162872/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0151744_C0162872/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0151744_C0751956/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0151744_C0751956/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0151744_C0751956/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0151744_C0751956/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0151744_C0751956/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0151744_C0751956/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0162872_C0751956/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0162872_C0751956/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0162872_C0751956/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0162872_C0751956/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0162872_C0751956/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0162872_C0751956/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0162872_C1956346/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0162872_C1956346/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0162872_C1956346/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0162872_C1956346/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0162872_C1956346/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0162872_C1956346/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0235527_C0242380/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0235527_C0242380/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0235527_C0242380/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0235527_C0242380/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0235527_C0242380/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0235527_C0242380/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0242380_C1959583/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0242380_C1959583/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0242380_C1959583/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0242380_C1959583/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0242380_C1959583/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0242380_C1959583/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0270823_C0751111/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0270823_C0751111/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0270823_C0751111/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0270823_C0751111/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0270823_C0751111/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0270823_C0751111/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0311335_C0751111/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0311335_C0751111/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0311335_C0751111/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0311335_C0751111/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0311335_C0751111/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0311335_C0751111/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0393734_C0751111/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0393734_C0751111/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0393734_C0751111/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0393734_C0751111/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0393734_C0751111/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0393734_C0751111/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0751111_C0751522/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0751111_C0751522/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0751111_C0751522/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0751111_C0751522/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0751111_C0751522/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0751111_C0751522/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0751111_C0751523/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0751111_C0751523/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0751111_C0751523/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0751111_C0751523/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0751111_C0751523/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0751111_C0751523/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0751111_C0751524/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0751111_C0751524/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0751111_C0751524/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0751111_C0751524/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0751111_C0751524/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0751111_C0751524/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0751956_C1956346/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0751956_C1956346/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0751956_C1956346/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0751956_C1956346/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0751956_C1956346/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0751956_C1956346/seqsims_rdm_b.dat -n ${N_CORES} &
wait
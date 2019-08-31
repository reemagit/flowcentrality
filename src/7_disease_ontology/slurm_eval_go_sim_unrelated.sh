#!/bin/bash
#
#SBATCH --job-name=seqsims_unrel
#SBATCH --output=seqsims_output_unrelated.txt
#SBATCH --partition=general
#SBATCH --mem-per-cpu=2000
#SBATCH --ntasks-per-node=8
#SBATCH -N 10
#

N_CORES=8
PATHS_DIR=../gendata/paths/disgenet_diseases/unrelated
SEQSIM_DIR=../gendata/seqsim/disgenet_diseases/unrelated
OBO_FILE=../data/go/go-basic.obo
GENE2GO_FILE=../data/go/gene2go

mkdir -p ${SEQSIM_DIR}/C0001787_C0028754
mkdir -p ${SEQSIM_DIR}/C0004096_C0028754
mkdir -p ${SEQSIM_DIR}/C0007786_C0015695
mkdir -p ${SEQSIM_DIR}/C0008370_C1136382
mkdir -p ${SEQSIM_DIR}/C0009324_C1136382
mkdir -p ${SEQSIM_DIR}/C0009324_C2711227
mkdir -p ${SEQSIM_DIR}/C0010278_C0011860
mkdir -p ${SEQSIM_DIR}/C0010278_C0028754
mkdir -p ${SEQSIM_DIR}/C0010278_C0032460
mkdir -p ${SEQSIM_DIR}/C0011616_C0032460
mkdir -p ${SEQSIM_DIR}/C0011616_C1136382
mkdir -p ${SEQSIM_DIR}/C0011860_C0020255
mkdir -p ${SEQSIM_DIR}/C0011860_C0023520
mkdir -p ${SEQSIM_DIR}/C0011860_C0023890
mkdir -p ${SEQSIM_DIR}/C0011860_C0029459
mkdir -p ${SEQSIM_DIR}/C0011860_C0037773
mkdir -p ${SEQSIM_DIR}/C0011860_C0086237
mkdir -p ${SEQSIM_DIR}/C0011860_C0270824
mkdir -p ${SEQSIM_DIR}/C0011860_C3495559
mkdir -p ${SEQSIM_DIR}/C0013720_C0015695
mkdir -p ${SEQSIM_DIR}/C0014544_C4505456
mkdir -p ${SEQSIM_DIR}/C0015695_C0032300
mkdir -p ${SEQSIM_DIR}/C0015695_C0038220
mkdir -p ${SEQSIM_DIR}/C0015695_C0086237
mkdir -p ${SEQSIM_DIR}/C0015695_C0270823
mkdir -p ${SEQSIM_DIR}/C0015695_C0276496
mkdir -p ${SEQSIM_DIR}/C0015695_C0751123
mkdir -p ${SEQSIM_DIR}/C0015695_C0751406
mkdir -p ${SEQSIM_DIR}/C0015695_C0751956
mkdir -p ${SEQSIM_DIR}/C0015695_C1565662
mkdir -p ${SEQSIM_DIR}/C0018802_C0032460
mkdir -p ${SEQSIM_DIR}/C0022333_C4505456
mkdir -p ${SEQSIM_DIR}/C0023212_C0032460
mkdir -p ${SEQSIM_DIR}/C0023212_C4505456
mkdir -p ${SEQSIM_DIR}/C0023520_C0028754
mkdir -p ${SEQSIM_DIR}/C0028754_C0032285
mkdir -p ${SEQSIM_DIR}/C0028754_C0239946
mkdir -p ${SEQSIM_DIR}/C0028754_C1956346
mkdir -p ${SEQSIM_DIR}/C0029408_C0032460
mkdir -p ${SEQSIM_DIR}/C0030567_C4505456
mkdir -p ${SEQSIM_DIR}/C0032460_C0038220
mkdir -p ${SEQSIM_DIR}/C0032460_C0162820
mkdir -p ${SEQSIM_DIR}/C0032460_C0239946
mkdir -p ${SEQSIM_DIR}/C0032460_C0242380
mkdir -p ${SEQSIM_DIR}/C0032460_C0311335
mkdir -p ${SEQSIM_DIR}/C0032460_C4505436
mkdir -p ${SEQSIM_DIR}/C0038220_C1136382
mkdir -p ${SEQSIM_DIR}/C0085786_C1136382
mkdir -p ${SEQSIM_DIR}/C0162820_C2711227
mkdir -p ${SEQSIM_DIR}/C0162820_C4505456
mkdir -p ${SEQSIM_DIR}/C0162872_C2711227
mkdir -p ${SEQSIM_DIR}/C0235527_C4505456
mkdir -p ${SEQSIM_DIR}/C0242380_C1136382
mkdir -p ${SEQSIM_DIR}/C0270846_C1136382
mkdir -p ${SEQSIM_DIR}/C0393734_C1136382
mkdir -p ${SEQSIM_DIR}/C0393734_C4505456
mkdir -p ${SEQSIM_DIR}/C0422855_C4505456
mkdir -p ${SEQSIM_DIR}/C0494475_C4505456
mkdir -p ${SEQSIM_DIR}/C0751523_C1136382
mkdir -p ${SEQSIM_DIR}/C0751524_C2711227
mkdir -p ${SEQSIM_DIR}/C1136382_C4317109
mkdir -p ${SEQSIM_DIR}/C1959583_C4505456
mkdir -p ${SEQSIM_DIR}/C2711227_C3714636
mkdir -p ${SEQSIM_DIR}/C2711227_C4317109
mkdir -p ${SEQSIM_DIR}/C2711227_C4505456
mkdir -p ${SEQSIM_DIR}/C3495874_C4505456
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0001787_C0028754/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0001787_C0028754/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0001787_C0028754/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0001787_C0028754/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0001787_C0028754/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0001787_C0028754/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0004096_C0028754/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0004096_C0028754/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0004096_C0028754/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0004096_C0028754/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0004096_C0028754/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0004096_C0028754/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0007786_C0015695/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0007786_C0015695/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0007786_C0015695/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0007786_C0015695/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0007786_C0015695/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0007786_C0015695/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0008370_C1136382/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0008370_C1136382/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0008370_C1136382/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0008370_C1136382/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0008370_C1136382/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0008370_C1136382/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0009324_C1136382/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0009324_C1136382/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0009324_C1136382/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0009324_C1136382/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0009324_C1136382/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0009324_C1136382/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0009324_C2711227/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0009324_C2711227/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0009324_C2711227/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0009324_C2711227/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0009324_C2711227/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0009324_C2711227/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0010278_C0011860/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0010278_C0011860/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0010278_C0011860/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0010278_C0011860/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0010278_C0011860/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0010278_C0011860/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0010278_C0028754/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0010278_C0028754/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0010278_C0028754/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0010278_C0028754/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0010278_C0028754/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0010278_C0028754/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0010278_C0032460/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0010278_C0032460/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0010278_C0032460/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0010278_C0032460/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0010278_C0032460/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0010278_C0032460/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011616_C0032460/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011616_C0032460/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011616_C0032460/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011616_C0032460/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011616_C0032460/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011616_C0032460/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011616_C1136382/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011616_C1136382/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011616_C1136382/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011616_C1136382/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011616_C1136382/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011616_C1136382/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011860_C0020255/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011860_C0020255/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011860_C0020255/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011860_C0020255/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011860_C0020255/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011860_C0020255/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011860_C0023520/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011860_C0023520/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011860_C0023520/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011860_C0023520/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011860_C0023520/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011860_C0023520/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011860_C0023890/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011860_C0023890/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011860_C0023890/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011860_C0023890/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011860_C0023890/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011860_C0023890/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011860_C0029459/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011860_C0029459/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011860_C0029459/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011860_C0029459/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011860_C0029459/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011860_C0029459/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011860_C0037773/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011860_C0037773/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011860_C0037773/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011860_C0037773/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011860_C0037773/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011860_C0037773/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011860_C0086237/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011860_C0086237/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011860_C0086237/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011860_C0086237/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011860_C0086237/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011860_C0086237/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011860_C0270824/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011860_C0270824/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011860_C0270824/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011860_C0270824/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011860_C0270824/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011860_C0270824/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011860_C3495559/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011860_C3495559/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011860_C3495559/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011860_C3495559/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0011860_C3495559/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0011860_C3495559/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0013720_C0015695/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0013720_C0015695/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0013720_C0015695/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0013720_C0015695/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0013720_C0015695/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0013720_C0015695/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0014544_C4505456/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0014544_C4505456/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0014544_C4505456/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0014544_C4505456/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0014544_C4505456/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0014544_C4505456/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0015695_C0032300/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0015695_C0032300/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0015695_C0032300/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0015695_C0032300/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0015695_C0032300/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0015695_C0032300/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0015695_C0038220/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0015695_C0038220/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0015695_C0038220/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0015695_C0038220/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0015695_C0038220/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0015695_C0038220/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0015695_C0086237/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0015695_C0086237/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0015695_C0086237/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0015695_C0086237/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0015695_C0086237/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0015695_C0086237/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0015695_C0270823/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0015695_C0270823/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0015695_C0270823/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0015695_C0270823/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0015695_C0270823/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0015695_C0270823/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0015695_C0276496/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0015695_C0276496/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0015695_C0276496/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0015695_C0276496/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0015695_C0276496/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0015695_C0276496/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0015695_C0751123/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0015695_C0751123/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0015695_C0751123/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0015695_C0751123/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0015695_C0751123/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0015695_C0751123/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0015695_C0751406/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0015695_C0751406/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0015695_C0751406/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0015695_C0751406/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0015695_C0751406/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0015695_C0751406/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0015695_C0751956/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0015695_C0751956/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0015695_C0751956/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0015695_C0751956/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0015695_C0751956/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0015695_C0751956/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0015695_C1565662/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0015695_C1565662/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0015695_C1565662/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0015695_C1565662/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0015695_C1565662/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0015695_C1565662/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0018802_C0032460/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0018802_C0032460/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0018802_C0032460/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0018802_C0032460/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0018802_C0032460/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0018802_C0032460/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0022333_C4505456/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0022333_C4505456/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0022333_C4505456/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0022333_C4505456/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0022333_C4505456/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0022333_C4505456/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0023212_C0032460/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0023212_C0032460/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0023212_C0032460/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0023212_C0032460/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0023212_C0032460/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0023212_C0032460/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0023212_C4505456/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0023212_C4505456/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0023212_C4505456/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0023212_C4505456/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0023212_C4505456/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0023212_C4505456/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0023520_C0028754/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0023520_C0028754/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0023520_C0028754/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0023520_C0028754/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0023520_C0028754/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0023520_C0028754/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0028754_C0032285/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0028754_C0032285/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0028754_C0032285/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0028754_C0032285/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0028754_C0032285/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0028754_C0032285/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0028754_C0239946/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0028754_C0239946/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0028754_C0239946/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0028754_C0239946/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0028754_C0239946/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0028754_C0239946/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0028754_C1956346/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0028754_C1956346/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0028754_C1956346/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0028754_C1956346/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0028754_C1956346/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0028754_C1956346/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0029408_C0032460/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0029408_C0032460/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0029408_C0032460/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0029408_C0032460/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0029408_C0032460/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0029408_C0032460/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0030567_C4505456/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0030567_C4505456/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0030567_C4505456/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0030567_C4505456/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0030567_C4505456/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0030567_C4505456/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0032460_C0038220/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0032460_C0038220/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0032460_C0038220/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0032460_C0038220/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0032460_C0038220/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0032460_C0038220/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0032460_C0162820/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0032460_C0162820/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0032460_C0162820/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0032460_C0162820/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0032460_C0162820/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0032460_C0162820/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0032460_C0239946/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0032460_C0239946/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0032460_C0239946/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0032460_C0239946/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0032460_C0239946/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0032460_C0239946/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0032460_C0242380/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0032460_C0242380/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0032460_C0242380/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0032460_C0242380/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0032460_C0242380/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0032460_C0242380/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0032460_C0311335/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0032460_C0311335/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0032460_C0311335/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0032460_C0311335/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0032460_C0311335/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0032460_C0311335/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0032460_C4505436/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0032460_C4505436/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0032460_C4505436/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0032460_C4505436/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0032460_C4505436/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0032460_C4505436/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0038220_C1136382/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0038220_C1136382/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0038220_C1136382/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0038220_C1136382/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0038220_C1136382/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0038220_C1136382/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0085786_C1136382/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0085786_C1136382/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0085786_C1136382/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0085786_C1136382/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0085786_C1136382/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0085786_C1136382/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0162820_C2711227/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0162820_C2711227/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0162820_C2711227/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0162820_C2711227/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0162820_C2711227/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0162820_C2711227/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0162820_C4505456/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0162820_C4505456/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0162820_C4505456/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0162820_C4505456/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0162820_C4505456/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0162820_C4505456/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0162872_C2711227/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0162872_C2711227/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0162872_C2711227/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0162872_C2711227/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0162872_C2711227/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0162872_C2711227/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0235527_C4505456/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0235527_C4505456/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0235527_C4505456/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0235527_C4505456/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0235527_C4505456/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0235527_C4505456/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0242380_C1136382/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0242380_C1136382/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0242380_C1136382/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0242380_C1136382/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0242380_C1136382/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0242380_C1136382/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0270846_C1136382/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0270846_C1136382/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0270846_C1136382/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0270846_C1136382/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0270846_C1136382/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0270846_C1136382/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0393734_C1136382/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0393734_C1136382/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0393734_C1136382/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0393734_C1136382/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0393734_C1136382/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0393734_C1136382/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0393734_C4505456/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0393734_C4505456/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0393734_C4505456/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0393734_C4505456/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0393734_C4505456/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0393734_C4505456/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0422855_C4505456/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0422855_C4505456/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0422855_C4505456/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0422855_C4505456/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0422855_C4505456/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0422855_C4505456/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0494475_C4505456/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0494475_C4505456/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0494475_C4505456/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0494475_C4505456/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0494475_C4505456/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0494475_C4505456/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0751523_C1136382/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0751523_C1136382/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0751523_C1136382/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0751523_C1136382/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0751523_C1136382/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0751523_C1136382/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0751524_C2711227/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0751524_C2711227/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0751524_C2711227/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0751524_C2711227/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C0751524_C2711227/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C0751524_C2711227/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C1136382_C4317109/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C1136382_C4317109/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C1136382_C4317109/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C1136382_C4317109/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C1136382_C4317109/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C1136382_C4317109/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C1959583_C4505456/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C1959583_C4505456/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C1959583_C4505456/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C1959583_C4505456/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C1959583_C4505456/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C1959583_C4505456/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C2711227_C3714636/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C2711227_C3714636/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C2711227_C3714636/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C2711227_C3714636/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C2711227_C3714636/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C2711227_C3714636/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C2711227_C4317109/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C2711227_C4317109/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C2711227_C4317109/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C2711227_C4317109/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C2711227_C4317109/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C2711227_C4317109/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C2711227_C4505456/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C2711227_C4505456/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C2711227_C4505456/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C2711227_C4505456/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C2711227_C4505456/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C2711227_C4505456/seqsims_rdm_b.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C3495874_C4505456/fc_paths.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C3495874_C4505456/seqsims_fc.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C3495874_C4505456/rdm_paths_A.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C3495874_C4505456/seqsims_rdm_a.dat -n ${N_CORES} &
srun -N 1 -n 1 -c ${N_CORES} python -m 6_gene_ontology.eval_seqsim_parallel ${PATHS_DIR}/C3495874_C4505456/rdm_paths_B.pathlist ${OBO_FILE} ${GENE2GO_FILE} ${SEQSIM_DIR}/C3495874_C4505456/seqsims_rdm_b.dat -n ${N_CORES} &
wait
#!/bin/bash
#
#SBATCH --job-name=eval_rdm
#SBATCH --output=rdm_seqsim_output.txt
#SBATCH --partition=general
#SBATCH --mem-per-cpu=8000
#SBATCH --ntasks-per-node=16
#SBATCH -N 10
#

GENES_DIR=../gendata/disease_ontology/disease_genes
FC_DIR=../gendata/fc/disgenet_diseases/related
GO_FILE=../data/go/go-basic.obo
GENE2GO_FILE=../data/go/gene2go
OUTPUT_DIR=../gendata/seqsim/random_genesets
PPI2016=../data/networks/PPI_2016_feixiong/processed/PPI_2016_conn_noself.tsv
FC_THRESH=2
NPATH_THRESH=5
N_SAMPLES=100
N_CORES=16
SEED=100

if [ ! -f "${OUTPUT_DIR}/C0002395_C0002736.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0002395.entrezlist ${GENES_DIR}/C0002736.entrezlist ${PPI2016} ${FC_DIR}/fc_C0002395_C0002736.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0002395_C0002736.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0002395_C0020255.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0002395.entrezlist ${GENES_DIR}/C0020255.entrezlist ${PPI2016} ${FC_DIR}/fc_C0002395_C0020255.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0002395_C0020255.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0002395_C0023520.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0002395.entrezlist ${GENES_DIR}/C0023520.entrezlist ${PPI2016} ${FC_DIR}/fc_C0002395_C0023520.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0002395_C0023520.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0002395_C0032460.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0002395.entrezlist ${GENES_DIR}/C0032460.entrezlist ${PPI2016} ${FC_DIR}/fc_C0002395_C0032460.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0002395_C0032460.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0002395_C0037773.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0002395.entrezlist ${GENES_DIR}/C0037773.entrezlist ${PPI2016} ${FC_DIR}/fc_C0002395_C0037773.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0002395_C0037773.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0002395_C1136382.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0002395.entrezlist ${GENES_DIR}/C1136382.entrezlist ${PPI2016} ${FC_DIR}/fc_C0002395_C1136382.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0002395_C1136382.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0002736_C0030567.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0002736.entrezlist ${GENES_DIR}/C0030567.entrezlist ${PPI2016} ${FC_DIR}/fc_C0002736_C0030567.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0002736_C0030567.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0002736_C0276496.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0002736.entrezlist ${GENES_DIR}/C0276496.entrezlist ${PPI2016} ${FC_DIR}/fc_C0002736_C0276496.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0002736_C0276496.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0002736_C0750901.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0002736.entrezlist ${GENES_DIR}/C0750901.entrezlist ${PPI2016} ${FC_DIR}/fc_C0002736_C0750901.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0002736_C0750901.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0003873_C0087031.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0003873.entrezlist ${GENES_DIR}/C0087031.entrezlist ${PPI2016} ${FC_DIR}/fc_C0003873_C0087031.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0003873_C0087031.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0003873_C3495559.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0003873.entrezlist ${GENES_DIR}/C3495559.entrezlist ${PPI2016} ${FC_DIR}/fc_C0003873_C3495559.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0003873_C3495559.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0003873_C3714758.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0003873.entrezlist ${GENES_DIR}/C3714758.entrezlist ${PPI2016} ${FC_DIR}/fc_C0003873_C3714758.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0003873_C3714758.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0004153_C0162872.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0004153.entrezlist ${GENES_DIR}/C0162872.entrezlist ${PPI2016} ${FC_DIR}/fc_C0004153_C0162872.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0004153_C0162872.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0004153_C0751956.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0004153.entrezlist ${GENES_DIR}/C0751956.entrezlist ${PPI2016} ${FC_DIR}/fc_C0004153_C0751956.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0004153_C0751956.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0007194_C0018801.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0007194.entrezlist ${GENES_DIR}/C0018801.entrezlist ${PPI2016} ${FC_DIR}/fc_C0007194_C0018801.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0007194_C0018801.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0007194_C0018802.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0007194.entrezlist ${GENES_DIR}/C0018802.entrezlist ${PPI2016} ${FC_DIR}/fc_C0007194_C0018802.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0007194_C0018802.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0007194_C0023212.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0007194.entrezlist ${GENES_DIR}/C0023212.entrezlist ${PPI2016} ${FC_DIR}/fc_C0007194_C0023212.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0007194_C0023212.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0007194_C0235527.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0007194.entrezlist ${GENES_DIR}/C0235527.entrezlist ${PPI2016} ${FC_DIR}/fc_C0007194_C0235527.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0007194_C0235527.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0007194_C0242380.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0007194.entrezlist ${GENES_DIR}/C0242380.entrezlist ${PPI2016} ${FC_DIR}/fc_C0007194_C0242380.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0007194_C0242380.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0007194_C1959583.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0007194.entrezlist ${GENES_DIR}/C1959583.entrezlist ${PPI2016} ${FC_DIR}/fc_C0007194_C1959583.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0007194_C1959583.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0010054_C0162872.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0010054.entrezlist ${GENES_DIR}/C0162872.entrezlist ${PPI2016} ${FC_DIR}/fc_C0010054_C0162872.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0010054_C0162872.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0010054_C0751956.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0010054.entrezlist ${GENES_DIR}/C0751956.entrezlist ${PPI2016} ${FC_DIR}/fc_C0010054_C0751956.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0010054_C0751956.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0010278_C0013720.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0010278.entrezlist ${GENES_DIR}/C0013720.entrezlist ${PPI2016} ${FC_DIR}/fc_C0010278_C0013720.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0010278_C0013720.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0011616_C0030246.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0011616.entrezlist ${GENES_DIR}/C0030246.entrezlist ${PPI2016} ${FC_DIR}/fc_C0011616_C0030246.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0011616_C0030246.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0011616_C0033860.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0011616.entrezlist ${GENES_DIR}/C0033860.entrezlist ${PPI2016} ${FC_DIR}/fc_C0011616_C0033860.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0011616_C0033860.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0011616_C0162820.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0011616.entrezlist ${GENES_DIR}/C0162820.entrezlist ${PPI2016} ${FC_DIR}/fc_C0011616_C0162820.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0011616_C0162820.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0014544_C0038220.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0014544.entrezlist ${GENES_DIR}/C0038220.entrezlist ${PPI2016} ${FC_DIR}/fc_C0014544_C0038220.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0014544_C0038220.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0014544_C0270823.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0014544.entrezlist ${GENES_DIR}/C0270823.entrezlist ${PPI2016} ${FC_DIR}/fc_C0014544_C0270823.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0014544_C0270823.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0014544_C0311335.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0014544.entrezlist ${GENES_DIR}/C0311335.entrezlist ${PPI2016} ${FC_DIR}/fc_C0014544_C0311335.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0014544_C0311335.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0014544_C0393734.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0014544.entrezlist ${GENES_DIR}/C0393734.entrezlist ${PPI2016} ${FC_DIR}/fc_C0014544_C0393734.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0014544_C0393734.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0014544_C0751522.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0014544.entrezlist ${GENES_DIR}/C0751522.entrezlist ${PPI2016} ${FC_DIR}/fc_C0014544_C0751522.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0014544_C0751522.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0014544_C0751523.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0014544.entrezlist ${GENES_DIR}/C0751523.entrezlist ${PPI2016} ${FC_DIR}/fc_C0014544_C0751523.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0014544_C0751523.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0014544_C0751524.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0014544.entrezlist ${GENES_DIR}/C0751524.entrezlist ${PPI2016} ${FC_DIR}/fc_C0014544_C0751524.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0014544_C0751524.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0018801_C0242380.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0018801.entrezlist ${GENES_DIR}/C0242380.entrezlist ${PPI2016} ${FC_DIR}/fc_C0018801_C0242380.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0018801_C0242380.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0018802_C0242380.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0018802.entrezlist ${GENES_DIR}/C0242380.entrezlist ${PPI2016} ${FC_DIR}/fc_C0018802_C0242380.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0018802_C0242380.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0020255_C0023520.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0020255.entrezlist ${GENES_DIR}/C0023520.entrezlist ${PPI2016} ${FC_DIR}/fc_C0020255_C0023520.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0020255_C0023520.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0023212_C0242380.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0023212.entrezlist ${GENES_DIR}/C0242380.entrezlist ${PPI2016} ${FC_DIR}/fc_C0023212_C0242380.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0023212_C0242380.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0027051_C0162872.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0027051.entrezlist ${GENES_DIR}/C0162872.entrezlist ${PPI2016} ${FC_DIR}/fc_C0027051_C0162872.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0027051_C0162872.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0029408_C0087031.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0029408.entrezlist ${GENES_DIR}/C0087031.entrezlist ${PPI2016} ${FC_DIR}/fc_C0029408_C0087031.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0029408_C0087031.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0029408_C3495559.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0029408.entrezlist ${GENES_DIR}/C3495559.entrezlist ${PPI2016} ${FC_DIR}/fc_C0029408_C3495559.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0029408_C3495559.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0029408_C3714758.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0029408.entrezlist ${GENES_DIR}/C3714758.entrezlist ${PPI2016} ${FC_DIR}/fc_C0029408_C3714758.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0029408_C3714758.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0030246_C0162820.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0030246.entrezlist ${GENES_DIR}/C0162820.entrezlist ${PPI2016} ${FC_DIR}/fc_C0030246_C0162820.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0030246_C0162820.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0032460_C0037773.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0032460.entrezlist ${GENES_DIR}/C0037773.entrezlist ${PPI2016} ${FC_DIR}/fc_C0032460_C0037773.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0032460_C0037773.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0033860_C0162820.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0033860.entrezlist ${GENES_DIR}/C0162820.entrezlist ${PPI2016} ${FC_DIR}/fc_C0033860_C0162820.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0033860_C0162820.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0037773_C1136382.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0037773.entrezlist ${GENES_DIR}/C1136382.entrezlist ${PPI2016} ${FC_DIR}/fc_C0037773_C1136382.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0037773_C1136382.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0038220_C0086237.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0038220.entrezlist ${GENES_DIR}/C0086237.entrezlist ${PPI2016} ${FC_DIR}/fc_C0038220_C0086237.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0038220_C0086237.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0038220_C0751111.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0038220.entrezlist ${GENES_DIR}/C0751111.entrezlist ${PPI2016} ${FC_DIR}/fc_C0038220_C0751111.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0038220_C0751111.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0086237_C0270823.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0086237.entrezlist ${GENES_DIR}/C0270823.entrezlist ${PPI2016} ${FC_DIR}/fc_C0086237_C0270823.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0086237_C0270823.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0086237_C0311335.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0086237.entrezlist ${GENES_DIR}/C0311335.entrezlist ${PPI2016} ${FC_DIR}/fc_C0086237_C0311335.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0086237_C0311335.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0086237_C0393734.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0086237.entrezlist ${GENES_DIR}/C0393734.entrezlist ${PPI2016} ${FC_DIR}/fc_C0086237_C0393734.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0086237_C0393734.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0086237_C0751522.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0086237.entrezlist ${GENES_DIR}/C0751522.entrezlist ${PPI2016} ${FC_DIR}/fc_C0086237_C0751522.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0086237_C0751522.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0086237_C0751523.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0086237.entrezlist ${GENES_DIR}/C0751523.entrezlist ${PPI2016} ${FC_DIR}/fc_C0086237_C0751523.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0086237_C0751523.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0086237_C0751524.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0086237.entrezlist ${GENES_DIR}/C0751524.entrezlist ${PPI2016} ${FC_DIR}/fc_C0086237_C0751524.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0086237_C0751524.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0151744_C0162872.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0151744.entrezlist ${GENES_DIR}/C0162872.entrezlist ${PPI2016} ${FC_DIR}/fc_C0151744_C0162872.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0151744_C0162872.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0151744_C0751956.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0151744.entrezlist ${GENES_DIR}/C0751956.entrezlist ${PPI2016} ${FC_DIR}/fc_C0151744_C0751956.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0151744_C0751956.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0162872_C0751956.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0162872.entrezlist ${GENES_DIR}/C0751956.entrezlist ${PPI2016} ${FC_DIR}/fc_C0162872_C0751956.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0162872_C0751956.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0162872_C1956346.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0162872.entrezlist ${GENES_DIR}/C1956346.entrezlist ${PPI2016} ${FC_DIR}/fc_C0162872_C1956346.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0162872_C1956346.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0235527_C0242380.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0235527.entrezlist ${GENES_DIR}/C0242380.entrezlist ${PPI2016} ${FC_DIR}/fc_C0235527_C0242380.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0235527_C0242380.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0242380_C1959583.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0242380.entrezlist ${GENES_DIR}/C1959583.entrezlist ${PPI2016} ${FC_DIR}/fc_C0242380_C1959583.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0242380_C1959583.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0270823_C0751111.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0270823.entrezlist ${GENES_DIR}/C0751111.entrezlist ${PPI2016} ${FC_DIR}/fc_C0270823_C0751111.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0270823_C0751111.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0311335_C0751111.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0311335.entrezlist ${GENES_DIR}/C0751111.entrezlist ${PPI2016} ${FC_DIR}/fc_C0311335_C0751111.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0311335_C0751111.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0393734_C0751111.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0393734.entrezlist ${GENES_DIR}/C0751111.entrezlist ${PPI2016} ${FC_DIR}/fc_C0393734_C0751111.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0393734_C0751111.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0751111_C0751522.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0751111.entrezlist ${GENES_DIR}/C0751522.entrezlist ${PPI2016} ${FC_DIR}/fc_C0751111_C0751522.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0751111_C0751522.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0751111_C0751523.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0751111.entrezlist ${GENES_DIR}/C0751523.entrezlist ${PPI2016} ${FC_DIR}/fc_C0751111_C0751523.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0751111_C0751523.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0751111_C0751524.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0751111.entrezlist ${GENES_DIR}/C0751524.entrezlist ${PPI2016} ${FC_DIR}/fc_C0751111_C0751524.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0751111_C0751524.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUTPUT_DIR}/C0751956_C1956346.nonrect" ]; then
srun -N 1 -n 1 -c 16 python -m 7_disease_ontology.evaluate_seqsim_random_genesets ${GENES_DIR}/C0751956.entrezlist ${GENES_DIR}/C1956346.entrezlist ${PPI2016} ${FC_DIR}/fc_C0751956_C1956346.tsv ${GO_FILE} ${GENE2GO_FILE} ${OUTPUT_DIR}/C0751956_C1956346.nonrect --fc_thresh ${FC_THRESH} --npath_thresh ${NPATH_THRESH} --N_samples ${N_SAMPLES} --N_cores ${N_CORES} --seed ${SEED} &
else
echo "Skipping..."
fi
wait
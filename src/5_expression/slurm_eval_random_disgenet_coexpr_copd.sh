#!/bin/bash
#
#SBATCH --job-name=eval_rdm_coexpr_copd
#SBATCH --output=rdm_coexpr_output_copd.txt
#SBATCH --partition=general
#SBATCH --mem-per-cpu=2000
#SBATCH --ntasks-per-node=16
#SBATCH -N 10
#

COPDSEED=../data/disease_genes/copd_genes_03_08_2017/processed/copd_genes_03_08_2017_in_ppi.entrezlist
GDA_FILE=../data/disease_genes/disgenet/processed/curated_gene_disease_associations_size_min_24_max_36.tsv
PPI2016=../data/networks/PPI_2016_feixiong/processed/PPI_2016_conn_noself.tsv
SEED=100
EXPR_DIR=../data/expression
OUT_DIR=../gendata/coexpression/rdm_disgenet/copd

mkdir -p ${OUT_DIR}
if [ ! -f "${OUT_DIR}/GSE57148_C0002871_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0002871 ${OUT_DIR}/GSE57148_C0002871_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0002871_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0002871 ${OUT_DIR}/GSE57148_C0002871_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0004238_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0004238 ${OUT_DIR}/GSE57148_C0004238_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0004238_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0004238 ${OUT_DIR}/GSE57148_C0004238_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0005398_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0005398 ${OUT_DIR}/GSE57148_C0005398_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0005398_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0005398 ${OUT_DIR}/GSE57148_C0005398_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0010093_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0010093 ${OUT_DIR}/GSE57148_C0010093_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0010093_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0010093 ${OUT_DIR}/GSE57148_C0010093_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0011615_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0011615 ${OUT_DIR}/GSE57148_C0011615_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0011615_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0011615 ${OUT_DIR}/GSE57148_C0011615_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0014518_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0014518 ${OUT_DIR}/GSE57148_C0014518_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0014518_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0014518 ${OUT_DIR}/GSE57148_C0014518_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0017658_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0017658 ${OUT_DIR}/GSE57148_C0017658_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0017658_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0017658 ${OUT_DIR}/GSE57148_C0017658_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0017661_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0017661 ${OUT_DIR}/GSE57148_C0017661_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0017661_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0017661 ${OUT_DIR}/GSE57148_C0017661_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0017668_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0017668 ${OUT_DIR}/GSE57148_C0017668_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0017668_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0017668 ${OUT_DIR}/GSE57148_C0017668_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0020459_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0020459 ${OUT_DIR}/GSE57148_C0020459_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0020459_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0020459 ${OUT_DIR}/GSE57148_C0020459_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0023892_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0023892 ${OUT_DIR}/GSE57148_C0023892_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0023892_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0023892 ${OUT_DIR}/GSE57148_C0023892_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0024117_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0024117 ${OUT_DIR}/GSE57148_C0024117_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0024117_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0024117 ${OUT_DIR}/GSE57148_C0024117_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0024796_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0024796 ${OUT_DIR}/GSE57148_C0024796_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0024796_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0024796 ${OUT_DIR}/GSE57148_C0024796_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0029927_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0029927 ${OUT_DIR}/GSE57148_C0029927_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0029927_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0029927 ${OUT_DIR}/GSE57148_C0029927_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0030305_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0030305 ${OUT_DIR}/GSE57148_C0030305_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0030305_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0030305 ${OUT_DIR}/GSE57148_C0030305_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0038325_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0038325 ${OUT_DIR}/GSE57148_C0038325_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0038325_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0038325 ${OUT_DIR}/GSE57148_C0038325_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0080218_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0080218 ${OUT_DIR}/GSE57148_C0080218_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0080218_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0080218 ${OUT_DIR}/GSE57148_C0080218_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0086196_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0086196 ${OUT_DIR}/GSE57148_C0086196_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0086196_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0086196 ${OUT_DIR}/GSE57148_C0086196_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0086432_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0086432 ${OUT_DIR}/GSE57148_C0086432_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0086432_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0086432 ${OUT_DIR}/GSE57148_C0086432_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0087012_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0087012 ${OUT_DIR}/GSE57148_C0087012_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0087012_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0087012 ${OUT_DIR}/GSE57148_C0087012_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0162809_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0162809 ${OUT_DIR}/GSE57148_C0162809_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0162809_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0162809 ${OUT_DIR}/GSE57148_C0162809_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0235480_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0235480 ${OUT_DIR}/GSE57148_C0235480_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0235480_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0235480 ${OUT_DIR}/GSE57148_C0235480_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0238065_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0238065 ${OUT_DIR}/GSE57148_C0238065_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0238065_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0238065 ${OUT_DIR}/GSE57148_C0238065_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0238281_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0238281 ${OUT_DIR}/GSE57148_C0238281_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0238281_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0238281 ${OUT_DIR}/GSE57148_C0238281_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0242423_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0242423 ${OUT_DIR}/GSE57148_C0242423_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0242423_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0242423 ${OUT_DIR}/GSE57148_C0242423_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0263454_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0263454 ${OUT_DIR}/GSE57148_C0263454_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0263454_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0263454 ${OUT_DIR}/GSE57148_C0263454_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0341869_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0341869 ${OUT_DIR}/GSE57148_C0341869_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0341869_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0341869 ${OUT_DIR}/GSE57148_C0341869_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0393554_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0393554 ${OUT_DIR}/GSE57148_C0393554_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0393554_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0393554 ${OUT_DIR}/GSE57148_C0393554_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0543859_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0543859 ${OUT_DIR}/GSE57148_C0543859_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0543859_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0543859 ${OUT_DIR}/GSE57148_C0543859_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0740376_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0740376 ${OUT_DIR}/GSE57148_C0740376_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0740376_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0740376 ${OUT_DIR}/GSE57148_C0740376_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0740392_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0740392 ${OUT_DIR}/GSE57148_C0740392_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0740392_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0740392 ${OUT_DIR}/GSE57148_C0740392_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0751845_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0751845 ${OUT_DIR}/GSE57148_C0751845_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0751845_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0751845 ${OUT_DIR}/GSE57148_C0751845_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0751846_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0751846 ${OUT_DIR}/GSE57148_C0751846_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0751846_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0751846 ${OUT_DIR}/GSE57148_C0751846_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0751847_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0751847 ${OUT_DIR}/GSE57148_C0751847_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0751847_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0751847 ${OUT_DIR}/GSE57148_C0751847_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0751848_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0751848 ${OUT_DIR}/GSE57148_C0751848_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0751848_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0751848 ${OUT_DIR}/GSE57148_C0751848_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0751849_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0751849 ${OUT_DIR}/GSE57148_C0751849_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0751849_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0751849 ${OUT_DIR}/GSE57148_C0751849_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0751882_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0751882 ${OUT_DIR}/GSE57148_C0751882_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0751882_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0751882 ${OUT_DIR}/GSE57148_C0751882_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0752097_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0752097 ${OUT_DIR}/GSE57148_C0752097_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0752097_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0752097 ${OUT_DIR}/GSE57148_C0752097_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0752098_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0752098 ${OUT_DIR}/GSE57148_C0752098_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0752098_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0752098 ${OUT_DIR}/GSE57148_C0752098_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0752100_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0752100 ${OUT_DIR}/GSE57148_C0752100_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0752100_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0752100 ${OUT_DIR}/GSE57148_C0752100_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0752104_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0752104 ${OUT_DIR}/GSE57148_C0752104_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0752104_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0752104 ${OUT_DIR}/GSE57148_C0752104_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0752105_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0752105 ${OUT_DIR}/GSE57148_C0752105_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0752105_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0752105 ${OUT_DIR}/GSE57148_C0752105_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0752120_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0752120 ${OUT_DIR}/GSE57148_C0752120_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0752120_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0752120 ${OUT_DIR}/GSE57148_C0752120_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0752121_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0752121 ${OUT_DIR}/GSE57148_C0752121_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0752121_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0752121 ${OUT_DIR}/GSE57148_C0752121_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0752122_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0752122 ${OUT_DIR}/GSE57148_C0752122_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0752122_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0752122 ${OUT_DIR}/GSE57148_C0752122_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0752123_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0752123 ${OUT_DIR}/GSE57148_C0752123_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0752123_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0752123 ${OUT_DIR}/GSE57148_C0752123_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0752124_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0752124 ${OUT_DIR}/GSE57148_C0752124_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0752124_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0752124 ${OUT_DIR}/GSE57148_C0752124_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0752125_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0752125 ${OUT_DIR}/GSE57148_C0752125_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0752125_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0752125 ${OUT_DIR}/GSE57148_C0752125_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0948089_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C0948089 ${OUT_DIR}/GSE57148_C0948089_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C0948089_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C0948089 ${OUT_DIR}/GSE57148_C0948089_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C1142166_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C1142166 ${OUT_DIR}/GSE57148_C1142166_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C1142166_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C1142166 ${OUT_DIR}/GSE57148_C1142166_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C1274933_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C1274933 ${OUT_DIR}/GSE57148_C1274933_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C1274933_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C1274933 ${OUT_DIR}/GSE57148_C1274933_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C1527303_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C1527303 ${OUT_DIR}/GSE57148_C1527303_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C1527303_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C1527303 ${OUT_DIR}/GSE57148_C1527303_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C1704377_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C1704377 ${OUT_DIR}/GSE57148_C1704377_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C1704377_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C1704377 ${OUT_DIR}/GSE57148_C1704377_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C1868675_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C1868675 ${OUT_DIR}/GSE57148_C1868675_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C1868675_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C1868675 ${OUT_DIR}/GSE57148_C1868675_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C1956147_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C1956147 ${OUT_DIR}/GSE57148_C1956147_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C1956147_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C1956147 ${OUT_DIR}/GSE57148_C1956147_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C2930471_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C2930471 ${OUT_DIR}/GSE57148_C2930471_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C2930471_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C2930471 ${OUT_DIR}/GSE57148_C2930471_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C2931498_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C2931498 ${OUT_DIR}/GSE57148_C2931498_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C2931498_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C2931498 ${OUT_DIR}/GSE57148_C2931498_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C2936907_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C2936907 ${OUT_DIR}/GSE57148_C2936907_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C2936907_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C2936907 ${OUT_DIR}/GSE57148_C2936907_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C3658301_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C3658301 ${OUT_DIR}/GSE57148_C3658301_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C3658301_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C3658301 ${OUT_DIR}/GSE57148_C3658301_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C3658302_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C3658302 ${OUT_DIR}/GSE57148_C3658302_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C3658302_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C3658302 ${OUT_DIR}/GSE57148_C3658302_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C3889979_disease_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/disease_gsms.txt ${PPI2016} C3889979 ${OUT_DIR}/GSE57148_C3889979_disease_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi
if [ ! -f "${OUT_DIR}/GSE57148_C3889979_healthy_gsms.dat" ]; then
srun -N 1 -n 1 -c 16 python -m 5_expression.eval_random_coexpression ${COPDSEED} ${GDA_FILE} ${EXPR_DIR}/GSE57148/processed/expr.tsv ${EXPR_DIR}/GSE57148/processed/healthy_gsms.txt ${PPI2016} C3889979 ${OUT_DIR}/GSE57148_C3889979_healthy_gsms.dat --N_cores 16 --N_samples 3000 --seed ${SEED} &
else
echo "Skipping..."
fi

wait

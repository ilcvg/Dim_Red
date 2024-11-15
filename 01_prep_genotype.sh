#!/bin/bash

# This script is written for preparing the genotype matrix to run dimensionality reduction >

GENOTYPE="hgdp_chr21"

# 0)
plink2\
 --pfile ${GENOTYPE}\
 --make-bed\
 --max-alleles 2\
 --out ${GENOTYPE}


# 1) LD pruning
plink \
 --bfile ${GENOTYPE} \
 --indep-pairwise 50 5 0.2 \
 --maf 0.01 \
 --hwe 1E-6 \
 --out ${GENOTYPE}

plink \
 --bfile ${GENOTYPE} \
 --extract ${GENOTYPE}.prune.in \
 --recode A \
 --out ${GENOTYPE}.pruned

# 2) make genotype matrix
cat ${GENOTYPE}.pruned.raw | cut -d " " -f7- | awk 'NR>1{print}' > ${GENOTYPE}.pruned.geno.>

chmod +x 02_run_dr.py
./02_run_dr.py ${GENOTYPE}
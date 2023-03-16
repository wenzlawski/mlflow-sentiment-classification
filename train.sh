#!/bin/bash --login
#$ -cwd

#$ -l nvidia_v100=1

#$ -pe smp.pe 8

#module load apps/binapps/anaconda3/2022.10
module load apps/binapps/anaconda3/2020.07
module load apps/binapps/pytorch/1.11.0-39-gpu-cu113
module load tools/env/proxy2

export OMP_NUM_THREADS=$NSLOTS

conda create -y -n mlflow python=3.8 -c conda-forge mlflow

source activate mlflow

mlflow run . -P accelerator=gpu
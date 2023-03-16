#!/bin/bash --login
#$ -cwd

#$ -l nvidia_v100=1

#$ -pe smp.pe 8

module load apps/binapps/anaconda3/2022.10
module load apps/binapps/pytorch/1.11.0-39-gpu-cu113
module load tools/env/proxy

export OMP_NUM_THREADS=$NSLOTS

conda install mlflow

mlflow run . -P accelerator=gpu
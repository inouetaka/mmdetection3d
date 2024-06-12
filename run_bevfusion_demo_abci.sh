#!/bin/bash

#$ -l rt_F=1
#$ -l h_rt=1:00:00
#$ -j y
#$ -cwd
#$ -v GPU_COMPUTE_MODE=3
source /etc/profile.d/modules.sh
module load singularitypro

CODE_SOURCE_PATH=${HOME}/prj-sss-model-evaluation/
SIF=/groups/gca50007/prj-sss-model-evaluation/bevfusion_0b38cf5.sif
MODE=demo

echo "execute...."

singularity exec \
    --bind /scratch/$USER:/scratch/$USER:rw \
    --bind /groups/gca50007/ \
    --nv ${SIF} \
    ${CODE_SOURCE_PATH}/bevfusion_demo_abci_scripts.sh ${MODE}

echo "fin...."

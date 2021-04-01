#!/bin/bash

TOOLBOX_PATH="/bart_demo"
#PYTHONPATH=
PYTHONPATH=${TOOLBOX_PATH}/python:${PYTHONPATH}

echo $TOOLBOX_PATH
echo $PYTHONPATH

python3.8 run_bart.py \
    --challenge "singlecoil" \
    --data_path "../data/FastMRI/knee/" \
    --out_path "../pred-recons" \
    --reg_wt 0.01 \
    --mask_type "random" \
    --split val

#!/bin/bash

python3.8 ./fastMRI/fastmri_examples/cs/run_bart.py \
    --challenge "singlecoil" \
    --data_path "data/FastMRI/knee/" \
    --out_path "pred-recons" \
    --reg_wt 0.01 \
    --mask_type "random" \
    --split val

#!/bin/bash

#SBATCH --job-name=test             # Job name
#SBATCH --partition=gpu_p             # Partition (queue) name, i.e., gpu_p
#SBATCH --gres=gpu:1            # Requests one GPU device
#SBATCH --ntasks=1                    # Run a single task
#SBATCH --cpus-per-task=16            # Number of CPU cores per task
#SBATCH --mem=80gb                    # Job memory request
#SBATCH --time=10:00:00               # Time limit hrs:min:sec
#SBATCH --output=./outlog/%x.%j.out         # Standard output log
#SBATCH --error=./outlog/%x.%j.err          # Standard error log
#SBATCH --mail-user=qt97442@uga.edu
#SBATCH --mail-type=ALL

nvidia-smi

MODEL=facebook/opt-1.3b TASK=RTE MODE=ft LR=1e-6 EPS=1e-3 ENHANCED=fo STEPS=1000 bash mezo.sh

#MODEL=facebook/opt-6.7b TASK=SQuAD MODE=ft LR=5e-7 EPS=1e-3 STEPS=6000 bash mezo.sh
#
#MODEL=facebook/opt-6.7b TASK=SQuAD MODE=ft LR=5e-7 EPS=1e-3 STEPS=6000 ENHANCED=zo bash mezo.sh

#MODEL=facebook/opt-6.7b TASK=RTE MODE=lora LR=5e-5 EPS=1e-2 STEPS=8000 bash mezo.sh
#
#MODEL=facebook/opt-6.7b TASK=CB MODE=lora LR=5e-5 EPS=1e-2 STEPS=6000 bash mezo.sh
#
#MODEL=facebook/opt-6.7b TASK=WSC MODE=lora LR=5e-5 EPS=1e-2 STEPS=12000 bash mezo.sh

#MODEL=facebook/opt-6.7b TASK=SQuAD MODE=lora LR=5e-5 EPS=1e-2 STEPS=6000 bash mezo.sh

#MODEL=facebook/opt-6.7b TASK=SQuAD MODE=lora LR=5e-5 EPS=1e-2 ENHANCED=zo seed=0 STEPS=6000 bash mezo.sh

#MODEL=facebook/opt-6.7b TASK=SST2 MODE=lora LR=5e-5 STEPS=4000 EPS=1e-2 bash mezo.sh

#MODEL=facebook/opt-2.7b TASK=SQuAD MODE=ft LR=5e-7 STEPS=4000 SEED=26 ENHANCED=fo bash mezo.sh

#MODEL=facebook/opt-2.7b TASK=SQuAD MODE=ft LR=5e-7 STEPS=4000 SEED=26 bash finetune.sh


#MODEL=facebook/opt-2.7b TASK=BoolQ MODE=ft LR=1e-5 NUM_GPU=2 bash finetune_fsdp.sh
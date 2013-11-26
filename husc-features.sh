#!/bin/bash
# Created by the VLSCI job script generator for SLURM on x86
# Wed Nov 13 2013 00:00:51 GMT+1100 (EST)

# Partition for the job:
#SBATCH -p main

# The name of the job:
#SBATCH --job-name="features"

# Maximum number of CPU cores used by the job:
#SBATCH --ntasks=1

# The amount of memory in megabytes per process in the job:
#SBATCH --mem-per-cpu=4096

# Send yourself an email when the job:
# aborts abnormally (fails)
#SBATCH --mail-type=FAIL
# ends successfully
#SBATCH --mail-type=END

# The maximum running time of the job in days-hours:mins:sec
#SBATCH --time=0-2:0:00

# Run the job from the directory where it was launched (default):
# The job command(s):
export PATH=${HOME}/anaconda/envs/husc/bin:$PATH
husc features $@


#!/bin/bash
# Created by the VLSCI job script generator for SLURM on x86
# Thu Oct 17 2013 16:48:06 GMT+1100 (EST)

# Partition for the job:
#SBATCH -p main

# The name of the job:
#SBATCH --job-name="illum"

# Maximum number of CPU cores used by the job:
#SBATCH --ntasks=1

# The amount of memory in megabytes per process in the job:
#SBATCH --mem-per-cpu=1024

# Send yourself an email when the job:
# aborts abnormally (fails)
#SBATCH --mail-type=FAIL

# Use this email address:
#SBATCH --mail-user=juan.n@unimelb.edu.au

# The maximum running time of the job in days-hours:mins:sec
#SBATCH --time=0-12:0:00

# Run the job from the directory where it was launched (default):
# The job command(s):
export PATH=${HOME}/anaconda/envs/husc/bin:$PATH
husc illum $@


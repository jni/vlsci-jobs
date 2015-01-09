#!/bin/bash
# Created by the VLSCI job script generator for SLURM on x86
# Wed Jun 18 2014 20:28:15 GMT+1000 (EST)

# check that the script is launched with sbatch
if [ "x$SLURM_JOB_ID" == "x" ]; then
   echo "You need to submit your job to the queuing system with sbatch"
   exit 1
fi

# Partition for the job:
#SBATCH -p main

# The name of the job:
#SBATCH --job-name="conv"

# Maximum number of CPU cores used by the job:
#SBATCH --ntasks=1

# The amount of memory in megabytes per process in the job:
#SBATCH --mem-per-cpu=12288

# Send yourself an email when the job:
# aborts abnormally (fails)
#SBATCH --mail-type=FAIL

# The maximum running time of the job in days-hours:mins:sec
#SBATCH --time=1-0:0:00

# Run the job from the directory where it was launched (default):
# The job command(s):
echo input directory: $1
base=`basename $1`
${HOME}/anaconda/envs/cellom2tif/bin/cellom2tif -c 2 -E ${base}.errors.txt "$1" "tiff/${base}"

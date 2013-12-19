#!/bin/bash
# Created by the VLSCI job script generator for SLURM on x86
# Wed Nov 13 2013 00:00:51 GMT+1100 (EST)

# Partition for the job:
#SBATCH -p main

# The name of the job:
#SBATCH --job-name="husc-pipe"

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
#SBATCH --time=0-10:0:00

# Invoke this script with the directory containing the files being
# analysed as the sole argument.

# Run the job from the directory where it was launched (default):
# The job command(s):

# save slurm job
save_file=$HOME/slurm-jobs/$SLURM_JOB_NAME.$SLURM_JOB_ID.in
cp /var/spool/slurm/job${SLURM_JOB_ID}/slurm_script $save_file
echo \#command: $@ >> $save_file

export PATH=${HOME}/anaconda/envs/husc/bin:$PATH
d=$1
husc crop -O $TMPDIR 100 none 250 none $d/*_s1_w*.TIF
husc crop -O $TMPDIR 100 none none -300 $d/*_s2_w*.TIF
husc crop -O $TMPDIR none -100 250 none $d/*_s3_w*.TIF
husc crop -O $TMPDIR none -100 none -300 $d/*_s4_w*.TIF
for q in s1 s2 s3 s4; do
    for ch in w1 w2 w3; do
        husc illum -L 0.05 -q 0.95 -r 51 -s $d/illum_${q}_${ch}.tif -v \
                   $TMPDIR/*${q}_${ch}*.crop.tif
    done
done
for ch in w1 w2 w3; do
    husc stitch $TMPDIR/M*${ch}*.crop.illum.tif
done
husc cat $TMPDIR/M*stitched.tif
cp $TMPDIR/M*stitched.chs.tif $d &
husc features $TMPDIR/M*stitched.chs.tif $d/features.h5


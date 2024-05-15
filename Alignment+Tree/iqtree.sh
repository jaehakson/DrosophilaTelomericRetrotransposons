#!/bin/bash
#SBATCH --partition=genetics_1    # Partition (job queue)
#SBATCH --requeue                 # Return job to the queue if preempted
#SBATCH --job-name=iqtree_all
#SBATCH --nodes=1                 # Number of nodes you require
#SBATCH --ntasks=1                # Total # of tasks across all nodes
#SBATCH --cpus-per-task=4         # Cores per task (>1 if multithread tasks)
#SBATCH --mem=96000                # Real memory (RAM) required (MB)
#SBATCH --time=144:00:00           # Total run time limit (HH:MM:SS)
#SBATCH --output=$HOME/logs/slurm_iqtree_all.%N.%j.out  # STDOUT output file
#SBATCH --error=$HOME/logs/slurm_iqtree_all.%N.%j.err   # STDERR output file (optional)

module use /projects/community/modulefiles/
module load mafft

cd /scratch/js3054/droso_HTT/MACSE/

###### All GAG sequences
cd /scratch/js3054/droso_HTT/MACSE/
find . -type f -name "*GAG_consensus_AA.fasta" | xargs cat /projects/genetics/ellison_lab/genomes/dna/RepeatLibs/TE_info/AA_telo_non-telo_TEs_GAG.fa > all_GAG_AA_MACSE.fasta

mafft --auto all_GAG_AA_MACSE.fasta > all_GAG_AA_mafft.fasta

source ~/.bashrc
conda activate

clipkit all_GAG_AA_mafft.fasta -m kpic-gappy -g 0.5 -o all_GAG_AA_clipkit_g5.fasta
python /scratch/js3054/droso_HTT/MACSE/filter_align.py all_GAG_AA_clipkit_g5.fasta ../iqtree_GAG/all_GAG_AA_clipkit_g5_filt2.fasta 0.2

conda deactivate

cd /scratch/js3054/droso_HTT/iqtree_GAG/
$HOME/software/iqtree-1.6.12-Linux32/bin/iqtree -s all_GAG_AA_clipkit_g5_filt2.fasta -m TEST -abayes -bb 1000



####### All POL sequences
cd /scratch/js3054/droso_HTT/MACSE/
find . -type f -name "*POL_consensus_AA.fasta" | xargs cat /projects/genetics/ellison_lab/genomes/dna/RepeatLibs/TE_info/AA_telo_non-telo_TEs_POL.fa > all_POL_AA_MACSE.fasta

mafft --auto all_POL_AA_MACSE.fasta > all_POL_AA_mafft.fasta

source ~/.bashrc
conda activate

clipkit all_POL_AA_mafft.fasta -m kpic-gappy -g 0.6 -o all_POL_AA_clipkit_g6.fasta
python /scratch/js3054/droso_HTT/MACSE/filter_align.py all_POL_AA_clipkit_g6.fasta ../iqtree_POL/all_POL_AA_clipkit_g6_filt1.fasta 0.1

conda deactivate

cd /scratch/js3054/droso_HTT/iqtree_POL/
$HOME/software/iqtree-1.6.12-Linux32/bin/iqtree -s all_POL_AA_clipkit_g6_filt1.fasta -m TEST -abayes -bb 1000
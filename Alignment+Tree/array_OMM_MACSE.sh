#!/bin/bash
#SBATCH --partition=genetics_1
#SBATCH --job-name=arr_iqt
#SBATCH --array=0-105
#SBATCH --cpus-per-task=16
#SBATCH --mem=128G
#SBATCH --time=216:00:00
#SBATCH --output=$HOME/logs/array/slurm.%A.%a.out  # STDOUT output file
#SBATCH --error=$HOME/logs/array/slurm.%A.%a.err   # STDERR output file (optional)


module load singularity/3.6.4
module load seqtk

cd /scratch/js3054/droso_HTT/MACSE/

SAMPLE_LIST=($(<array_input.list))
SAMPLE=${SAMPLE_LIST[${SLURM_ARRAY_TASK_ID}]}

# For GAG; use '--time=36:00:00' (jobid: 14613834)
/projects/community/singularity.images/OMM_MACSE/OMM_MACSE_V10.01_sing_3.6.4.sif --in_seq_file ../${SAMPLE}_all_droso_gag.fasta --out_dir ${SAMPLE}_MACSE_GAG --out_file_prefix ${SAMPLE}_GAG --no_prefiltering --no_postfiltering --java_mem 96G
awk '/_cluster/ {print substr($1,2)}' ${SAMPLE}_MACSE_GAG/${SAMPLE}_GAG_final_align_AA.aln | seqtk subseq ${SAMPLE}_MACSE_GAG/${SAMPLE}_GAG_final_align_AA.aln - > ${SAMPLE}_MACSE_GAG/${SAMPLE}_GAG_consensus_AA.fasta


# For POL; use '--time=72:00:00 --cpus-per-task=16' (jobid: 14615831)
/projects/community/singularity.images/OMM_MACSE/OMM_MACSE_V10.01_sing_3.6.4.sif --in_seq_file ../${SAMPLE}_all_droso_pol.fasta --out_dir ${SAMPLE}_MACSE_POL --out_file_prefix ${SAMPLE}_POL --no_prefiltering --no_postfiltering --java_mem 112G
awk '/_cluster/ {print substr($1,2)}' ${SAMPLE}_MACSE_POL/${SAMPLE}_POL_final_align_AA.aln | seqtk subseq ${SAMPLE}_MACSE_POL/${SAMPLE}_POL_final_align_AA.aln - > ${SAMPLE}_MACSE_POL/${SAMPLE}_POL_consensus_AA.fasta

#!/bin/bash

SECONDS=0

# Activate conda environment 
source ~/miniconda3/etc/profile.d/conda.sh 
conda activate rnaseq_env

# change working directory
cd /home/nx24892/my_learnings/Genomics/RNA_Seq



# STEP 1: Run fastqc
fastqc data/demo.fastq -o data/


# run trimmomatic to trim reads with poor quality
trimmomatic SE -threads 4 data/demo.fastq data/demo_trimmed.fastq TRAILING:10 -phred33
echo "Trimmomatic finished running!"

fastqc data/demo_trimmed.fastq -o data/


# STEP 2: Run HISAT2
# mkdir HISAT2
# get the genome indices
#wget https://genome-idx.s3.amazonaws.com/hisat/grch38_genome.tar.gz


# run alignment
hisat2 -q --rna-strandness R -x HISAT2/grch38/grch38/genome -U data/demo_trimmed.fastq | samtools sort -o HISAT2/demo_trimmed.bam
echo "HISAT2 finished running!"

# STEP 3: Run featureCounts - Quantification



# get gtf
# wget http://ftp.ensembl.org/pub/release-106/gtf/homo_sapiens/Homo_sapiens.GRCh38.106.gtf.gz
featureCounts -S 2 -a data/Homo_sapiens.GRCh38.106.gtf -o quants/demo_featurecounts.txt HISAT2/demo_trimmed.bam
echo "featureCounts finished running!"


duration=$SECONDS
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."





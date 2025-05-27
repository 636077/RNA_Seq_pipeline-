# RNA_Seq_pipeline-
fastq-(reads)-to-counts

This repository contains a basic RNA-Seq pipeline written in Bash. The pipeline performs quality control, trimming, alignment, and quantification of RNA-Seq reads.

## Tools Used
- [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) - Quality control
- [Trimmomatic](http://www.usadellab.org/cms/?page=trimmomatic) - Read trimming
- [HISAT2](https://daehwankimlab.github.io/hisat2/) - Read alignment
- [Samtools](http://www.htslib.org/) - BAM sorting
- [Subread featureCounts](http://bioinf.wehi.edu.au/featureCounts/) - Read 
   quantification.

###  Clone the Repository
  git clone https://github.com/636077/RNA_Seq_pipeline.git
  cd RNA_Seq_pipeline

## Setup Conda Environment 
  conda env create -f environment.yml
  conda activate rnaseq_env
  
## Run the Pipeline
 bash RNASeqpipeline.sh
 
Make sure input files (demo.fastq and .gtf) are placed in the data/ directory.

📌 Notes
The genome index (genome.*.ht2) must be pre-built and placed under HISAT2/grch38/grch38/.

Update paths if your file or folder names differ.

You can expand the pipeline by adding differential expression analysis with DESeq2 or edgeR.

How the Pipeline Works
This bash script (rnaseq_pipeline.sh) automates RNA-Seq data processing:

Step	Tool	Purpose
1.	FastQC	Check quality of raw FASTQ reads
2.	Trimmomatic	Trim low-quality bases
3.	FastQC	Re-check quality of trimmed reads
4.	HISAT2 + samtools	Align reads to the genome and sort BAM
5.	featureCounts	Count number of reads mapped to genes
6.	Timer	Measure total runtime

  
👤 Author
Mansi Chandra
Email | LinkedIn

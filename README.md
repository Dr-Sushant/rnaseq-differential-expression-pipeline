# RNA-seq Differential Expression Pipeline

This project implements an end-to-end RNA-seq differential expression workflow using publicly available data from *Ramazzottius varieornatus*.

## Pipeline Overview

SRA → FASTQ → Alignment (HISAT2) → BAM → featureCounts → DESeq2 → Visualization

## Tools Used

- SRA Toolkit
- HISAT2
- SAMtools
- featureCounts (Subread)
- DESeq2 (R)
- Snakemake

## Outputs

- Volcano plot
- Heatmap
- Gene count matrix

## Key Learning

The hardest part of RNA-seq analysis is not the statistics — it is building a working, reproducible pipeline.

## Note

Raw FASTQ and BAM files are excluded due to size.

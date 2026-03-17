# RNA-seq Differential Expression Pipeline

End-to-end RNA-seq workflow for differential gene expression analysis using HISAT2, featureCounts, DESeq2, and Snakemake.

# OBJECTIVE

Analyze RNA-seq data from *Ramazzottius varieornatus* to identify genes differentially expressed under radiation exposure.

# PIPELINE

1. Data download (SRA Toolkit)
2. Quality control (FastQC)
3. Alignment (HISAT2)
4. Quantification (featureCounts)
5. Differential expression (DESeq2)
6. Visualization (Volcano plot, Heatmap)

# RESULTS

- Volcano plot showing differential gene expression
- Heatmap of top 50 genes

### ▶ How to Run

```bash
git clone https://github.com/Dr-Sushant/rnaseq-differential-expression-pipeline.git
cd rnaseq-differential-expression-pipeline
snakemake --cores 4
```

## 📁 Project Structure

```
workflow/   # Snakefile
scripts/    # R scripts
results/    # output plots
data/       # raw data (ignored)
```

## 🔬 Pipeline Overview

SRA → FASTQ → HISAT2 → BAM → featureCounts → Count Matrix → DESeq2 → Visualization

---

## 💡 Note

This project demonstrates a reproducible RNA-seq analysis workflow integrating alignment, quantification, and statistical modeling using Snakemake.

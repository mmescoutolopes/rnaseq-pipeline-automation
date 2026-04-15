# RNA-seq Automated Pipeline: From Raw Data to Functional Genomics

This repository contains a full-stack bioinformatics pipeline developed during my Postdoctoral research. It automates the processing of RNA-seq data from *Sus scrofa*, focusing on efficiency in HPC environments and robust statistical analysis.

## Project Overview
The pipeline converts raw FASTQ reads into biological insights, integrating high-performance alignment tools with advanced downstream analysis in R.

### Key Features:
* **Automated Alignment:** Bash scripts for STAR index generation and mapping in PBS/Torque clusters.
* **Data Integration:** Python script for merging individual sample counts into a unified expression matrix.
* **Functional Genomics:** GSEA (Gene Set Enrichment Analysis) using `fgsea` to identify metabolic pathway modulations.

## Tech Stack
* **Languages:** Bash, Python 3.9, R 4.x
* **Bioinformatics:** STAR, Bioconductor (DESeq2, fgsea, biomaRt)
* **Infrastructure:** HPC (PBS Queue System), Tidyverse ecosystem

## 📂 Repository Structure
* `scripts/`: Shell and Python automation scripts.
* `notebooks/`: Comprehensive RMarkdown reports and HTML outputs.
* `results/`: Processed gene matrices and high-resolution enrichment plots.

## Highlight: Pathway Analysis
The pipeline includes a specialized module for KEGG pathway enrichment. Below is a sample output of the Normalized Enrichment Score (NES) analysis:

> **Note:** The analysis identified significant modulations in metabolic pathways (FDR < 0.25), providing insights into gene regulation.

## How to Run
1. **Alignment:** `bash scripts/star_align.sh`
2. **Matrix Generation:** `python scripts/merge_counts.py`
3. **Statistical Analysis:** Open `scripts/RNA-seq-pipeline.Rmd` in RStudio and Knit.

---
**Contact:** Mariana Mescouto Lopes - https://www.linkedin.com/in/mariana-mescouto-b9150916a/


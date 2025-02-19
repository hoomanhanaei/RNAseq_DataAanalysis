# RNA Sequencing Data Analysis: A 2025 Review and Updated Snakemake Pipeline

- [Introduction](#introduction)
- [Objectives](#objectives)
- [Workflow](#workflow)
  - [Preprocessing](#Preprocessing)
  - [Indexing](#Indexing)
  - [Alignment](#Alignment)
- [Conclusion](#conclusion)
- [References](#references)
---

## Introduction

This project aims to provide an easy-to-use Snakemake pipeline, ensuring that it is ready to run "out-of-the-box" in 2025. The pipeline was developed by replicating the RNA-seq data analysis steps outlined in the original work by Clarissa M. Koch and colleagues [^1], whose well-structured article inspired this effort. I aim to assess whether the methods, tools, and approaches described in their paper are still relevant and effective in 2025, while making the process more accessible to users.

## Objectives

- **Replicate the original analysis:** Recreate the RNA-seq data analysis pipeline outlined by Koch et al. and evaluate whether the tools and methods used in 2018 are still valid in 2025.
- **Compare with other publications:** In addition to replicating the original work, compare their methods and tools with those used in other recent publications.
- **Provide an updated Snakemake pipeline:** Develop a fully automated and easy-to-use Snakemake workflow to run the entire analysis from raw data to final results with minimal setup.
- **Ensure modern compatibility:** Ensure that the pipeline uses up-to-date tools and methods that are efficient and well-supported in 2025, replacing deprecated tools where necessary.
---
## Workflow

### Preprocessing

  - **PreAlignment-QC:**

    - **FastQC**
    - **MultiQC**
  
  - **Trimming - Filtering:**

    - **Trimmomatic**
    - **Fastp**

### Indexing

  - **Bowtie2:**

### Alignment

  - **TopHat2** [^2]

    TopHat2 produces number of files in its tophat_out/ output directory. Some of the generated files are:
    ```
    accepted_hits.bam: list of read alignments in BAM format.

    unmapped.bam: list of unmapped reads in BAM format.

    junctions.bed: BED track of reported junctions.

    insertions.bed: BED track of insertions reported by TopHat.

    deletions.bed: BED track of deletions reported by TopHat.

    prep_reads.info: statistics about the input sequencing data (min/max read length, number of reads).

    align_summary.txt: summary of the alignment counts (number of mapped reads, overall read mapping rate).
    ```

## References
[^1]: Koch CM, Chiu SF, Akbarpour M, Bharat A, Ridge KM, Bartom ET, Winter DR. A Beginner's Guide to Analysis of RNA Sequencing Data. Am J Respir Cell Mol Biol. 2018 Aug;59(2):145-157. doi: 10.1165/rcmb.2017-0430TR. PMID: 29624415; PMCID: PMC6096346.
[^2]: https://hcc.unl.edu/docs/applications/app_specific/bioinformatics_tools/alignment_tools/tophat_tophat2/#:~:text=TopHat2%20Output,-TopHat2%20produces%20number&text=Some%20of%20the%20generated%20files,unmapped.

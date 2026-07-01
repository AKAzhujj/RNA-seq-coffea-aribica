text
# RNA-seq Analysis Pipeline for Coffea arabica Fruit Development

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Project Overview
This project presents a complete, reproducible RNA-seq analysis pipeline investigating gene expression dynamics during coffee fruit development. It is designed as a portfolio project to demonstrate proficiency in computational biology, Linux-based bioinformatics, and reproducible research practices.

**Key Skills Demonstrated:**
- Linux command-line operation & shell scripting
- RNA-seq data processing (FastQC → Trim → Hisat2 → Samtools → StringTie → Ballgown)
- Python/R-based expression quantification (FPKM/TPM)
- Reproducible workflow design with relative paths & modular scripts
- GitHub project management & documentation

## Analysis Pipeline Summary
Raw FASTQ → FastQC (QC) → Trim Galore (trimming) → FastQC (post-trim QC)
→ HISAT2 (alignment) → Samtools (SAM→BAM, sort, index)
→ StringTie (assembly & merge) → Ballgown (quantification)
→ prepDE.py + getFPKM/TPM (expression matrices)

text

## Repository Structure
RNA-seq-Coffee_arabica/
├── README.md # You are here
├── environment.yml # Conda environment for full reproducibility
├── .gitignore # Excludes large intermediate files
├── data/
│ └── README.md # Instructions for downloading raw FASTQ files
├── reference/
│ ├── README.md # Instructions for downloading genome & annotation
│ └── download_genome.sh # Script to fetch genome & GTF from Ensembl Plants
├── scripts/
│ ├── 01_fastqc.sh # Initial quality control
│ ├── 02_trim_galore.sh # Read trimming
│ ├── 03_hisat2_align.sh # Genome alignment
│ ├── 04_samtools_view.sh # SAM to BAM conversion
│ ├── 05_samtools_sort.sh # BAM sorting
│ ├── 06_samtools_index.sh # BAM indexing
│ ├── 07_stringtie_assembly.sh # Transcript assembly per sample
│ ├── 08_merge_gtf_list.sh # Merge all sample GTFs
│ ├── 09_ballgown_merged.sh # Quantification with merged GTF
│ ├── 10_ballgown_gffcmp.sh # (Optional) Quantification with gffcmp annotation
│ ├── 11_expression_matrix.sh # Generate count/FPKM/TPM matrices
│ └── utils/ # Custom/third-party helper scripts
│ ├── getFPKM.py
│ └── getTPM.py
└── results/ # Created automatically by scripts
├── fastqc/
├── trim_galore/
├── hisat2/
├── samtools/
├── stringtie/
├── ballgown/
└── expression/

text

## Quick Start (Reproducing the Analysis)

### Prerequisites
- Linux environment (Ubuntu 20.04+ recommended)
- Conda (Miniconda or Anaconda)
- Git

### 1. Clone the Repository
```bash
git clone https://github.com/AKAzhujj/RNA-seq-coffea-arabica.git
cd Coffee_RNAseq
2. Set Up the Conda Environment
bash
conda env create -f environment.yml
conda activate rnaseq-env
3. Download Reference Genome & Build Index
bash
# Download genome FASTA and annotation GTF from Ensembl Plants
bash reference/download_genome.sh
gunzip reference/*.gz

# Build HISAT2 index
hisat2-build reference/Coffea_canephara.AUK_PRJEB4211.dna.toplevel.fa reference/arabicacoffea_genomic
Reference: Coffea canephora (GCA_900059795.1) from Ensembl Plants.

4. Download Raw Sequencing Data
Follow the instructions in data/README.md to download the raw FASTQ files and place them in the data/ directory.

Expected file naming pattern: a1_1.fq.gz, a1_2.fq.gz, a2_1.fq.gz, ...

5. Run the Complete Pipeline
bash
bash scripts/01_fastqc.sh
bash scripts/02_trim_galore.sh
bash scripts/03_hisat2_align.sh
bash scripts/04_samtools_view.sh
bash scripts/05_samtools_sort.sh
bash scripts/06_samtools_index.sh
bash scripts/07_stringtie_assembly.sh
bash scripts/08_merge_gtf_list.sh
bash scripts/09_ballgown_merged.sh
bash scripts/11_expression_matrix.sh
Note: scripts/10_ballgown_gffcmp.sh is optional and uses an alternative annotation GTF. Skip unless you have generated coffea.all.gtf via gffcompare.

6. Check Results
Final expression matrices are in results/expression/:

gene_count_matrix.csv

transcript_count_matrix.csv

fpkm.csv

tpm.csv

Dependencies
FastQC v0.12.1

Trim Galore v0.6.10

HISAT2 v2.2.1

Samtools v1.18

StringTie v2.2.1

Python 3.8+ (with numpy, pandas)

getFPKM.py & getTPM.py: Custom scripts adapted from [(https://github.com/gpertea/stringtie/blob/master/prepDE.py](https://github.com/gpertea/stringtie/blob/master/prepDE.py)

Full environment specification in environment.yml.

Why This Project Matters
This pipeline was developed as part of my M.Sc. in Crop Science at Yunnan University. It demonstrates:

Computational thinking: Breaking down a complex NGS analysis into modular, reusable steps.

Software engineering practices: Relative paths, environment management, version control, and documentation.

Domain expertise: Applying crop genomics to a real biological question in coffee development.

It serves as a technical portfolio for bioinformatics and computational biology positions in agri-genomics.

Author
Name: [zhujunjie]

Degree: M.Sc. Crop Science, Yunnan University (2026)

GitHub: AKAzhujj

Contact: [zhujunjie0221@163e.com]

License
This project is licensed under the MIT License - see the LICENSE file for details.

text



#!/bin/bash

# Get the directory of this script, then locate the project root
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJ_ROOT="$(dirname "$SCRIPT_DIR")"

# Define input and output paths relative to project root
RAW_DATA="$PROJ_ROOT/data"
FASTQC_OUT="$PROJ_ROOT/results/fastqc"

# Create output directory; -p ensures parent directories are created as well
mkdir -p "$FASTQC_OUT"

echo "Running FastQC on all fq.gz files in $RAW_DATA ..."
for fastq_file in "$RAW_DATA"/*fq.gz
do
    echo "Processing: $fastq_file"
    # Use -o to write reports directly to the output directory, no need for mv
    fastqc "$fastq_file" -o "$FASTQC_OUT"
done
echo "Done! Reports saved to $FASTQC_OUT"

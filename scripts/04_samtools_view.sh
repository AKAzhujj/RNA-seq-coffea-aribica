
#!/bin/bash
# Convert SAM to BAM using samtools view

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJ_ROOT="$(dirname "$SCRIPT_DIR")"

HISAT2_OUT="$PROJ_ROOT/results/hisat2"       # Input: SAM files from hisat2
BAM_DIR="$PROJ_ROOT/results/samtools"         # Output: BAM files

mkdir -p "$BAM_DIR"

for i in a1 a2 a3 b1 b2 b3 c1 c2 c3
do
    samtools view -S "${HISAT2_OUT}/${i}.sam" -b -o "${BAM_DIR}/${i}.bam"
done

echo "SAM to BAM conversion done. BAM files saved to $BAM_DIR"

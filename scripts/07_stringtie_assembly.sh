#!/bin/bash
# StringTie assembly for each sample

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJ_ROOT="$(dirname "$SCRIPT_DIR")"

# Reference annotation GTF
REF_GTF="$PROJ_ROOT/reference/arabicacoffea.combined.gtf"
# Input sorted BAM files
BAM_DIR="$PROJ_ROOT/results/samtools"
# Output directory for individual GTF files
STRINGTIE_OUT="$PROJ_ROOT/results/stringtie"

mkdir -p "$STRINGTIE_OUT"

for i in a1 a2 a3 b1 b2 b3 c1 c2 c3
do
    stringtie -p 8 \
        -G "$REF_GTF" \
        -o "${STRINGTIE_OUT}/${i}.gtf" \
        "${BAM_DIR}/${i}_sort.bam"
done

echo "StringTie assembly done. GTF files saved to $STRINGTIE_OUT"

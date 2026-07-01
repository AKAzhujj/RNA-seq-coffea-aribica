#!/bin/bash
# StringTie quantification with merged GTF and Ballgown table creation

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJ_ROOT="$(dirname "$SCRIPT_DIR")"

# The merged GTF from previous StringTie --merge step
MERGED_GTF="$PROJ_ROOT/results/stringtie/stringtie_merged.gtf"
# Input sorted BAM files
BAM_DIR="$PROJ_ROOT/results/samtools"
# Output Ballgown directory
BALLGOWN_OUT="$PROJ_ROOT/results/ballgown"

mkdir -p "$BALLGOWN_OUT"

for i in a1 a2 a3 b1 b2 b3 c1 c2 c3
do
    stringtie -e -B -p 8 \
        -G "$MERGED_GTF" \
        -o "${BALLGOWN_OUT}/${i}/${i}.gtf" \
        "${BAM_DIR}/${i}_sort.bam"
done

echo "Ballgown tables (merged) saved to $BALLGOWN_OUT"

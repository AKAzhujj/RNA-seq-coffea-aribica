
#!/bin/bash
# Index sorted BAM files using samtools index

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJ_ROOT="$(dirname "$SCRIPT_DIR")"

BAM_DIR="$PROJ_ROOT/results/samtools"

for i in a1 a2 a3 b1 b2 b3 c1 c2 c3
do
    samtools index "${BAM_DIR}/${i}_sort.bam" "${BAM_DIR}/${i}_sort.bam.bai"
done

echo "Indexing done. BAI files saved to $BAM_DIR"

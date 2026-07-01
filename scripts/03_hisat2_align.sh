
#!/bin/bash
# This is for hisat2 batch alignment

# Get the directory of this script, then locate the project root
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJ_ROOT="$(dirname "$SCRIPT_DIR")"

# Define paths relative to project root
TRIM_OUT="$PROJ_ROOT/results/trim_galore"                     # Trimmed reads (from previous step)
REF_INDEX="$PROJ_ROOT/reference/arabicacoffea_genomic"        # HISAT2 index prefix
HISAT2_OUT="$PROJ_ROOT/results/hisat2"                        # Output directory for SAM files

mkdir -p "$HISAT2_OUT"

for i in a1 a2 a3 b1 b2 b3 c1 c2 c3
do
    hisat2 --dta -t -p 8 -x "$REF_INDEX" \
    -1 "${TRIM_OUT}/${i}_1_val_1.fq.gz" \
    -2 "${TRIM_OUT}/${i}_2_val_2.fq.gz" \
    -S "${HISAT2_OUT}/${i}.sam"
done

echo "Alignment completed. SAM files saved to $HISAT2_OUT"

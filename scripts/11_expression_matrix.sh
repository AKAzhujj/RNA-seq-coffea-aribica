#!/bin/bash
# Generate read count matrix and expression tables (FPKM, TPM)

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJ_ROOT="$(dirname "$SCRIPT_DIR")"

# Path to prepDE.py (included with StringTie, should be in PATH or specify full path)
PREPDE_SCRIPT="prepDE.py"
# Input Ballgown directory (from previous step)
BALLGOWN_DIR="$PROJ_ROOT/results/ballgown"
# Output directory for expression matrices
EXPR_OUT="$PROJ_ROOT/results/expression"

mkdir -p "$EXPR_OUT"

# Run prepDE.py to generate gene_count_matrix.csv and transcript_count_matrix.csv
echo "Generating count matrices from Ballgown data..."
$PREPDE_SCRIPT -i "$BALLGOWN_DIR" -g "$EXPR_OUT/gene_count_matrix.csv" -t "$EXPR_OUT/transcript_count_matrix.csv"

# Calculate FPKM and TPM using custom scripts (assuming they are placed in scripts/utils/)
FPKM_SCRIPT="$PROJ_ROOT/scripts/utils/getFPKM.py"
TPM_SCRIPT="$PROJ_ROOT/scripts/utils/getTPM.py"

if [ -f "$FPKM_SCRIPT" ]; then
    echo "Calculating FPKM..."
    python "$FPKM_SCRIPT" -i "$BALLGOWN_DIR" -o "$EXPR_OUT/fpkm.csv"
else
    echo "Warning: getFPKM.py not found, skipping FPKM calculation."
fi

if [ -f "$TPM_SCRIPT" ]; then
    echo "Calculating TPM..."
    python "$TPM_SCRIPT" -i "$BALLGOWN_DIR" -o "$EXPR_OUT/tpm.csv"
else
    echo "Warning: getTPM.py not found, skipping TPM calculation."
fi

echo "Expression matrices saved to $EXPR_OUT"

#!/bin/bash
# Generate a list of all sample GTF files for merging

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJ_ROOT="$(dirname "$SCRIPT_DIR")"

STRINGTIE_OUT="$PROJ_ROOT/results/stringtie"
MERGELIST="$STRINGTIE_OUT/merglist.txt"

# Create a file listing all .gtf files in the stringtie output directory
find "$STRINGTIE_OUT" -name "*.gtf" > "$MERGELIST"

echo "Merge list created at $MERGELIST"

stringtie --merge -p 8 -G reference/arabicacoffea.combined.gtf \
    -o results/stringtie/stringtie_merged.gtf \
    results/stringtie/merglist.txt

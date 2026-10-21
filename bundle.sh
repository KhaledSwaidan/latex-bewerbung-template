#!/bin/bash

# Determine script directory and latex root
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_FILE="${1:-$SCRIPT_DIR/latex_bundle.txt}"

TEX_DIR="$SCRIPT_DIR/tex"

echo "=========================================="
echo "    Bundling LaTeX Files for AI           "
echo "=========================================="

if [ ! -d "$TEX_DIR" ]; then
    echo "❌ Error: $TEX_DIR directory not found."
    exit 1
fi

# Clear or create the output bundle file
cat << EOF > "$OUTPUT_FILE"
================================================================================
LaTeX Context Bundle for AI Prompts
Generated: $(date)
Directory: $TEX_DIR
================================================================================

EOF

count=0

# Find all .tex files and append to bundle
for file in "$TEX_DIR"/*.tex; do
    if [ -f "$file" ]; then
        rel_path="${file#$SCRIPT_DIR/}"
        echo "📄 Adding $rel_path ..."

        cat << EOF >> "$OUTPUT_FILE"
--------------------------------------------------------------------------------
File: $rel_path
--------------------------------------------------------------------------------
$(cat "$file")

EOF
        ((count++))
    fi
done

echo "=========================================="
echo "✅ Bundled $count LaTeX files into:"
echo "   $OUTPUT_FILE"
echo "=========================================="

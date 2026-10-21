#!/bin/bash

# Determine script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEX_DIR="$SCRIPT_DIR/tex"
OUTPUT_DIR="$SCRIPT_DIR/pdf"

# Ensure directories exist
mkdir -p "$TEX_DIR"
mkdir -p "$OUTPUT_DIR"

echo "=========================================="
echo "      Compiling LaTeX Documents (Test)    "
echo "=========================================="
echo "📁 Output Folder: $OUTPUT_DIR"
echo "=========================================="

COMPILER=""

if command -v latexmk &> /dev/null; then
    COMPILER="latexmk"
elif command -v pdflatex &> /dev/null; then
    COMPILER="pdflatex"
elif command -v xelatex &> /dev/null; then
    COMPILER="xelatex"
elif command -v lualatex &> /dev/null; then
    COMPILER="lualatex"
elif command -v tectonic &> /dev/null; then
    COMPILER="tectonic"
fi

compile_doc() {
    local tex_file="$1"
    local base_name="${tex_file%.tex}"
    local pdf_file="${base_name}.pdf"

    if [ -z "$COMPILER" ]; then
        echo "⚠️  No LaTeX compiler (latexmk, pdflatex, xelatex, lualatex, tectonic) found on PATH."
        echo "    To install LaTeX on Ubuntu/Debian, run:"
        echo "    sudo apt-get update && sudo apt-get install -y texlive-latex-base texlive-latex-recommended texlive-lang-german"

        if [ -f "$OUTPUT_DIR/$pdf_file" ]; then
            echo "ℹ️  Existing PDF retained: $OUTPUT_DIR/$pdf_file"
        fi
        return 1
    fi

    echo "📄 Compiling $tex_file with $COMPILER..."

    cd "$TEX_DIR" || exit 1

    if [ "$COMPILER" = "latexmk" ]; then
        latexmk -pdf -interaction=nonstopmode "$tex_file"
    elif [ "$COMPILER" = "tectonic" ]; then
        tectonic "$tex_file"
    else
        "$COMPILER" -interaction=nonstopmode "$tex_file"
        "$COMPILER" -interaction=nonstopmode "$tex_file"
    fi

    if [ -f "$pdf_file" ]; then
        mv "$pdf_file" "$OUTPUT_DIR/$pdf_file"
        echo "✅ Successfully generated $OUTPUT_DIR/$pdf_file"
    else
        echo "❌ Failed to generate $pdf_file"
    fi
}

cleanup() {
    echo "🧹 Cleaning up auxiliary files..."
    cd "$TEX_DIR" || exit 1
    rm -f *.aux *.log *.out *.toc *.fdb_latexmk *.fls *.synctex.gz
}

# Compile both documents
compile_doc "lebenslauf.tex"
echo "------------------------------------------"
compile_doc "anschreiben.tex"

cleanup

echo "=========================================="
echo "🎉 Documents available in:"
echo "   $OUTPUT_DIR/"
if [ -f "$OUTPUT_DIR/lebenslauf.pdf" ]; then
    echo "   ├── lebenslauf.pdf"
fi
if [ -f "$OUTPUT_DIR/anschreiben.pdf" ]; then
    echo "   └── anschreiben.pdf"
fi
echo "=========================================="
echo "Done."

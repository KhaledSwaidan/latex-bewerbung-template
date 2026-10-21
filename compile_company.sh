#!/bin/bash

# Determine script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEX_DIR="$SCRIPT_DIR/tex"
DEFAULT_PDF_DIR="$SCRIPT_DIR/pdf"

# Ensure directories exist
mkdir -p "$TEX_DIR"
mkdir -p "$DEFAULT_PDF_DIR"

# Check if company name argument is provided
COMPANY_NAME="$1"

# If no argument provided and running interactively, prompt user
if [ -z "$COMPANY_NAME" ]; then
    if [ -t 0 ]; then
        read -r -p "Enter company name: " COMPANY_NAME
    fi
fi

if [ -z "$COMPANY_NAME" ]; then
    echo "❌ Error: Company name is required."
    echo "Usage: $0 <Company_Name>"
    exit 1
fi

OUTPUT_DIR="$SCRIPT_DIR/applications/$COMPANY_NAME"
mkdir -p "$OUTPUT_DIR"

echo "=========================================="
echo "    Compiling LaTeX Documents (Company)   "
echo "=========================================="
echo "🏢 Target Company: $COMPANY_NAME"
echo "📁 Output Folder:  $OUTPUT_DIR"
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

        # Fallback: copy existing pre-compiled PDF from default pdf directory if available
        if [ -f "$DEFAULT_PDF_DIR/$pdf_file" ]; then
            cp "$DEFAULT_PDF_DIR/$pdf_file" "$OUTPUT_DIR/$pdf_file"
            echo "✅ Copied pre-compiled fallback $DEFAULT_PDF_DIR/$pdf_file to $OUTPUT_DIR/$pdf_file"
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

#!/bin/bash

# Ensure local user binaries (e.g. tectonic) are in PATH
export PATH="$HOME/.local/bin:$PATH"

# Determine script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEX_DIR="$SCRIPT_DIR/tex"
DEFAULT_PDF_DIR="$SCRIPT_DIR/pdf"

# Parse arguments: company name and optional --force
COMPANY_NAME=""
FORCE_BUILD=false

for arg in "$@"; do
    if [ "$arg" = "--force" ] || [ "$arg" = "-f" ]; then
        FORCE_BUILD=true
    elif [ -z "$COMPANY_NAME" ]; then
        COMPANY_NAME="$arg"
    fi
done

# If no company provided and running interactively, prompt user
if [ -z "$COMPANY_NAME" ]; then
    if [ -t 0 ]; then
        read -r -p "Enter company name: " COMPANY_NAME
    fi
fi

if [ -z "$COMPANY_NAME" ]; then
    echo "❌ Error: Company name is required."
    echo "Usage: $0 <Company_Name> [--force]"
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

if command -v tectonic &> /dev/null; then
    COMPILER="tectonic"
elif command -v latexmk &> /dev/null; then
    COMPILER="latexmk"
elif command -v pdflatex &> /dev/null; then
    COMPILER="pdflatex"
elif command -v xelatex &> /dev/null; then
    COMPILER="xelatex"
elif command -v lualatex &> /dev/null; then
    COMPILER="lualatex"
fi

needs_compile() {
    local tex_path="$1"
    local pdf_path="$2"

    if [ "$FORCE_BUILD" = "true" ] || [ ! -f "$pdf_path" ]; then
        return 0
    fi

    if [ "$tex_path" -nt "$pdf_path" ]; then
        return 0
    fi

    # Check if any style files are newer than the PDF
    for style_file in "$TEX_DIR"/style/*.tex; do
        if [ -f "$style_file" ] && [ "$style_file" -nt "$pdf_path" ]; then
            return 0
        fi
    done

    return 1
}

compile_doc() {
    local tex_file="$1"
    local base_name="${tex_file%.tex}"
    local pdf_file="${base_name}.pdf"
    local src_path="$TEX_DIR/$tex_file"
    local target_path="$OUTPUT_DIR/$pdf_file"

    if [ -z "$COMPILER" ]; then
        echo "⚠️  No LaTeX compiler (tectonic, latexmk, pdflatex, xelatex) found on PATH."

        # Fallback: copy existing pre-compiled PDF from default pdf directory if available
        if [ -f "$DEFAULT_PDF_DIR/$pdf_file" ]; then
            cp "$DEFAULT_PDF_DIR/$pdf_file" "$target_path"
            echo "✅ Copied pre-compiled fallback $DEFAULT_PDF_DIR/$pdf_file to $target_path"
        fi
        return 1
    fi

    if ! needs_compile "$src_path" "$target_path"; then
        echo "⏭️  $pdf_file is up to date for $COMPANY_NAME. Skipping compilation."
        return 0
    fi

    echo "📄 Compiling $tex_file with $COMPILER..."

    cd "$TEX_DIR" || exit 1

    local log_tmp
    log_tmp=$(mktemp)

    local compile_status=0

    if [ "$COMPILER" = "tectonic" ]; then
        tectonic "$tex_file" > "$log_tmp" 2>&1 || compile_status=$?
    elif [ "$COMPILER" = "latexmk" ]; then
        latexmk -pdf -interaction=nonstopmode "$tex_file" > "$log_tmp" 2>&1 || compile_status=$?
    else
        "$COMPILER" -interaction=nonstopmode "$tex_file" > "$log_tmp" 2>&1
        "$COMPILER" -interaction=nonstopmode "$tex_file" > "$log_tmp" 2>&1 || compile_status=$?
    fi

    if [ $compile_status -eq 0 ] && [ -f "$pdf_file" ]; then
        mv "$pdf_file" "$target_path"
        echo "✅ Successfully generated $target_path"
    else
        echo "❌ Failed to generate $pdf_file"
        echo "--- Error Log ---"
        cat "$log_tmp"
        echo "-----------------"
    fi

    rm -f "$log_tmp"
}

cleanup() {
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

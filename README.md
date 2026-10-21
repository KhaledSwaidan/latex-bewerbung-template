# LaTeX Bewerbung Template (`latex-bewerbung-template`)

A clean, modern LaTeX template for job application documents (Lebenslauf / CV and Anschreiben / Cover Letter) with shell script automation.

## 📁 Repository Structure

```
.
├── tex/
│   ├── lebenslauf.tex         # Resume / CV source file
│   ├── anschreiben.tex        # Cover letter source file
│   ├── style_lebenslauf.tex   # Styling configuration for Lebenslauf
│   └── style_anschreiben.tex  # Styling configuration for Anschreiben
├── pdf/                       # Direct / testing output directory
│   ├── lebenslauf.pdf
│   └── anschreiben.pdf
├── applications/              # Company-specific outputs (ignored in git)
├── compile.sh                 # Test compilation script
├── compile_company.sh         # Company application compilation script
└── bundle.sh                  # Bundle script for AI prompt context
```

## 🚀 Usage

### 1. Test / Draft Compilation
To compile your draft documents directly for quick testing into `pdf/`:
```bash
./compile.sh
```
This generates:
- `pdf/lebenslauf.pdf`
- `pdf/anschreiben.pdf`

### 2. Company Application Compilation
When your documents are ready and you want to generate documents for a specific company:
```bash
./compile_company.sh "CompanyName"
```
This generates:
- `applications/CompanyName/lebenslauf.pdf`
- `applications/CompanyName/anschreiben.pdf`

### 3. Context Bundling (Optional)
To bundle all `.tex` files into a single text file for AI prompt context:
```bash
./bundle.sh
```

## 🛠️ Prerequisites

To compile natively from `.tex` source files, install LaTeX:
- **Ubuntu/Debian**:
  ```bash
  sudo apt-get update && sudo apt-get install -y texlive-latex-base texlive-latex-recommended texlive-lang-german
  ```
- *Note: If no LaTeX compiler is found on your PATH, the scripts fall back to preserving/copying pre-compiled PDFs in `pdf/`.*

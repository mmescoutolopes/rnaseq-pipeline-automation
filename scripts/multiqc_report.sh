#!/bin/bash
# Script to automate Quality Control reporting using MultiQC

INPUT_DIR="./results"
OUTPUT_DIR="./results/qc_reports"

# Create output directory if it doesn't exist
mkdir -p $OUTPUT_DIR

echo "🔍 Running MultiQC to aggregate pipeline logs..."

# MultiQC scans the input directory for any recognized log files
multiqc $INPUT_DIR \
    --outdir $OUTPUT_DIR \
    --title "RNA-seq Pipeline Quality Control Report" \
    --filename "multiqc_report.html"

echo "✅ MultiQC report generated at: $OUTPUT_DIR/multiqc_report.html"
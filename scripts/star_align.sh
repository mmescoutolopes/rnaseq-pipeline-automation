#!/bin/bash
# Script para alinhamento de amostras RNA-seq

# Configurações de caminhos relativos
GENOME_DIR="./data/genome/IndexedGenome"
GTF_FILE="./data/genome/Sus_scrofa.Sscrofa11.1.111.gtf"
INPUT_DIR="./data/fastq"
OUTPUT_DIR="./results/star_out"

mkdir -p $OUTPUT_DIR

# Loop para processar as amostras
# Dica: O padrão de busca abaixo localiza arquivos R1 e deduz o par R2
for R1_FILE in ${INPUT_DIR}/*_R1_paired.fq.gz
do
    # Extrai o nome da amostra a partir do nome do arquivo
    SAMPLE=$(basename "$R1_FILE" _R1_paired.fq.gz)
    R2_FILE="${INPUT_DIR}/${SAMPLE}_R2_paired.fq.gz"

    echo "Processando amostra: $SAMPLE"

    STAR \
        --runThreadN 12 \
        --genomeDir $GENOME_DIR \
        --readFilesIn "$R1_FILE" "$R2_FILE" \
        --readFilesCommand zcat \
        --sjdbGTFfile $GTF_FILE \
        --outSAMtype BAM SortedByCoordinate \
        --quantMode GeneCounts \
        --outFileNamePrefix "${OUTPUT_DIR}/${SAMPLE}_" 
done

echo "Pipeline de alinhamento finalizada!"
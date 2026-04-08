#!/bin/bash
# Script para geração de índice do genoma usando STAR 

# Definição de variáveis - Altere conforme seu ambiente
THREADS=12
GENOME_FA="./data/genome/Sus_scrofa.Sscrofa11.1.dna_rm.toplevel.fa"
GTF_FILE="./data/genome/Sus_scrofa.Sscrofa11.1.111.gtf"
INDEX_DIR="./data/genome/IndexedGenome"

# Criar diretório de índice se não existir
mkdir -p $INDEX_DIR

echo "Iniciando indexação com STAR..."

STAR \
  --runThreadN $THREADS \
  --runMode genomeGenerate \
  --genomeDir $INDEX_DIR \
  --genomeFastaFiles $GENOME_FA \
  --sjdbGTFfile $GTF_FILE \
  --sjdbOverhang 149 [cite: 1]

echo "Índice concluído!"
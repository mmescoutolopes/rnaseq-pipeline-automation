import os
import pandas as pd

# Caminho onde estão os arquivos
input_dir = "/home/ps11038/star_out"

# Lista de arquivos de contagem
files = [f for f in os.listdir(input_dir) if f.endswith("ReadsPerGene.out.tab")]

# Ordena para manter amostras na ordem
files.sort()

# Lê o primeiro arquivo para pegar a lista de genes
df0 = pd.read_csv(os.path.join(input_dir, files[0]), sep="\t", header=None)
# Coluna 0 = gene_id, coluna 1 = Unstranded, coluna 2 = Stranded, coluna 3 = ReverseStranded
genes = df0[0]

# Vamos usar a coluna 2 (stranded) - que é a mais comum para RNAseq par-end
# (se seu protocolo for unstranded, podemos trocar pela coluna 1)
all_counts = pd.DataFrame({"GeneID": genes})

for f in files:
    sample_name = f.replace("_ReadsPerGene.out.tab", "")
    df = pd.read_csv(os.path.join(input_dir, f), sep="\t", header=None)
    all_counts[sample_name] = df[2]  # usa a coluna 2

# Salva a matriz final
out_file = os.path.join(input_dir, "gene_counts_matrix.tsv")
all_counts.to_csv(out_file, sep="\t", index=False)

print(f"Matriz salva em: {out_file}")

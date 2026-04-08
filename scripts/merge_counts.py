import os
import pandas as pd
import sys

def main():
    # Define o diretório de entrada (usa o atual se não for passado via argumento)
    input_dir = sys.argv[1] if len(sys.argv) > 1 else "./results/star_out"
    
    if not os.path.exists(input_dir):
        print(f"Erro: O diretório {input_dir} não existe.")
        return

    # Lista de arquivos de contagem gerados pelo STAR
    files = sorted([f for f in os.listdir(input_dir) if f.endswith("ReadsPerGene.out.tab")])

    if not files:
        print("Nenhum arquivo 'ReadsPerGene.out.tab' encontrado.")
        return

    print(f"Encontradas {len(files)} amostras. Consolidando matriz...")

    # Lê o primeiro arquivo para obter a lista de Gene IDs
    df0 = pd.read_csv(os.path.join(input_dir, files[0]), sep="\t", header=None, skiprows=4)
    all_counts = pd.DataFrame({"GeneID": df0[0]})

    for f in files:
        sample_name = f.replace("_ReadsPerGene.out.tab", "")
        # Coluna 2 costuma ser usada para protocolos 'stranded'
        df = pd.read_csv(os.path.join(input_dir, f), sep="\t", header=None, skiprows=4)
        all_counts[sample_name] = df[2] 

    # Salva a matriz final
    out_file = os.path.join(input_dir, "gene_counts_matrix.tsv")
    all_counts.to_csv(out_file, sep="\t", index=False)

    print(f"✅ Matriz salva com sucesso em: {out_file}")

if __name__ == "__main__":
    main()
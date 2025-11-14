# ======================================================
# COLETA DE DADOS E TIPOS DE AMOSTRAGENS COM LINGUAGEM R
# ======================================================

# Em R, podemos coletar dados de várias formas, como importar 
# arquivos CSV, ler planilhas, ou até buscar informações na 
# web via APIs.

# Exemplo de coleta de dados com arquivo csv via função
# read.csv da linguagem R.

alunos <- read.csv(file = "alunos_csv/alunos.csv")

head(alunos)

View(alunos)

# Segue outras formas de coleta para outros tipos de arquivos:

# arquivo_internet <- read.csv("https://arquivo.csv")
# arquivo_tsv <- read.delim("arquivo.tsv")
# arquivo_excel <- read_excel("arquivo.xlsx")
# arquivo_json <- fromJSON("arquivo.json")
# arquivo_xml <- xmlToDataFrame("arquivo.xml")
# arquivo_html <- read_html("arquivo.html")

# Para maiores informações sobre essas funções de leitura:
# ACESSE: https://github.com/jcarlossc/open-files-r
# ACESSE: https://informaticus77-r.blogspot.com/2025/09/blog-post_17.html

# --------------------------------------------------

# Exemplos de tipos de amostragem em linguagem R.

# 1. Amostragem aleatória: a função sample(), com o suporte da
# função nrow(), escolhe aleatoriamente 20 linhas do
# conjunto de dados.
amostra_aleatoria <- alunos[sample(nrow(alunos), 20),]

# A função data.frame() cria outro conjunto de dados com
# as 20 observações.
df_amostra_aleatoria <- data.frame(amostra_aleatoria)

# Imprime as primeiras linhas do data frame.
head(df_amostra_aleatoria)

# Conta a quantidade de linhas.
nrow(df_amostra_aleatoria
     
# --------------------------------------------------


     
# ======================================================
# COLETA DE DADOS E TIPOS DE AMOSTRAGENS COM LINGUAGEM R
# ======================================================

# Em R, podemos coletar dados de várias formas, como importar 
# arquivos CSV, ler planilhas, ou até buscar informações na 
# web via APIs.

# Exemplo de coleta de dados com arquivo csv via função
# read.csv em linguagem R.

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

# AMOSTRAGES PROBABILÍSTICAS
# Amostragem aleatória.
# Amostragem Sistematica.
# Amostragem Estratificada.

# 1. Amostragem aleatória: a função sample(), com suporte da
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

# 2. Amostragem sistemática: O primeiro elemento é escolhido 
# e os demais seguem um intervalo fixo.

# Total de linhas da população.
total_linhas <- nrow(alunos)

# Tamanho da amostra.
tamanho_amostra <- 20    

# Intervalo.
intervalo <- floor(total_linhas / tamanho_amostra) 

# Cria início da contagem.
inicio <- sample(1: intervalo, 1)

# A função seq() cria uma sequência dos índices da amostra 
# sistemática.
amostra_sistematica <- seq(inicio, by = intervalo, length.out = tamanho_amostra) 

# A função data.frame() cria outro conjunto de dados com
# os 20 índices da amostra.
df_amostra_sistematica <- data.frame(amostra_sistematica)

# Imprime os índices da amostra.
df_amostra_sistematica

# --------------------------------------------------

library(dplyr)

# 3. Amostragem estratificada: Divide a população em estratos 
# homogêneos (ex: sexo) e realiza sorteios em 
# cada grupo de forma proporcional.

# Utilizando o pacote dplyr(), a função group_by() agrupa por sexo e 
# slice_sample() para separar proporcionalmente, ou seja,
# 20 observações(12 "M" e 8 "F").
amostra_estratificada <- alunos %>%
  group_by(sexo) %>%
  slice_sample(prop = 0.2)

# Imprime o resultado.
amostra_estratificada  

# --------------------------------------------------

# AMOSTRAGENS NÃO PROBABILÍSTICAS
# Amostragem por Conveniência.
# Amostragem Intencional (ou por Julgamento).
# Amostragem por Cotas.

# 1. Amostragem por Conveniência:
# Selecionando manualmente os 20 primeiros registros.
amostra_conveniencia <- head(alunos, 20)

# Imprime resultados
amostra_conveniencia

# --------------------------------------------------

# 2. Amostragem Intencional (ou por Julgamento)
# O pesquisador escolhe elementos que considera mais representativos.
amostra_intencional <- alunos %>%
  filter(idade > 27)

# Imprime resultados.
amostra_intencional

# --------------------------------------------------

# 3. Amostragem por Cotas.
# Semelhante à estratificada, mas sem aleatoriedade, mantendo
# proporções pré-definidas.
amostra_cotas <- rbind(
  head(subset(alunos, sexo == "M"), 10),
  head(subset(alunos, sexo == "F"), 10)
)
# Imprime resultados
amostra_cotas

# --------------------------------------------------
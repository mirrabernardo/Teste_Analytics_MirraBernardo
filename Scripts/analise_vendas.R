# Parte 1: Análise do dataset limpo, incluindo: Cálculo do total de vendas (Quantidade * Preço) por produto; Identificação do produto com o maior número de vendas totais.
#
# Carregamento de arquivo com funções
source("./Scripts/funcoes.R")

# Instalação e carregamento de pacotes (utilizando uma função encapsulada em outro arquivo)
instalar_carregar("dplyr")

# Leitura do arquivo CSV e criação de uma variável com o dataset
dataset_vendas <- read.csv("./Datas/data_clean.csv")

# Adição da coluna Preço_Total ao dataset
dataset_vendas <- dataset_vendas %>%
  mutate(Preço_Total = Quantidade * Preço)

# CÁLCULO DE PREÇO
# Cálculo do total de vendas por produto
total_vendas_por_produto <- dataset_vendas %>%
  group_by(Produto) %>%
  summarise(Valor_Total_Vendas = sum(Preço_Total)) %>%
  arrange(desc(Valor_Total_Vendas))

produto_max_vendas <- total_vendas_por_produto[1, ] # Produto com maior venda total

# CÁLCULO DE QUANTIDADES
# Cálculo do total de quantidade vendida por produto
total_quantidade_por_produto <- dataset_vendas %>%
  group_by(Produto) %>%
  summarise(Quantidade_Total = sum(Quantidade)) %>%
  arrange(desc(Quantidade_Total))

produto_max_quantidade <- total_quantidade_por_produto[1, ] # Produto com maior quantidade vendida

# Impressão de resultados
cat("O total de vendas por produto foi o seguinte:\n")
print(total_vendas_por_produto)

cat(sprintf(
  "O produto %s teve o maior valor de vendas, totalizando R$ %.2f.\n",
  produto_max_vendas$Produto, produto_max_vendas$Valor_Total_Vendas
))

cat("O total de unidades vendidas por produto foi o seguinte:\n")
print(total_quantidade_por_produto)

cat(sprintf(
  "O produto %s foi o mais vendido em quantidade, totalizando %d unidades.\n",
  produto_max_quantidade$Produto, produto_max_quantidade$Quantidade_Total
))

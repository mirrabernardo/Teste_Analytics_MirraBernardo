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

# Cálculo do preço médio dos produtos
preco_medio_geral <- mean(dataset_vendas$Preço, na.rm = TRUE)

# Cálculo do preço médio por produto dentro de cada categoria
preco_medio_por_produto_categoria <- dataset_vendas %>%
  group_by(Categoria, Produto) %>%
  summarise(Preco_Medio = mean(Preço, na.rm = TRUE)) %>%
  arrange(Categoria, desc(Preco_Medio))



# CÁLCULO DE QUANTIDADES
# Cálculo do total de quantidade vendida por produto
total_quantidade_por_produto <- dataset_vendas %>%
  group_by(Produto) %>%
  summarise(Quantidade_Total = sum(Quantidade)) %>%
  arrange(desc(Quantidade_Total))

produto_max_quantidade <- total_quantidade_por_produto[1, ] # Produto com maior quantidade vendida



# IMPRESSÃO DE RESULTADOS
cat("O total de vendas por produto foi o seguinte:\n")
print(total_vendas_por_produto)

cat(sprintf(
  "O produto %s teve o maior faturamento, totalizando R$ %.2f.\n",
  produto_max_vendas$Produto, produto_max_vendas$Valor_Total_Vendas
))

cat(sprintf("O preço médio geral dos produtos é R$ %.2f.\n", preco_medio_geral))

cat("O preço médio de cada produto por categoria é o seguinte:\n")
print(preco_medio_por_produto_categoria)

cat("O total de unidades vendidas por produto foi o seguinte:\n")
print(total_quantidade_por_produto)

cat(sprintf(
  "O produto %s foi o mais vendido em quantidade, totalizando %d unidades.\n",
  produto_max_quantidade$Produto, produto_max_quantidade$Quantidade_Total
))
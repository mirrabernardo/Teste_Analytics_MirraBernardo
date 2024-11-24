# Parte 2: Consultas SQL para listar o nome do produto, categoria e a soma total de vendas (Quantidade * Preço) para cada produto, ordenando o resultado pelo valor total de vendas em ordem decrescente. E Identificar os produtos que menos venderam no mês de junho de 2024 (porém, os dados são do ano de 2023, então utilizarei como referência junho de 2023).

# Carregamento de arquivo com funções
source("./Scripts/funcoes.R")

# Instalação e carregamento de pacotes (utilizando uma função encapsulada em outro arquivo)
instalar_carregar("sqldf")

# Carregamento do dataset limpo
dataset_vendas <- read.csv("./Datas/data_clean.csv")

# CONSULTA 1
consulta1 <- "
-- Consulta para listar produto, categoria e soma total de vendas (Quantidade * Preço) para cada produto. Ordenando pelo valor total de vendas em ordem decrescente.
SELECT
  Produto, Categoria, SUM(Quantidade * Preço) AS Total_Vendas
FROM
  dataset_vendas
GROUP BY
  Produto, Categoria
ORDER BY
  Total_Vendas DESC
"
resultado_consulta1 <-sqldf(consulta1)
print(resultado_consulta1)
# O produto com maior faturamento foi Camisa Infantil (R$4571,35).
# O produto com menor faturamento foi Camiseta Adulto (R$745,23).



# CONSULTA 2
consulta2 <- "
-- Consulta para identificar os produtos que venderam menos no mês de junho de 2023
SELECT
  Produto, SUM(Quantidade) AS Quantidade, SUM(Quantidade * Preço) AS Faturamento
FROM
  dataset_vendas
WHERE
  Data >= '2023-06-01' AND Data <= '2023-06-30'
GROUP BY
  Produto
ORDER BY
  Quantidade ASC
"
resultado_consulta2 <-sqldf(consulta2)
print(resultado_consulta2)
# O produto com menos unidades vendidas em junho de 2023 foi Camiseta. 
# E o produto com menor faturamento foi Calça.



# CONSULTA 3
consulta3 <-"
-- Consulta para detalhar os produtos menos vendidos em junho de 2023
SELECT
  Produto, Categoria, SUM(Quantidade) AS Quantidade, SUM(Quantidade * Preço) AS Faturamento
FROM
  dataset_vendas
WHERE
  Data >= '2023-06-01' AND Data <= '2023-06-30'
GROUP BY
  Produto, Categoria
ORDER BY
  Quantidade ASC
"
resultado_consulta3 <-sqldf(consulta3)
print(resultado_consulta3)
# Camiseta-Infantil foi o produto com menos unidades vendidas (apenas uma), sendo também o produto com menos faturamento.



# Salvando as consultas em um arquivo SQL
writeLines(c(consulta1, consulta2, consulta3), "./Scripts/consultas_sql.sql")

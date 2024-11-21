# PARTE 1: Criação de script para simular um dataset de vendas com 100 registros, contendo as colunas: ID, Data, Produto, Categoria, Quantidade, Preço. E período de 01/01/2023 a 31/12/2023.


# Definição de parâmentros 
qtd_registros <- 100
data_inicial <- as.Date("2023-01-01")
data_final <- as.Date("2023-12-31")
produtos <- c("Camiseta", "Calça", "Sapato", "Camisa") 
categorias <- c("Infantil", "Juvenil", "Adulto")
# optei por especificar os produtos e as categorias para que as dados não fiquem muito genéricos

# Função para gerar as datas das vendas
data_venda <- function(data_inicial, data_final, qtd_registros) {
  as.Date(runif(qtd_registros, min = as.numeric(data_inicial), max = as.numeric(data_final)), origin = "1970-01-01")
}

# Criação do Dataset
set.seed(123) # para igualdade de dados durante a reprodução do script
dataset_vendas <- data.frame(
  ID = 1:qtd_registros,
  Data = data_venda(data_inicial, data_final, qtd_registros),
  Produto = sample(produtos, qtd_registros, replace = TRUE),
  Categoria = sample(categorias, qtd_registros, replace = TRUE),
  Quantidade = sample(1:5,qtd_registros, replace = TRUE),
  Preço = round(runif(qtd_registros, min = 50, max = 200), 2)
)
# Salvando o Dataset em um arquivo CSV
write.csv(dataset_vendas, "../Datas/dataset_vendas.csv", row.names = FALSE)

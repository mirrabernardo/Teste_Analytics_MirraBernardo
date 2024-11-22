# Parte 1: Limpeza dos dados, incluindo: Tratamento de valores faltantes; Remoção de duplicatas; Conversão de tipos de dados e Criação de um arquivo com o dataset limpo.
#
# Carregamento de arquivo com funções
source("./Scripts/funcoes.R")

# Instalação e carregamento de pacotes (utilizando uma função encapsulada em outro arquivo)
instalar_carregar("dplyr")
instalar_carregar("lubridate")
instalar_carregar("tidyr")

# Leitura do arquivo CSV e criação de uma variável com o dataset
dataset_vendas <- read.csv("./Datas/dataset_vendas.csv")

# Correção dos valores das peças infantis no mês de outubro (SITUAÇÃO-PROBLEMA) - Favor verificar o arquivo ´contexto.md´
dataset_vendas <- dataset_vendas %>%
  mutate(
    Data = as.Date(Data),
    Preço = ifelse(Categoria == "Infantil" & month(Data) == 10, 50.00, Preço)
  )

# Remoção de registros que contém algum NULL
dataset_vendas <- dataset_vendas %>%
  tidyr::drop_na()

# Remoção de duplicatas
dataset_vendas <- dataset_vendas %>%
  distinct()

# Verificação dos tipos de dados
summary(dataset_vendas)

# Conversão dos tipos de dados para factors para melhorar a análise
dataset_vendas$Produto <- factor(dataset_vendas$Produto)
dataset_vendas$Categoria <- factor(dataset_vendas$Categoria)

# Verificação dos tipos de dados - pós conversão
dplyr::glimpse(dataset_vendas)

# Gravação de arquivo CSV com dataset atualizado
write.csv(dataset_vendas, "./Datas/data_clean.csv", row.names = FALSE)

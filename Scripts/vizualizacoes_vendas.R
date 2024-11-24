# Parte 1: Criação de visualizações/gráficos, incluindo: um gráfico de linha mostrando a tendência de vendas ao longo do tempo, analisando os dados mensalmente; Identificação e descrição de pelo menos dois padrões ou insights interessantes nos dados
#
# Carregamento de arquivo com funções
source("./Scripts/funcoes.R")

# Instalação e carregamento de pacotes (utilizando uma função encapsulada em outro arquivo)
instalar_carregar("ggplot2")
instalar_carregar("lubridate")
instalar_carregar("dplyr")
instalar_carregar("scales")

# Carregamento do dataset limpo
dataset_vendas <- read.csv("./Datas/data_clean.csv")

# Conversão de dados
dataset_vendas$Produto <- factor(dataset_vendas$Produto)
dataset_vendas$Categoria <- factor(dataset_vendas$Categoria, levels = c("Infantil", "Juvenil", "Adulto")) # ordenação de categorias
dataset_vendas$Data <- as.Date(dataset_vendas$Data)



# DEFINIÇÃO DAS PERGUNTAS
# Qual o mês de maior e menor faturamento da loja?
# Qual o público alvo da loja?
# Qual o produto mais vendido da empresa?



# GRÁFICO I
# Agrupamento de vendas (quantidade * preço) por mês
vendas_mensais <- dataset_vendas %>%
  mutate(Mes = floor_date(Data, "month")) %>%
  group_by(Mes) %>%
  summarise(Vendas_Totais = sum(Quantidade * Preço))

# Criação de gráfico de linha mostrando a tendencia das vendas (Gráfico I)
grafico1 <- ggplot(vendas_mensais, aes(x = Mes, y = Vendas_Totais)) +
  geom_line(color = "blue") +
  geom_point(color = "darkblue") +
  scale_y_continuous(labels = dollar_format(prefiz = "R$", big.mark = ".", decimal.mark = ",")) +
  scale_x_date(
    date_breaks = "1 month",
    date_labels = "%b %Y"
  ) +
  labs(
    title = "Gráfico I: Tendência Mensal das Vendas",
    x = "Mês",
    y = "Vendas Totais (R$)"
  ) +
  theme_minimal(base_size = 10) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.title = element_text(hjust = 0.5, face = "bold"),
    panel.background = element_rect(fill = "white", color = "white"),
    plot.background = element_rect(fill = "white", color = "white")
  )
# Através do gráfico I podemos verificar uma queda nas vendas nos meses subsequentes a junho (julho, agosto, setembro). Tendo em julho seu menor faturamento. Em primeira análise poderiamos acreditar que esse seria o motivo da loja ter feito uma promoção para o mês de outubro, que, consequentemente, foi o mês com maior faturamento da loja.



# GRÁFICO II
# Cálculo de peças vendidas por categoria
total_vendas_por_categoria <- dataset_vendas %>%
  group_by(Categoria) %>%
  summarise(Quantidade_Total = sum(Quantidade))

# Criação de gráfico de barras mostrando quantidade de peças vendidas por categorias (Gráfico II)
grafico2 <- ggplot(total_vendas_por_categoria, aes(x = Categoria, y = Quantidade_Total, fill = Categoria)) +
  geom_bar(stat = "identity", show.legend = FALSE) +
  labs(
    title = "Gráfico II: Distribuição de Vendas por Categoria",
    x = "Categoria",
    y = "Quantidade de Peças"
  ) +
  theme_minimal(base_size = 10) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    panel.background = element_rect(fill = "white", color = "white"),
    plot.background = element_rect(fill = "white", color = "white")
  )
# Através do gráfico II verificamos que o público infantil é o público alvo da loja. Isso também se confirma com a diminuição gradativa das barras entre as categorias. Poderiamos acreditar que a medida que crescem, os clientes deixam de comprar na loja.



# GRÁFICO III
# Cálculo de peças vendidas por Produtos
total_vendas_por_produto <- dataset_vendas %>%
  group_by(Produto) %>%
  summarise(Quantidade_Total = sum(Quantidade))

# Criação de gráfico de barras mostrando quantidade de peças vendidas por produto (Gráfico III)
grafico3 <- ggplot(total_vendas_por_produto, aes(x = Produto, y = Quantidade_Total, fill = Produto)) +
  geom_bar(stat = "identity", show.legend = FALSE) +
  labs(
    title = "Gráfico III: Produtos Mais Vendidos (Quantidade)",
    x = "Produto",
    y = "Quantidade de Peças"
  ) +
  theme_minimal(base_size = 10) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    panel.background = element_rect(fill = "white", color = "white"),
    plot.background = element_rect(fill = "white", color = "white")
  )
# No gráfico III vemos que Calça é o produto mais vendido da loja e Camiseta o menos vendido.



# GRÁFICO IV
# Cálculo de vendas por categoria e produto
total_vendas_por_categoria_produto <- dataset_vendas %>%
  group_by(Categoria, Produto) %>%
  summarise(Quantidade_Total = sum(Quantidade))

# Criação de um gráfico de barras mostrando quantidade de peças vendidas por categorias e produtos (Gráfico IV)
grafico4 <- ggplot(total_vendas_por_categoria_produto, aes(x = Categoria, y = Quantidade_Total, fill = Produto)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(
    title = "Gráfico IV: Distribuição de Vendas por Categoria e Produto",
    x = "Categoria",
    y = "Quantidade de Peças"
  ) +
  theme_minimal(base_size = 10) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    panel.background = element_rect(fill = "white", color = "white"),
    plot.background = element_rect(fill = "white", color = "white")
  )
# Na visualização do gráfico IV, vemos que Calça-Infantil é o produto mais vendido da loja e Camiseta-Adulto é o produto menos vendido. Como esperado, o produto mais vendido é tambem da categoria mais vendida e o produto menos vendido é da categoria menos vendida.



# GRÁFICO V

# Agrupando as vendas por mês e categoria
vendas_mensais_por_categoria <- dataset_vendas %>%
  mutate(Mes = floor_date(Data, "month")) %>%
  group_by(Mes, Categoria) %>%
  summarise(Quantidade_Total = sum(Quantidade), .groups = "drop")

# Criando gráfico de barras empilhadas com a quantidade no eixo Y e o mês no eixo X - Gráfico V
grafico5 <- ggplot(vendas_mensais_por_categoria, aes(x = Mes, y = Quantidade_Total, fill = Categoria)) +
  geom_bar(stat = "identity", position = "stack") + # Empilhamento
  labs(
    title = "Gráfico V: Distribuição de Quantidade de Peças Vendidas por Mês",
    x = "Mês",
    y = "Quantidade de Peças Vendidas"
  ) +
  scale_x_date(date_breaks = "1 month", date_labels = "%b %Y") +
  theme_minimal(base_size = 10) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.title = element_text(hjust = 0.5, face = "bold"),
    panel.background = element_rect(fill = "white", color = "white"),
    plot.background = element_rect(fill = "white", color = "white")
  )
# No gráfico V temos a perspectiva geral das peças vendidas pela loja, separadas por mês e categoria. E podemos verificar que a categoria Adulto não foi vendida nos meses de setembro e novembro.


# Salvando os gráficos criados em arquivos PNG
ggsave(filename = "./Datas/grafico1.png", plot = grafico1)
ggsave(filename = "./Datas/grafico2.png", plot = grafico2)
ggsave(filename = "./Datas/grafico3.png", plot = grafico3)
ggsave(filename = "./Datas/grafico4.png", plot = grafico4)
ggsave(filename = "./Datas/grafico5.png", plot = grafico5)

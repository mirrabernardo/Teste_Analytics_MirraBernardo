# Teste para Estagiário de Analytics

*Este é um projeto teste para a vaga de estágio em Analytics da Empresa Quod.*

## Dependências

Este projeto foi desenvolvido utilizando o **renv** para gerenciamento de pacotes, garantindo que todas as dependências necessárias para a execução do código sejam instaladas e configuradas automaticamente.

O arquivo `renv.lock` contém as versões exatas dos pacotes utilizados no projeto e o comando `renv::restore()` já foi adicionado ao script principal para instalar e restaurar as dependências.

> É necessário que se tenha o **R** e o **RStudio** instalado na maquina.

## Estrutura do Repositório

-   `Scripts/`: Contém os scripts em R e SQL para criação, limpeza, análise e consulta de dados.
-   `Datas/`: Contém os arquivos de dados resultantes dos scripts.
-   `Docs/`: Contém os arquivos de texto, incluindo o relatório final.
-   `README.md`: Este arquivo de documentação.

*demais arquivos são arquivos de configuração, devem ser baixados juntamente com o projeto.*

## Solicitações do Projeto

### Parte 1 - Programação em R

-   Criação de um script para simular um dataset de vendas com pelo menos 50 registros, contendo as colunas: ID, Data, Produto, Categoria, Quantidade, Preço. Com período dos dados de 01/01/2023 a 31/12/2023.
-   Limpeza dos dados, incluindo: Tratamento de valores faltantes; Remoção de duplicatas; Conversão de tipos de dados, se necessário.
-   Criação de um arquivo com o dataset limpo nomeado *data_clean.csv*.
-   Análise do dataset limpo, incluindo: Cálculo do total de vendas (Quantidade \* Preço) por produto; Identificação do produto com o maior número de vendas totais.
-   Criação de visualizações/gráficos, incluindo: um gráfico de linha mostrando a tendência de vendas ao longo do tempo, analisando os dados mensalmente; Identificação e descrição de pelo menos dois padrões ou insights interessantes nos dados.

### Parte 2 - SQL

-   Escrever consultas SQL para listar o nome do produto, categoria e a soma total de vendas (Quantidade \* Preço) para cada produto. Ordenar o resultado pelo valor total de vendas em ordem decrescente.
-   Identificar os produtos que menos venderam no mês de junho de 2024 *(porém, os dados são do ano de 2023, então utilizarei como referência junho de 2023)*.

### Parte 3 - Interpretação de Resultados

-   Escrever um breve relatório (máximo de 300 palavras) com base nas análises realizadas nas Partes 1 e 2, resumindo os principais insights encontrados e sugerindo possíveis ações baseadas nesses insights.

## IMPORTANTE!

> ***Como os dados foram criados de maneira aleatória a partir de um script, um contexto foi criado para tornar mais interessante a etapa de tratamento de dados, visto que não haveriam erros para serem corrigidos.***

## Instruções de Uso

1.  Clone ou baixe este repositório.
2.  Abra o arquivo `Teste_Analytics_MirraBernardo.Rproj`.
3.  O RStudio irá abrir na pasta do projeto.
4.  Na janela inferior do canto direito, clique em:

-   **`Scripts/` para execução de scripts.**\
    `criacao_dataset.R`: script de criação do dataset.\
    `funcoes.R`: arquivo de funções utilizadas nos scripts.\
    `tratamento_vendas.R`: script para tratamento e limpeza do dataset.\
    `analise_vendas.R`: script para a análise dos dados.\
    `vizualizacoes_vendas.R`: script para criação de vizualização/gráficos sobre os dados.\
    `consultas_vendas.R`: script com consultas em SQL.\
    `consultas_sql.sql`: consultas em SQL para análise dos dados.

ou

-   **`Datas/`** **para leitura de dados.**\
    `dataset_vendas.csv`: dataset criado, sem tratamento e/ou limpeza.\
    `data_clean.csv`: dataset tratado e limpo.\
    `grafico1.png`: gráfico I.\
    `grafico2.png`: gráfico II.\
    `grafico3.png`: gráfico III.\
    `grafico4.png`: gráfico IV.\
    `grafico5.png`: gráfico V.

ou

-   **`Docs/`** **para leitura de documentos.\
    **`contexto.md`: contexto (situação-problema) criado sobre os dados.\
    `relatorio_insights.md`: relatório final.\
    `relatorio.md`: relatório completo.

## Contato

Se houver dúvidas, envie um e-mail para [mirrabernardo\@outlook.com](mailto:mirrabernardo@outlook.com){.email}

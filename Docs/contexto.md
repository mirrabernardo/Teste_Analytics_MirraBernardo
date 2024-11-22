# Contexto da Situação-Problema

> *Como os dados foram criados de maneira aleatória a partir de um script, um contexto foi criado para tornar mais interessante a etapa de tratamento de dados, visto que não haveriam erros para serem corrigidos.*

Os dados apresentados neste projeto são da empresa **Exemplo Modas**.

Foram coletados dados referente as vendas de *Produtos* do período de *01/01/2023 a 31/12/2023.* A empresa vende quatro tipos produtos (camiseta, calça, calçado e camisa) que são classificados em três diferentes *categorias* (infantil, juvenil e adulto). Sua tabela de *preço* varia de R\$50,00 a R\$200,00. Cada venda, está identicada por um *ID* único. A *quantidade* de produtos por venda varia de um a cinco.

Durante a coleta de dados, um erro foi verificado.

No mês de **outubro** (devido ao dia das crianças), a empresa lançou uma promoção em que qualquer **peça infantil** custaria **R\$50,00**. Porém, os dados não estão de acordo com o fato.

Antes da análise é necessário que haja o devido tratamento no dataset para que o mesmo possa apresentar dados consistentes e confiáveis sobre as vendas realizadas. Isso envolve corrigir o preço de todos os itens da categoria "Infantil" vendidos em outubro para que estejam de acordo com a promoção (R\$50,00 por peça), além de realizar uma verificação geral para identificar e tratar possíveis inconsistências, como duplicatas, valores faltantes e tipos de dados incorretos.

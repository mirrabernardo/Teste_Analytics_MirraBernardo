
-- Consulta para listar produto, categoria e soma total de vendas (Quantidade * Preço) para cada produto. Ordenando pelo valor total de vendas em ordem decrescente.
SELECT
  Produto, Categoria, SUM(Quantidade * Preço) AS Total_Vendas
FROM
  dataset_vendas
GROUP BY
  Produto, Categoria
ORDER BY
  Total_Vendas DESC


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


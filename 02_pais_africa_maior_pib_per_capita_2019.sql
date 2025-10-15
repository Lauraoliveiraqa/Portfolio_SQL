-- 🔹 Questão 2 — País da África com o maior PIB per capita em 2019
-- Identificar qual país africano apresentou o maior PIB per capita no ano de 2019.

-- 🔹 Lógica da solução
-- Esta consulta utiliza uma subquery (subconsulta) para descobrir qual é o maior valor de PIB per capita (gdp_pc)
-- entre todos os países da África em 2019.
-- Em seguida, a query principal busca o nome do país que possui exatamente esse valor máximo.
-- O JOIN entre as tabelas "gdp_pc" e "country" permite relacionar o código do país com sua respectiva região.
-- Assim, conseguimos tanto o valor máximo quanto o país que o atingiu, filtrando apenas a região 'África'.

-- 🔹 Consulta SQL
SELECT gp.country
FROM gdp_pc gp
JOIN country c ON gp.country = c.country
WHERE gp.ref_year = 2019
  AND c.four_regions = 'africa'
  AND gp.gdp_pc = (
    SELECT MAX(gp2.gdp_pc)
    FROM gdp_pc gp2
    JOIN country c2 ON gp2.country = c2.country
    WHERE gp2.ref_year = 2019
      AND c2.four_regions = 'africa'
  );

-- 🔹 Interpretação
-- O resultado mostra qual país da África teve o maior PIB per capita em 2019.
-- Esse tipo de análise é útil para entender disparidades econômicas dentro de um continente
-- e pode ser usado como base para comparações regionais ou estudos sobre desenvolvimento econômico.

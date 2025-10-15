-- 🔹 Questão 1 — País da África com maior PIB per capita em 2019
-- Calcular qual país do continente africano apresentou o maior PIB per capita no ano de 2019.

-- 🔹 Lógica da solução
-- A consulta usa a função MAX() para encontrar o maior valor de PIB per capita (gdp_pc) em 2019.
-- O JOIN entre as tabelas "gdp_pc" e "country" garante que possamos acessar a região de cada país.
-- O filtro WHERE limita os resultados ao ano de 2019 e à região "África".
-- Assim, obtemos o valor máximo do PIB per capita entre todos os países africanos naquele ano.

-- 🔹 Consulta SQL
SELECT MAX(gp2.gdp_pc)
FROM gdp_pc gp2
JOIN country c2 ON gp2.country = c2.country
WHERE gp2.ref_year = 2019
  AND c2.four_regions = 'africa';

-- 🔹 Interpretação
-- Este resultado mostra qual foi o maior PIB per capita registrado entre os países africanos em 2019.
-- É uma forma simples de identificar a economia mais forte do continente naquele período,
-- permitindo comparações entre regiões ou acompanhamentos ao longo dos anos.

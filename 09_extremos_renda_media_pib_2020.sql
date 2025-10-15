-- 🔹 Questão 9 — Países com maior e menor renda média por habitante em 2020
-- Listar os países com maior e menor renda média por habitante, junto com o PIB per capita, no ano de 2020.

-- 🔹 Lógica da solução
-- A consulta combina duas partes usando UNION ALL:
-- 1. Seleciona o país com maior renda média (MAX(mean_usd)) em 2020.
-- 2. Seleciona o país com menor renda média (MIN(mean_usd)) em 2020.
-- O JOIN com 'gdp_pc' garante que cada país tenha seu PIB per capita associado.
--
-- Essa abordagem destaca os extremos de renda global e permite comparar PIB e renda média por habitante.

-- 🔹 Consulta SQL
SELECT pib.country,
       pib.gdp_pc,
       ren.mean_usd
FROM gdp_pc pib
JOIN avg_income ren ON pib.country = ren.country AND pib.ref_year = ren.ref_year
WHERE pib.ref_year = '2020'
  AND ren.mean_usd = (
    SELECT MAX(ren2.mean_usd)
    FROM avg_income ren2
    WHERE ren2.ref_year = '2020'
  )
UNION ALL
SELECT pib1.country,
       pib1.gdp_pc, 
       ren1.mean_usd
FROM avg_income ren1
JOIN gdp_pc pib1 ON ren1.country = pib1.country AND ren1.ref_year = pib1.ref_year
WHERE ren1.ref_year = '2020'
  AND ren1.mean_usd = (
    SELECT MIN(ren3.mean_usd)
    FROM avg_income ren3
    WHERE ren3.ref_year = '2020'
  );

-- 🔹 Interpretação
-- O resultado retorna duas linhas: o país mais rico e o país mais pobre em termos de renda média per capita.
-- Permite visualizar desigualdades econômicas e comparar o PIB per capita com a renda média individual,
-- oferecendo insights para análises econômicas e políticas públicas.

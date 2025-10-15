-- 🔹 Questão 7 — Média de mortalidade infantil e PIB per capita por região em 2020
-- Calcular a média de mortalidade infantil e a média do PIB per capita para cada região do Banco Mundial no ano de 2020.

-- 🔹 Lógica da solução
-- Esta consulta fornece uma visão agregada da saúde infantil e da economia regional:
-- 1. As tabelas 'child_mortality' e 'gdp_pc' são unidas pelo país e ano,
--    garantindo que cada país tenha dados completos de mortalidade e PIB.
-- 2. Agrupamos por região para calcular médias regionais com AVG().
-- 3. ROUND() é usado para deixar os valores mais legíveis, com duas casas decimais.
-- 4. O ORDER BY organiza as regiões da maior para a menor mortalidade infantil,
--    facilitando a comparação entre regiões.

-- 🔹 Consulta SQL
SELECT ROUND(AVG(cm.tot_deaths), 2) AS media_mort,
       ROUND(AVG(pib.gdp_pc), 2) AS media_pib,
       c.wb_regions
FROM child_mortality cm
JOIN gdp_pc pib ON cm.country = pib.country AND cm.ref_year = pib.ref_year
JOIN country c ON cm.country = c.country
WHERE cm.ref_year = '2020'
GROUP BY c.wb_regions
ORDER BY media_mort DESC;

-- 🔹 Interpretação
-- O resultado mostra a média de mortes infantis e PIB per capita por região em 2020.
-- Ajuda a identificar regiões com maiores desafios em saúde e correlacionar essas informações
-- com o desempenho econômico, fornecendo base para análises de desenvolvimento humano.

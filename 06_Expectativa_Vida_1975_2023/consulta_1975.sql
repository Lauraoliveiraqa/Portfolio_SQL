-- 🔹 Questão 6 — Países com maior expectativa de vida em 1975 por região
-- Identificar, para cada região do Banco Mundial, o país que apresentava a maior expectativa de vida em 1975.

-- 🔹 Lógica da solução
-- O objetivo desta consulta é destacar os países com melhor desempenho em longevidade por região,
-- considerando o ano de 1975.
--
-- A solução utiliza uma subquery correlacionada:
-- 1. Para cada país, verificamos se sua expectativa de vida (tot_years) é igual
--    ao valor máximo registrado na sua respectiva região.
-- 2. O JOIN entre as tabelas 'country' e 'life_expectancy' garante que tenhamos
--    tanto o nome do país quanto sua região, junto com a expectativa de vida.
--
-- Essa abordagem permite que cada região retorne apenas o país "líder" em expectativa de vida.

-- 🔹 Consulta SQL
SELECT c.country,
       c.wb_regions,
       le.tot_years
FROM country c
JOIN life_expectancy le ON c.country = le.country
WHERE le.ref_year = '1975'
  AND le.tot_years = (
    SELECT MAX(le2.tot_years)
    FROM life_expectancy le2
    JOIN country c2 ON le2.country = c2.country
    WHERE le2.ref_year = '1975'
      AND c2.wb_regions = c.wb_regions
  );

-- 🔹 Interpretação
-- O resultado apresenta um país para cada região que possuía a maior expectativa de vida em 1975.
-- Permite analisar padrões de longevidade e comparar regiões historicamente,
-- mostrando onde a população tinha melhores condições de saúde e qualidade de vida.

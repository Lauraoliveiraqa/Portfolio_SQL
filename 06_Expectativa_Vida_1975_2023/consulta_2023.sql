-- 🔹 Questão 6 — Países com maior expectativa de vida em 2023 por região
-- Identificar, para cada região do Banco Mundial, o país que apresentava a maior expectativa de vida em 2023.

-- 🔹 Lógica da solução
-- O objetivo desta consulta é atualizar a análise feita para 1975,
-- comparando agora o cenário moderno e identificando quais países
-- lideram em expectativa de vida em cada região do Banco Mundial.
--
-- A consulta usa uma subquery correlacionada:
-- 1. Para cada país, verifica se sua expectativa de vida (tot_years) é igual
--    ao valor máximo registrado na respectiva região em 2023.
-- 2. O JOIN entre as tabelas 'country' e 'life_expectancy' permite exibir
--    o nome do país, sua região e o valor da expectativa de vida.
--
-- Essa abordagem retorna um país "líder" por região, permitindo comparações
-- diretas com os dados de 1975 (consulta anterior).

-- 🔹 Consulta SQL
SELECT 
    c.country, 
    c.wb_regions,
    le.tot_years  
FROM country c
JOIN life_expectancy le 
    ON c.country = le.country 
WHERE le.ref_year = '2023'
  AND le.tot_years = (
        SELECT MAX(le2.tot_years)
        FROM life_expectancy le2 
        JOIN country c2 ON le2.country = c2.country 
        WHERE le2.ref_year = '2023'
          AND c2.wb_regions = c.wb_regions
    )
ORDER BY le.tot_years DESC
LIMIT 7;

-- 🔹 Interpretação
-- O resultado apresenta o país com maior expectativa de vida em 2023 para cada região.
-- A comparação com 1975 evidencia avanços significativos na saúde global,
-- com aumento médio de cerca de 10 anos na expectativa de vida.

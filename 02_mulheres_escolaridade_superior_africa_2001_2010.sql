-- 🔹 Questão 2 — Países da África onde as mulheres têm pelo menos um ano a mais de escolaridade que os homens (2001–2010)
-- Identificar os países africanos em que as mulheres estudaram, em média, pelo menos um ano a mais que os homens,
-- durante o período de 2001 a 2010, apresentando apenas o nome dos países, sem repetições.

-- 🔹 Lógica da solução
-- A consulta compara a média de anos de escolaridade entre homens e mulheres em cada país e ano.
-- As tabelas "men_years_at_school" e "women_years_at_school" são unidas (JOIN) com base no país e no ano de referência (ref_year),
-- garantindo que a comparação ocorra dentro do mesmo contexto temporal.
-- O JOIN com a tabela "country" é usado para restringir a análise apenas aos países da região "África".
--
-- A condição "w.mean_years - m.mean_years >= 1" identifica os casos em que as mulheres estudaram pelo menos
-- um ano a mais que os homens.
-- O operador BETWEEN limita o período de análise de 2001 a 2010.
-- O uso de DISTINCT assegura que cada país apareça apenas uma vez, mesmo que a condição ocorra em vários anos.

-- 🔹 Consulta SQL
SELECT DISTINCT m.country
FROM men_years_at_school m
JOIN women_years_at_school w ON m.country = w.country 
  AND m.ref_year = w.ref_year
JOIN country c ON m.country = c.country 
WHERE c.four_regions = 'africa'
  AND w.mean_years - m.mean_years >= 1
  AND w.ref_year BETWEEN 2001 AND 2010;

-- 🔹 Interpretação
-- O resultado lista os países africanos em que, entre 2001 e 2010,
-- as mulheres apresentaram uma média de escolaridade superior à dos homens por pelo menos um ano.
-- Essa análise ajuda a identificar avanços na educação feminina e pode indicar políticas públicas eficazes
-- voltadas à igualdade de gênero na educação.
-- Também pode revelar padrões regionais, mostrando países onde o acesso das mulheres à educação evoluiu mais rapidamente.


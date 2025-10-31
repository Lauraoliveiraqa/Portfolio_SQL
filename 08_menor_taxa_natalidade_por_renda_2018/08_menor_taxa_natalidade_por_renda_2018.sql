-- 🔹 Questão 8 — País com menor taxa de natalidade por classificação de renda em 2018
-- Identificar, para cada classificação de renda do Banco Mundial (alta, média, baixa),
-- o país com a menor taxa de natalidade em 2018.

-- 🔹 Lógica da solução
-- A consulta utiliza:
-- 1. JOIN entre 'fertility' e 'country' para acessar a classificação de renda (wb3income) de cada país.
-- 2. Filtragem pelo ano de referência 2018.
-- 3. Função MIN() para determinar a menor taxa de nascimentos médias dentro de cada grupo de renda.
-- 4. GROUP BY wb3income para garantir um país por classificação de renda.

-- 🔹 Consulta SQL
WITH mins AS (
  SELECT
    c.wb3income,
    MIN(f.mean_babies) AS menor_taxa
  FROM fertility f
  JOIN country c ON c.country = f.country
  WHERE f.ref_year = 2018
  GROUP BY c.wb3income
)
SELECT
  m.wb3income,
  f.country,
  f.mean_babies AS menor_taxa
FROM mins m
JOIN fertility f
  ON f.mean_babies = m.menor_taxa
JOIN country c
  ON c.country = f.country
 AND c.wb3income = m.wb3income
WHERE f.ref_year = 2018
ORDER BY menor_taxa;

-- 🔹 Interpretação
-- O resultado apresenta, para cada nível de renda, o país com menor taxa de natalidade.
-- Permite analisar diferenças demográficas entre países ricos, médios e pobres,
-- fornecendo insights sobre planejamento familiar e desenvolvimento social.

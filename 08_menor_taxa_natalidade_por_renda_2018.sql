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
SELECT MIN(f.mean_babies) AS menor_taxa,
       c.wb3income,
       f.country
FROM fertility f
JOIN country c ON f.country = c.country
WHERE f.ref_year = '2018'
GROUP BY c.wb3income
ORDER BY f.mean_babies;

-- 🔹 Interpretação
-- O resultado apresenta, para cada nível de renda, o país com menor taxa de natalidade.
-- Permite analisar diferenças demográficas entre países ricos, médios e pobres,
-- fornecendo insights sobre planejamento familiar e desenvolvimento social.

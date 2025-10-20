-- 🔹 Questão 4 — Emissão média per capita de CO₂ na América Latina e Caribe (2008 a 2010)
-- Calcular a emissão média per capita de CO₂, em toneladas, dos países da América Latina e Caribe
-- no período de 2008 a 2010, arredondando os valores para duas casas decimais.

-- 🔹 Lógica da solução
-- A consulta utiliza a função AVG() para calcular a média das emissões per capita de CO₂ (co2_pc)
-- para cada ano entre 2008 e 2010.
-- A função ROUND() é aplicada para arredondar o resultado a duas casas decimais,
-- tornando a apresentação mais clara e padronizada.
-- O INNER JOIN conecta a tabela de emissões de CO₂ ("co2_emissions_pc") à tabela de países ("country"),
-- permitindo filtrar apenas os países classificados pelo Banco Mundial como pertencentes à região
-- "Latin America & Caribbean".
-- Por fim, o GROUP BY agrupa os resultados por ano (ref_year) e região, 
-- garantindo que a média seja calculada separadamente para cada período.

-- 🔹 Consulta SQL
SELECT cep.ref_year,
       ROUND(AVG(cep.co2_pc), 2) AS media_co2,
       c.wb_regions
FROM co2_emissions_pc cep
INNER JOIN country c ON cep.country = c.country
WHERE cep.ref_year IN (2008, 2009, 2010)
  AND c.wb_regions = "Latin America & Caribbean"
GROUP BY cep.ref_year, c.wb_regions;

-- 🔹 Interpretação
-- O resultado exibe a média das emissões per capita de CO₂ na América Latina e Caribe para cada ano do período 2008–2010.
-- Essa análise permite observar se houve aumento ou redução na emissão média por habitante ao longo desses anos.
-- É uma métrica importante para avaliar o impacto ambiental e o ritmo de desenvolvimento sustentável da região,
-- podendo servir de base para estudos sobre políticas climáticas e econômicas.

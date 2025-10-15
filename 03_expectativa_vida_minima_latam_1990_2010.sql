-- 🔹 Questão 3 — Expectativa de vida mínima na América Latina e Caribe (1990 e 2010)
-- Calcular a menor expectativa de vida na América Latina e no Caribe em 1990 e identificar o país correspondente.
-- Em seguida, repetir a análise para 2010 e verificar se o país com o menor índice permanece o mesmo.

-- 🔹 Parte A — Ano de 1990

-- 🔸 Lógica da solução
-- Primeiro, foi calculada a expectativa de vida mínima (MIN) dos países da América Latina e Caribe em 1990,
-- utilizando uma subconsulta para encontrar o menor valor de "tot_years" na tabela "life_expectancy".
-- Em seguida, a consulta principal busca o nome do país que possui exatamente essa menor expectativa de vida.
-- O JOIN com a tabela "country" permite relacionar o país à sua região ("wb_regions"),
-- filtrando apenas os países pertencentes à América Latina e Caribe.

-- 🔸 Consulta SQL
SELECT le.country,
       le.tot_years
FROM life_expectancy le
JOIN country c ON le.country = c.country
WHERE le.ref_year = 1990
  AND c.wb_regions = 'Latin America & Caribbean'
  AND le.tot_years = (
    SELECT MIN(le2.tot_years)
    FROM life_expectancy le2
    JOIN country c2 ON le2.country = c2.country
    WHERE le2.ref_year = 1990
      AND c2.wb_regions = 'Latin America & Caribbean'
  );

-- 🔸 Interpretação
-- O resultado mostra o país da América Latina e Caribe que apresentou a menor expectativa de vida em 1990.
-- Esse tipo de análise ajuda a identificar desigualdades regionais e possíveis desafios sociais e sanitários.
-- Observando o valor, é possível perceber como certos países enfrentavam condições mais precárias de saúde
-- e infraestrutura durante esse período.

-------------------------------------------------------------

-- 🔹 Parte B — Ano de 2010

-- 🔸 Lógica da solução
-- A estrutura da consulta é a mesma da Parte A, mudando apenas o ano de referência para 2010.
-- Assim, é possível comparar a evolução da expectativa de vida mínima entre 1990 e 2010.
-- Essa comparação permite verificar se o país com a menor média permaneceu o mesmo
-- e analisar se houve alguma queda ou melhora significativa no indicador.

-- 🔸 Consulta SQL
SELECT le.country,
       le.tot_years
FROM life_expectancy le
JOIN country c ON le.country = c.country
WHERE le.ref_year = 2010
  AND c.wb_regions = 'Latin America & Caribbean'
  AND le.tot_years = (
    SELECT MIN(le2.tot_years)
    FROM life_expectancy le2
    JOIN country c2 ON le2.country = c2.country
    WHERE le2.ref_year = 2010
      AND c2.wb_regions = 'Latin America & Caribbean'
  );

-- 🔸 Interpretação
-- O resultado mostra o país com a menor expectativa de vida em 2010.
-- Comparando com 1990, podemos observar se houve melhora ou se o mesmo país manteve-se na posição mais baixa.
-- Caso tenha ocorrido queda na expectativa de vida, isso pode estar relacionado a crises sociais,
-- epidemias, conflitos internos ou falhas nos sistemas de saúde locais.
-- Essa análise temporal é valiosa para compreender o progresso (ou retrocesso) em qualidade de vida na região.

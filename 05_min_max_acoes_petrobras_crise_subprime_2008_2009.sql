-- 🔹 Questão 5 — Valores mínimo e máximo das ações da Petrobras após o início da crise do Subprime (2008–2009)
-- Encontrar as datas e os valores mínimo e máximo de fechamento das ações da Petrobras (NYSE)
-- entre 15 de setembro de 2008 (início da crise do Subprime) e 31 de dezembro de 2009.

-- 🔹 Lógica da solução
-- O objetivo desta consulta é identificar os pontos extremos de valorização e desvalorização
-- das ações da Petrobras no período imediatamente posterior à falência do Lehman Brothers,
-- evento que desencadeou a crise financeira global de 2008.
--
-- A solução utiliza duas subconsultas aninhadas:
-- 1. A primeira subquery encontra o menor valor de fechamento (MIN(close)) no período.
-- 2. A segunda subquery encontra o maior valor de fechamento (MAX(close)) no mesmo intervalo.
-- 
-- O operador UNION ALL é usado para combinar os dois resultados — o mínimo e o máximo —
-- em uma única visualização, preservando ambas as linhas no resultado final.
-- A função ROUND() arredonda os valores de fechamento para duas casas decimais,
-- garantindo uma apresentação mais limpa e consistente.

-- 🔹 Consulta SQL
SELECT Date,
       ROUND(close, 2) AS VALOR
FROM petrobras
WHERE Date BETWEEN '2008-09-15' AND '2009-12-31'
  AND close = (
    SELECT MIN(close)
    FROM petrobras
    WHERE Date BETWEEN '2008-09-15' AND '2009-12-31'
  )
UNION ALL
SELECT p.Date,
       ROUND(p.close, 2) AS VALOR
FROM petrobras p
WHERE Date BETWEEN '2008-09-15' AND '2009-12-31'
  AND close = (
    SELECT MAX(p.close)
    FROM petrobras p
    WHERE Date BETWEEN '2008-09-15' AND '2009-12-31'
  );

-- 🔹 Interpretação
-- O resultado retorna duas linhas: uma com o menor valor de fechamento e outra com o maior valor,
-- além das respectivas datas em que esses valores ocorreram.
-- Essa análise permite observar a volatilidade das ações da Petrobras durante um dos períodos
-- econômicos mais instáveis da história recente.
-- O valor mínimo reflete o impacto direto da crise financeira global,
-- enquanto o valor máximo mostra o momento de recuperação parcial do mercado até o final de 2009.
-- É uma consulta que combina contexto histórico com análise financeira de dados reais.

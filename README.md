<h2> 📊 Portfolio de Consultas SQL</h2>

 🎓 Visão Geral do Projeto

Este repositório contém uma coleção de 9 consultas SQL desenvolvidas para a conclusão do curso de **SQL  STRUCTURED QUERY LANGUAGE** da **FGV (Fundação Getúlio Vargas)**.

O objetivo é demonstrar proficiência na manipulação de dados econômicos e sociais globais, incluindo: PIB per capita, renda média, mortalidade infantil, e análise de dados financeiros.

---

<h3> 🛠️ Tecnologias e Ferramentas</h3>

* **SQLite**
* **DBeaver**
* **Linguagem:** SQL 

---
<h3>📂 Estrutura e Documentação das Queries</h3>

Cada consulta é um arquivo `.sql` que segue uma estrutura padronizada para facilitar a leitura e o entendimento da lógica:

1.  **Título e Descrição da Questão:** O problema de negócio ou desafio.
2.  **Lógica da Solução:** Explicação conceitual de como o SQL foi utilizado (e.g., "uso de `UNION ALL` para unir resultados extremos").
3.  **Consulta SQL:** O código completo.
4.  **Interpretação:** O insight ou valor que o resultado da query oferece.

### Exemplo de Consulta (Questão 9)

Este exemplo ilustra o uso de `UNION ALL` e subconsultas aninhadas para encontrar os extremos em uma única busca:

```sql
-- 🔹 Questão 9 — Países com maior e menor renda média por habitante em 2020

-- Lógica: Combinação de duas subconsultas no WHERE, unidas por UNION ALL.
SELECT pib.country, pib.gdp_pc, ren.mean_usd 
FROM gdp_pc pib
JOIN avg_income ren ON pib.country = ren.country AND pib.ref_year = ren.ref_year 
WHERE pib.ref_year = '2020'
  AND ren.mean_usd = (SELECT MAX(ren2.mean_usd) FROM avg_income ren2 WHERE ren2.ref_year = '2020') 
UNION ALL 
SELECT pib1.country, pib1.gdp_pc, ren1.mean_usd 
FROM avg_income ren1
JOIN gdp_pc pib1 ON ren1.country = pib1.country AND ren1.ref_year = pib1.ref_year
WHERE ren1.ref_year = '2020'
  AND ren1.mean_usd = (SELECT MIN(ren3.mean_usd) FROM avg_income ren3 WHERE ren3.ref_year = '2020');
```
---

## 📈 Dashboards e Visualizações

Além das consultas SQL, este portfólio inclui projetos complementares desenvolvidos no **Power BI**, utilizando dados e resultados obtidos a partir das queries originais.

🔹 **06 — Expectativa de Vida Global (1975 × 2023)**  
Análise comparativa entre 1975 e 2023, identificando os países líderes em expectativa de vida em cada região do Banco Mundial.  
Projeto desenvolvido com base na consulta `06_maior_expectativa_vida_por_regiao_1975.sql`, expandido para visualização analítica.  
📄 [Acessar Dashboard (PDF)](./06_expectativa_vida_dashboard_1975_2023/dashboard_vida_global.pdf)  
📘 [Ver Detalhes do Projeto](./06_expectativa_vida_dashboard_1975_2023/README.md)

---

## 🧭 Organização

Cada diretório dentro deste repositório contém:
- O arquivo `.sql` com a consulta;
- Comentários explicando a lógica e interpretação;
- (Quando aplicável) o dashboard correspondente desenvolvido em Power BI.

---

## ✍️ Autoria
Repositório mantido por ### Laura Oliveira  
📂 GitHub: [@Lauraoliveiraqa](https://github.com/Lauraoliveiraqa)

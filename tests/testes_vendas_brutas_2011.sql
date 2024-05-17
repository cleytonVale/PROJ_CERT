-- tests/test_vendas_brutas_2011.sql

WITH vendas_2011 AS (
    SELECT 
       trunc(sum(valor_total_negociado), 2) AS vendas_brutas_2011
     FROM {{ ref('fact_vendas') }}
    WHERE ano_data_da_venda = 2011
)

SELECT 
    'VALOR CORRETO' VALIDACAO
   , vendas_brutas_2011
FROM vendas_2011
WHERE vendas_brutas_2011 = 12646112.16

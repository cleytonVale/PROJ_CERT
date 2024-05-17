-- models/dimensions/dim_produto.sql

WITH produtos AS (
    SELECT
    pk_prod
        ,nm_prod
        ,cod_identifica_prod
        ,cor_produto
        ,dias_prod_produto
        ,data_descontinua_prod
        ,preco_venda
  FROM {{ ref('stg_sap__produtos') }}
)

,detalhes_pedidos as (
    select
    fk_pedido_venda
        ,fk_detalhe_ordem_venda
        ,fk_produto
        ,qtd_item_vendido as quantidade_comprada
        ,cod_promocional
        ,preco_unitario
        ,desconto_por_preco_unitario

        -- ... outros campos da tabela original
  from {{ ref('stg_sap__detalhes_pedidos') }}
)

, dim_produtos as (
   select
    produtos.pk_prod
         ,produtos.nm_prod
         ,produtos.cod_identifica_prod
         ,produtos.cor_produto
         ,produtos.dias_prod_produto
         ,produtos.data_descontinua_prod
         ,produtos.preco_venda

        ,detalhes_pedidos.fk_pedido_venda
        ,detalhes_pedidos.fk_detalhe_ordem_venda
        ,detalhes_pedidos.quantidade_comprada --metric
        ,detalhes_pedidos.cod_promocional
        ,detalhes_pedidos.preco_unitario -- metric
        ,detalhes_pedidos.desconto_por_preco_unitario -- metric

from produtos
 join detalhes_pedidos on produtos.pk_prod = detalhes_pedidos.fk_produto
     

)

SELECT
    *
FROM 
dim_produtos

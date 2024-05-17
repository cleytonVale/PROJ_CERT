-- models/staging/stg_detalhes_pedidos.sql

with detalhes_pedidos as (
    select
        cast(SalesOrderID       as string) as fk_pedido_venda
        ,cast(SALESORDERDETAILID       as string) as fk_detalhe_ordem_venda
        ,cast(ProductID         as string) as fk_produto
        ,cast(OrderQty          as string) as qtd_item_vendido
        ,cast(SpecialOfferID    as string) as cod_promocional
        ,cast(UnitPrice         as string) as preco_unitario
        ,cast(UnitPriceDiscount as string) as desconto_por_preco_unitario

        -- ... outros campos da tabela original
 from {{ source('sap', 'SalesOrderDetail') }} -- Substitua com o schema e tabela corretos -- xxxxxxxxxxxxxxxxx
)

select
  *
from 
detalhes_pedidos

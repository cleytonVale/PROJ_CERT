
WITH order_header_pedido_vendas as (
        select
        cast(SalesOrderID             as string ) as pk_order_header_pedido_venda
        ,cast(SalesReasonID                  as string ) as fk_header_pedido_venda

from {{ source('sap', 'SalesOrderHeaderSalesReason') }} 



)

select 
* 
from
 order_header_pedido_vendas
 
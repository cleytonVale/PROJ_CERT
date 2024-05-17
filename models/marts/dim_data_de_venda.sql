WITH data_de_vendas AS (
    --SalesReason
    SELECT
    data_abertura_pedido as data_da_venda
           ,pk_header_pedido_venda
           ,obs_venda
           ,fk_cartao_credito
           ,pk_venda
           ,frete
           ,plataforma_pedido
           ,fk_pessoa
           ,Status_Pedido_venda
           ,subtotal
           ,imposto
           ,Total_devido_cliente
           ,fk_cod_endereco
    FROM {{ ref('stg_sap__header_pedido_vendas') }}
)

select
*
from 

data_de_vendas
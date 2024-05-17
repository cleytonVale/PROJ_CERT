
WITH header_pedido_vendas as (
        select
        
        cast(SALESORDERID             as string ) as pk_header_pedido_venda
        ,cast(COMMENT                  as string ) as obs_venda
        ,cast(CREDITCARDID             as string ) as fk_cartao_credito
        ,cast(CUSTOMERID               as string ) as pk_venda
        ,cast(FREIGHT                  as string ) as frete
        ,case when ONLINEORDERFLAG = '0' then 'Pedido feito por vendedor'
            when ONLINEORDERFLAG = '1' then 'Pedido feito online pelo cliente'
            else 'analisar' end plataforma_pedido
        ,cast(ORDERDATE                as date ) as  data_abertura_pedido
        ,cast(SALESPERSONID            as  string ) as fk_pessoa
        ,case when status = '1' then 'Em processamento'
            when status = '2' then 'Aprovado'
            when status = '3' then 'Pedido em espera'
            when status = '4' then 'Rejeitado'
            when status = '5' then 'Entregue'
            when status = '6' then 'cancelado'
                else 'Analisar' end Status_Pedido_venda
        ,cast(SUBTOTAL                 as  decimal) as subtotal
        ,cast(TAXAMT                   as  decimal) as imposto
        ,cast(TOTALDUE                 as  decimal) as Total_devido_cliente
        ,cast(BILLTOADDRESSID          as  string) as fk_cod_endereco
        

 from {{ source('sap', 'Salesorderheader') }} 



)

select 
*
from
 header_pedido_vendas

 
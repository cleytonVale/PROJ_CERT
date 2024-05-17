with Produtos as (
    select 
        cast(PRODUCTID  as string) as pk_prod
          ,cast(NAME as string) as  nm_prod
          ,cast(PRODUCTNUMBER as string) as cod_identifica_prod
          ,cast(COLOR as string) as cor_produto
          ,cast(DAYSTOMANUFACTURE as string) as dias_prod_produto 
          ,cast(DISCONTINUEDDATE as string) as  data_descontinua_prod
          ,cast(LISTPRICE as string) as preco_venda

           from {{ source('sap', 'Product') }} 
          
)

select 
* 
from
Produtos
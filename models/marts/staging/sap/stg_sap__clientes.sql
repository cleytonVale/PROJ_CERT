
with Clientes as (
    select
        CAST(CustomerID   as string) as pk_cliente
        ,CAST(PERSONID     AS string) AS fk_pessoa
        ,CAST(STOREID     AS string) AS fk_loja
        ,CAST(TERRITORYID     AS int) AS fk_cod_territorio
    
    from {{ source('sap', 'Customer') }} -- Substitua com o schema e tabela corretos
)

select
    *
from Clientes

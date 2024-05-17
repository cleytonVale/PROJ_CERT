-- models/staging/stg_localizacao.sql

with estado_localizacao as (
   select
        cast(STATEPROVINCEID          as string)      as pk_estado
        ,cast(STATEPROVINCECODE      AS string)    as cod_estado
        ,cast(COUNTRYREGIONCODE        as string)  as fk_pais
        ,cast(NAME                     as string)  as nm_estado
        ,cast(TERRITORYID                     as int)  as cod_territorio
    
    

    from {{ source('sap', 'StateProvince') }} -- Substitua com o schema e tabela corretos
)

select
  *
from estado_localizacao

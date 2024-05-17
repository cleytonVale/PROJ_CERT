-- checado
with pais_localizacao as (
    select
        cast(COUNTRYREGIONCODE  as string) as pk_pais
        ,cast(NAME              as string) as nm_pais

from {{ source('sap', 'CountryRegion') }}  

)

select 
*
from pais_localizacao
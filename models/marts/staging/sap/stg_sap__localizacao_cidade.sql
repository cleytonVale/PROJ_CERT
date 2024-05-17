with cidade_localizacao as (

select
cast(ADDRESSID        as string)      as pk_cidade
,cast(ADDRESSLINE1     as string)   as endereco   
,cast(CITY             as string)   as cidade
,cast(STATEPROVINCEID     as string)      as fk_estado
,cast(POSTALCODE       as string)      as cod_postal
 from {{ source('sap', 'Address') }}

)

select
*
from
cidade_localizacao
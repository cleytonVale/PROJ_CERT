
with vendedores as (
  select
    cast(BusinessEntityID as int)       as pk_vendedor
    ,cast(TERRITORYID as int)       as fk_cod_territorio
    ,cast(SalesQuota      as decimal)   as projecao_anual_venda
    ,cast(Bonus           as decimal)   as  bonus_cotas
    ,cast(CommissionPct   as decimal)   as comissao_percentual_mensal
    ,cast(SalesYTD        as decimal)  as total_venda_anualizado -- Total de vendas acumulado no ano até a data atual.
    ,cast(SalesLastYear    as decimal)  as total_venda_ano_ant  -- Total de vendas do ano anterior.

 from {{ source('sap', 'SalesPerson') }} 

)

select 
*
from 
vendedores
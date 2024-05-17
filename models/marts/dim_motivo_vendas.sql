WITH motivos_vendas  AS (
    -- SalesOrderDetail 121.317    131.863 64.515
    SELECT
     pk_motivo_venda
      ,data_modificacao_venda
      ,descr_motivo_venda
      ,tipo_motivo_venda
    FROM {{ ref('stg_sap__motivos_vendas') }}
)
select *
from
 motivos_vendas 


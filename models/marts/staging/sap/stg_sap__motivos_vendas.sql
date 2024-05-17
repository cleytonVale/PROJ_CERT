
  WITH motivos_vendas AS (
    select
        CAST(SALESREASONID  as string) as pk_motivo_venda
        ,CAST(MODIFIEDDATE AS string) as data_modificacao_venda
        ,CAST(NAME as string) as descr_motivo_venda
        ,CAST(REASONTYPE as string) as tipo_motivo_venda

   from {{ source('sap', 'SalesReason') }} 
)


select
    *
from motivos_vendas

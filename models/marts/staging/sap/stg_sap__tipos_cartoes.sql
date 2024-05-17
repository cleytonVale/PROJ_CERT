-- models/staging/stg_tipo_cartao.sql

with tipo_cartao as (
    select
    CAST(CREDITCARDID AS string) as pk_tipo_cartao
        ,CAST(CARDTYPE as string) as tipo_nome_cartao
        -- ... outros campos da tabela original
    from {{ source('sap', 'CreditCard') }} -- Substitua com o schema e tabela corretos
)

select
   *
    -- ... mapeie e renomeie outros campos conforme necessário
from tipo_cartao

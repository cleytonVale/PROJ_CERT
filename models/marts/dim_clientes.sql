-- models/dimensions/dim_clientes.sql

WITH clientes AS (
    SELECT
         pk_cliente
         ,fk_pessoa
         ,fk_cod_territorio
    FROM {{ ref('stg_sap__clientes') }} 
)

,pessoas AS (
    SELECT
         pk_pessoa
        ,nome
        ,sobrenome
        ,tipo_pessoa
    FROM {{ ref('stg_sap__pessoas') }}
)
,dim_clientes as (
SELECT
    c.pk_cliente
    ,p.pk_pessoa
    ,p.nome
    ,p.sobrenome
    ,p.tipo_pessoa
    ,c.fk_cod_territorio

FROM clientes c
LEFT JOIN pessoas p ON c.fk_pessoa = p.pk_pessoa
)

select
*
from 
dim_clientes
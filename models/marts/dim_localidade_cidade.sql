-- models/dimensions/dim_localidade.sql

-- CTE para unir dados das tabelas de cidade, estado e país
with dim_localidade_cidade as (
    select
     pk_cidade
      ,endereco
      ,cidade
      ,fk_estado
      ,cod_postal
      
    from {{ ref('stg_sap__localizacao_cidade') }} c
   
)
-- Dimensão de Localidade cidade

select 
* 
from dim_localidade_cidade

-- models/dimensions/dim_localidade.sql

-- CTE para unir dados das tabelas de cidade, estado e país
with dim_localidade_pais as (
    select
      
        p.pk_pais
        ,p.nm_pais
       
    
    from {{ ref('stg_sap__localizacao_pais') }} p 
)

select 
* 
from dim_localidade_pais

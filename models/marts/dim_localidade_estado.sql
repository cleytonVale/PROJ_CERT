-- models/dimensions/dim_localidade.sql

-- CTE para unir dados das tabelas de cidade, estado e país
with dim_localidade_estado as (
    select
      
      e.pk_estado
        ,e.nm_estado
        ,e.cod_estado
        ,fk_pais
        ,cod_territorio
        
       
  from  {{ ref('stg_sap__localizacao_estado') }} e
   
)


select 
* 
from dim_localidade_estado

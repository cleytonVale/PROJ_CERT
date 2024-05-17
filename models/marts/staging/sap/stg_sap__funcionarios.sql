--checar
with funcionarios as (
     select
	    cast(BUSINESSENTITYID as string) as pk_funcionario
		,cast(BIRTHDATE        as string) as niver_funcionario
	    ,cast(CURRENTFLAG      as string) as ativado
	    ,cast(GENDER           as string) as genero
	    ,cast(HIREDATE         as date)   as data_contratacao
	    ,cast(JOBTITLE         as string) as cargo
     
  from {{ source('sap', 'Employee') }} 
)

select
*
from funcionarios
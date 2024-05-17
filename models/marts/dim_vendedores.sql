WITH Vendedores AS (
    --salesPerson
    SELECT
        pk_vendedor
         ,fk_cod_territorio
         ,projecao_anual_venda
         ,bonus_cotas
         ,comissao_percentual_mensal
         ,total_venda_anualizado
         ,total_venda_ano_ant
   FROM {{ ref('stg_sap__vendedores') }}
)
, Funcionarios AS (
    --employee
    SELECT
       pk_Funcionario
        ,niver_funcionario
        ,ativado
        ,genero
        ,data_contratacao
        ,cargo
        -- ... outros campos da tabela original
    FROM {{ ref('stg_sap__funcionarios') }} -- Substitua com o schema e tabela corretos
)
, Pessoas AS (
    --person
    SELECT       
      pk_pessoa
       ,nome
       ,sobrenome
       ,tipo_pessoa
    FROM {{ ref('stg_sap__pessoas') }} -- Substitua com o schema e tabela corretos
)

,dim_vendedores as (
    select
          vendedores.pk_vendedor
         ,vendedores.fk_cod_territorio
         ,vendedores.projecao_anual_venda
         ,vendedores.bonus_cotas
         ,vendedores.comissao_percentual_mensal
         ,vendedores.total_venda_anualizado
         ,vendedores.total_venda_ano_ant

        ,funcionarios.niver_funcionario
        ,funcionarios.ativado
        ,funcionarios.genero
        ,funcionarios.data_contratacao
        ,funcionarios.cargo

       ,Pessoas.nome
       ,Pessoas.sobrenome
       ,Pessoas.tipo_pessoa

       from Vendedores
     join Funcionarios on to_number(Vendedores.pk_vendedor) = to_number(Funcionarios.pk_Funcionario)
      join Pessoas on  to_number(Vendedores.pk_vendedor) = to_number(Pessoas.pk_pessoa)





)

select 
*
from 
dim_vendedores

WITH Pessoas AS (
        SELECT 
        CAST(BUSINESSENTITYID AS STRING) AS pk_pessoa
        ,CAST(FIRSTNAME        AS STRING) AS nome
        ,CAST(LASTNAME         AS STRING) AS sobrenome
        ,CASE WHEN PERSONTYPE = 'SC' THEN 'Contato da Loja'
            WHEN PERSONTYPE = 'IN' THEN 'Indivíduo (cliente varejista)'   
            WHEN PERSONTYPE = 'SP' THEN 'Vendedor'
            WHEN PERSONTYPE = 'EM' THEN 'Funcionário (não vendedor)'
            WHEN PERSONTYPE = 'VC' THEN 'Contato do Fornecedor'
            WHEN PERSONTYPE = 'GC' THEN 'Contato Geral' END tipo_pessoa 
   
        from {{ source('sap', 'Person') }} 
)

SELECT 
*
FROM 
Pessoas
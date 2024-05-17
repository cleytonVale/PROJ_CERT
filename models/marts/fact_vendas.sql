WITH dim_clientes AS (
    SELECT 
        pk_cliente
            ,nome
            ,pk_pessoa
            ,sobrenome
            ,tipo_pessoa
            ,fk_cod_territorio
    FROM {{ ref('dim_clientes') }}
),
dim_localidade_cidade AS (
    SELECT 
        pk_cidade
          ,endereco
          ,fk_estado
          ,cod_postal
          ,cidade
    FROM {{ ref('dim_localidade_cidade') }}
),
dim_localidade_estado AS (
    SELECT 
        pk_estado
          ,nm_estado
          ,cod_estado
          ,fk_pais
          ,cod_territorio
    FROM {{ ref('dim_localidade_estado') }}
),
dim_localidade_pais AS (
    SELECT 
        pk_pais
          ,nm_pais
    FROM {{ ref('dim_localidade_pais') }}
),
dim_produtos AS (
    SELECT 
        pk_prod
            ,nm_prod
            ,cod_identifica_prod
            ,cor_produto
            ,dias_prod_produto
            ,data_descontinua_prod
            ,preco_venda
            ,fk_pedido_venda
            ,fk_detalhe_ordem_venda
            ,quantidade_comprada
            ,cod_promocional
            ,preco_unitario
            ,desconto_por_preco_unitario
    FROM {{ ref('dim_produtos') }}
),
dim_motivo_vendas AS (
    SELECT 
        pk_motivo_venda
          ,data_modificacao_venda
          ,descr_motivo_venda
          ,tipo_motivo_venda
    FROM {{ ref('dim_motivo_vendas') }}
),
dim_vendedores AS (
    SELECT 
        pk_vendedor
                ,fk_cod_territorio
                ,projecao_anual_venda
                ,bonus_cotas
                ,comissao_percentual_mensal
                ,total_venda_anualizado
                ,total_venda_ano_ant
                ,niver_funcionario
                ,ativado
                ,genero
                ,data_contratacao
                ,cargo
                ,nome
                ,sobrenome
                ,tipo_pessoa
    FROM {{ ref('dim_vendedores') }}
),
dim_data_de_venda AS (
    SELECT 
        data_da_venda
            ,pk_header_pedido_venda
            ,obs_venda
            ,fk_cartao_credito
            ,pk_venda
            ,frete
            ,plataforma_pedido
            ,fk_pessoa
            ,Status_Pedido_venda
            ,subtotal
            ,imposto
            ,Total_devido_cliente
            ,fk_cod_endereco
    FROM {{ ref('dim_data_de_venda') }}
),
joined_dimensoes AS (
    SELECT    
        dc.pk_cliente
                ,dc.pk_pessoa
                ,dc.nome AS nome_cliente
                ,dc.sobrenome AS sobrenome_cliente
                ,dc.tipo_pessoa
                ,dc.fk_cod_territorio
                ,dlc.pk_cidade
                ,dlc.endereco
                ,dlc.cidade
                ,dlc.fk_estado
                ,dle.pk_estado
                ,dle.nm_estado
                ,dle.cod_estado
                ,dle.fk_pais
                ,dle.cod_territorio
                ,dlp.pk_pais
                ,dlp.nm_pais
                ,dp.pk_prod
                ,dp.nm_prod
                ,dp.cod_identifica_prod
                ,dp.cor_produto
                ,dp.dias_prod_produto
                ,dp.data_descontinua_prod
                ,dp.preco_venda
                ,dp.fk_pedido_venda
                ,dp.fk_detalhe_ordem_venda
                ,dp.quantidade_comprada
                ,dp.cod_promocional
                ,dp.preco_unitario
                ,dp.desconto_por_preco_unitario
                ,dmv.pk_motivo_venda
                ,dmv.data_modificacao_venda
                ,dmv.descr_motivo_venda
                ,dmv.tipo_motivo_venda
                ,dv.pk_vendedor
                ,dv.fk_cod_territorio AS fk_cod_territorio_venda
                ,dv.projecao_anual_venda
                ,dv.bonus_cotas
                ,dv.comissao_percentual_mensal
                ,dv.total_venda_anualizado
                ,dv.total_venda_ano_ant
                ,dv.niver_funcionario
                ,dv.ativado
                ,dv.genero
                ,dv.data_contratacao
                ,dv.cargo
                ,dv.nome AS nome_vendedor
                ,dv.sobrenome AS sobrenome_vendedor
                ,dv.tipo_pessoa AS tipo_pessoa_vendedor
                ,ddv.data_da_venda
                ,ddv.pk_header_pedido_venda AS pk_numero_pedido
                ,ddv.obs_venda
                ,ddv.fk_cartao_credito
                ,ddv.pk_venda
                ,ddv.frete
                ,ddv.plataforma_pedido
                ,ddv.fk_pessoa
                ,ddv.Status_Pedido_venda
                ,ddv.subtotal
                ,ddv.imposto
                ,ddv.Total_devido_cliente
    FROM {{ ref('dim_produtos') }} dp
    LEFT JOIN {{ ref('dim_data_de_venda') }} ddv ON dp.fk_pedido_venda = ddv.pk_header_pedido_venda
    LEFT JOIN {{ ref('dim_clientes') }} dc ON ddv.fk_pessoa = dc.pk_cliente
    LEFT JOIN {{ ref('dim_vendedores') }} dv ON ddv.fk_pessoa = dv.pk_vendedor
    LEFT JOIN {{ ref('dim_motivo_vendas') }} dmv ON TO_NUMBER(ddv.pk_header_pedido_venda) = TO_NUMBER(dmv.pk_motivo_venda)
    LEFT JOIN {{ ref('dim_localidade_cidade') }} dlc ON ddv.fk_cod_endereco = dlc.pk_cidade 
    LEFT JOIN {{ ref('dim_localidade_estado') }} dle ON dle.pk_estado = dlc.fk_estado
    LEFT JOIN {{ ref('dim_localidade_pais') }} dlp ON dle.fk_pais = dlp.pk_pais
),
metricas AS (
    SELECT
        
    pk_cliente
        ,pk_pessoa
        ,nome_cliente
        ,sobrenome_cliente
        ,tipo_pessoa
        ,fk_cod_territorio
        ,pk_cidade
        ,endereco
        ,cidade
        ,fk_estado
        ,pk_estado
        ,nm_estado
        ,cod_estado
        ,fk_pais
        ,cod_territorio
        ,pk_pais
        ,nm_pais AS pais
        ,pk_prod
        ,nm_prod
        ,cod_identifica_prod
        ,cor_produto
        ,dias_prod_produto
        ,data_descontinua_prod
        ,preco_venda
        ,fk_pedido_venda
        ,fk_detalhe_ordem_venda
        ,quantidade_comprada quantidade_comprada_
        ,cod_promocional
        ,preco_unitario
        ,desconto_por_preco_unitario
        ,DATE_PART('year', data_da_venda) AS ano_data_da_venda
        ,COUNT(TO_NUMBER(pk_numero_pedido)) AS numero_pedidos
        ,SUM(TO_NUMBER(quantidade_comprada)) AS quantidade_comprada
        ,preco_unitario::numeric(18,6) * quantidade_comprada::numeric(18,6) AS valor_total_negociado
        ,preco_unitario * quantidade_comprada * (1 - desconto_por_preco_unitario) AS valor_total_negociado_liquido
    FROM joined_dimensoes
    GROUP BY 
        DATE_PART('year', data_da_venda)
            ,pk_cliente
            ,pk_pessoa
            ,nome_cliente
            ,sobrenome_cliente
            ,tipo_pessoa
            ,fk_cod_territorio
            ,pk_cidade
            ,endereco
            ,cidade
            ,fk_estado
            ,pk_estado
            ,nm_estado
            ,cod_estado
            ,fk_pais
            ,cod_territorio
            ,pk_pais
            ,nm_pais
            ,pk_prod
            ,nm_prod
            ,cod_identifica_prod
            ,cor_produto
            ,dias_prod_produto
            ,data_descontinua_prod
            ,preco_venda
            ,fk_pedido_venda
            ,fk_detalhe_ordem_venda
            ,quantidade_comprada
            ,cod_promocional
            ,preco_unitario
            ,desconto_por_preco_unitario
)

select 
*
from metricas
--SELECT 
--ano_data_da_venda
--    ,sum(numero_pedidos) numero_pedidos
--    ,trunc(sum(quantidade_comprada), 2) quantidade_comprada
--    ,trunc(sum(valor_total_negociado), 2) valor_total_negociado
--    ,trunc(sum(valor_total_negociado_liquido), 2) valor_total_negociado_liquido
-- FROM metricas
--where ano_data_da_venda = '2011'
--group by ano_data_da_venda

----12.646.112,16
----12.646.112.16
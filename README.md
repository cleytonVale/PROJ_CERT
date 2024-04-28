# PROJ_CERT
Projeto para certificação em analytics engineer

# Visão Geral
Este repositório contém todos os componentes necessários para a construção e operação de um Data Warehouse (DW) projetado especificamente para a empresa fictícia Adventure Works Cycles. O objetivo deste DW é consolidar dados de várias fontes operacionais para facilitar a análise de negócios e a tomada de decisão baseada em dados.

# Propósito do Projeto
O propósito deste projeto de DW é prover uma plataforma robusta para análises complexas e relatórios detalhados que ajudem a empresa a entender melhor suas operações de vendas, comportamento do cliente, e performance de produtos. Especificamente, o DW é projetado para responder a perguntas críticas de negócios que são essenciais para o crescimento estratégico e a eficiência operacional.

# Perguntas de Negócios
O Data Warehouse é modelado para responder às seguintes perguntas:

# Visão Geral de Vendas: 
a) Qual o número de pedidos, quantidade comprada, valor total negociado por produto, tipo de cartão, motivo de venda, data de venda, cliente, status, cidade, estado e país?
b) Análise de Ticket Médio: Quais os produtos com maior ticket médio por mês, ano, cidade, estado e país?
c) Clientes Top: Quais são os 10 melhores clientes por valor total negociado filtrado por produto, tipo de cartão, motivo de venda, data de venda, status, cidade, estado e país?
d) Performance Regional: Quais as 5 melhores cidades em valor total negociado por produto, tipo de cartão, motivo de venda, data de venda, cliente, status, cidade, estado e país?
e) Tendências Temporais: Qual o número de pedidos e a quantidade comprada, além do valor total negociado por mês e ano?
f) Desempenho de Promoções: Qual produto tem a maior quantidade de unidades compradas para o motivo de venda “Promotion”?

# Estrutura do Data Warehouse
O DW utiliza um esquema estrela, com uma tabela de fatos central chamada FactSales e várias tabelas de dimensão como DimProduct, DimCustomer, DimDate, entre outras. Este esquema facilita as consultas rápidas e eficientes, essenciais para análises e relatórios de BI.

# Ferramentas e Tecnologias
Este projeto é implementado utilizando a estrutura em nuvem do snowflake com os dados carregados, DBT para transformações e POWERBI para apresentação da informação.

# Como Usar
Para configurar e utilizar este DW, siga os passos detalhados na seção de instalação e configuração deste repositório. Os scripts de criação de banco de dados, ETL, e exemplos de consultas estão disponíveis na pasta /scripts.




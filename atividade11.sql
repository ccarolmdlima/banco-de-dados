-- Selecionar dados em tabelas do projeto PEDIDO, em conformidade com os enunciados a seguir:

-- a. Selecionar as constraints criadas da tabela ITEM_PRODUTO. Mostrar:
-- constraint_name (CONSTRAINT), constraint_type (TIPO) e
-- search_condition (CONDICAO). Ordenado pelo nome da constraint.
-- RESOLUÇÃO:
SELECT CONSTRAINT_NAME CONSTRAINT,
CONSTRAINT_TYPE TIPO,
SEARCH_CONDITION CONDICAO
FROM USER_CONSTRAINTS
WHERE TABLE_NAME='ITEM_PRODUTO'
ORDER BY 1;

-- b. Criar a view de clientes constante do BD Pedidos (VIEW_CLIENTE)
-- contendo os dados das tabelas CLIENTE, PF e PJ. Em conformidade com a
-- estrutura disponível no MER físico do projeto BD de Pedido.
-- RESOLUÇÃO:
CREATE OR REPLACE VIEW VIEW_CLIENTE
AS
SELECT 'PF' AS TIPO,
CODIGO,
NOME,
CNPF,
NULL AS CNPJ
FROM CLIENTE JOIN
PF ON CLIENTE.CODIGO = PF.CODIGO_CLI
UNION
SELECT 'PJ' AS TIPO,
CODIGO,
NOME,
NULL AS CNPF,
CNPJ
FROM CLIENTE JOIN
PJ ON CLIENTE.CODIGO = PJ.CODIGO_CLI;

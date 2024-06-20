-- Selecionar dados em tabelas do projeto PEDIDO, em conformidade com os enunciados a seguir:

-- a. Inserir uma prateleira de código 390, descrição 'Prateleira de
-- teste' e número de seções 2.
-- RESOLUÇÃO:
INSERT INTO PRATELEIRA (CODIGO, DESCRICAO, NUMERO_SECOES)
VALUES (390, 'Prateleira de teste', 2);

-- b. Listar as prateleiras e os respectivos produtos que podem
-- armazenar. Mostrando a frase 'sem produto' quando não se relaciona
-- com nenhum. Mostrar: Prateleira (CODIGO, DESCRICAO), descrição
-- (PRODUTO) e quantidade distinta de produtos, ordenados pela quantidade
-- de produtos decrescente.
-- RESOLUÇÃO:
SELECT DISTINCT P.CODIGO,
P.DESCRICAO,
NVL(PRO.DESCRICAO,'sem produto') AS PRODUTO,
CE.QUANTIDADE
FROM PRATELEIRA P LEFT JOIN
CAPACIDADE_ESTOQUE CE ON P.CODIGO=CE.CODIGO_PRA LEFT JOIN
PRODUTO PRO ON CE.CODIGO_PRO=PRO.CODIGO
ORDER BY CE.QUANTIDADE DESC;

-- c. Selecionar todos os clientes da view VIEW_CLIENTE que são PF.
-- Mostrar: CODIGO, NOME e CNPF, ordenado decrescente pelo nome do
-- cliente.
-- RESOLUÇÃO:
SELECT CODIGO,
NOME,
CNPF
FROM VIEW_CLIENTE
WHERE TIPO='PF'
ORDER BY NOME DESC;

-- d. Listar os pedidos e seus respectivos produtos. Mostrar: numero do
-- pedido (PEDIDO), DATA do pedido, descrição do produto (PRODUTO) e
-- QUANTIDADE de produtos no pedido. Ordenado pela DATA do pedido
-- crescente e, dentro das datas, pelo produto decrescente.
-- RESOLUÇÃO:
SELECT P.NUMERO AS PEDIDO,
P.DATA,
PROD.DESCRICAO AS PRODUTO,
IP.QUANTIDADE
FROM PEDIDO P JOIN
ITEM_PRODUTO IP ON P.NUMERO=IP.NUMERO_PED JOIN
PRODUTO PROD ON IP.CODIGO_PRO=PROD.CODIGO
ORDER BY 2,
3 DESC;

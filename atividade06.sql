--Inserir dados na tabela ITEM_PRODUTO em conformidade com os enunciados a seguir:

-- 1. Produto 207 para todos os pedidos pares e ano menor 2018, com a quantidade 100 e
-- preço unitário R$ 10.00
-- RESOLUÇÃO:
INSERT INTO ITEM_PRODUTO
SELECT 207 AS CODIGO_PRO,
NUMERO AS NUMERO_PED,
100 AS QUANTIDADE,
10.00 AS PRECO_UNITARIO,
NULL
FROM PEDIDO
WHERE MOD(NUMERO,2)=0
 AND TO_CHAR(DATA, 'YYYY') < 2018;

-- 2. Produto 206 para todos os pedidos impares e ano igual 2018, com a quantidade 50 e
-- preço unitário R$ 12.00
-- RESOLUÇÃO:
INSERT INTO ITEM_PRODUTO
SELECT 206 AS CODIGO_PRO,
NUMERO AS NUMERO_PED,
50 AS QUANTIDADE,
12.00 AS PRECO_UNITARIO,
NULL
FROM PEDIDO
WHERE MOD(NUMERO,2)=1
 AND TO_CHAR(DATA, 'YYYY') = 2018;

-- 3. Produto 207 para todos os pedidos pares e ano igual 2018, com a quantidade 150 e
-- preço unitário R$ 14.00
-- RESOLUÇÃO:
INSERT INTO ITEM_PRODUTO
SELECT 207 AS CODIGO_PRO,
NUMERO AS NUMERO_PED,
150 AS QUANTIDADE,
14.00 AS PRECO_UNITARIO,
NULL
FROM PEDIDO
WHERE MOD(NUMERO,2)=0
 AND TO_CHAR(DATA, 'YYYY') = 2018;

-- 4. Produto 206 para todos os pedidos impares e ano menor 2018, com a quantidade 200 e
-- preço unitário R$ 8.00
-- RESOLUÇÃO:
INSERT INTO ITEM_PRODUTO
SELECT 206 AS CODIGO_PRO,
NUMERO AS NUMERO_PED,
200 AS QUANTIDADE,
8.00 AS PRECO_UNITARIO,
NULL
FROM PEDIDO
WHERE MOD(NUMERO,2)=1
 AND TO_CHAR(DATA, 'YYYY') < 2018;

-- 5. Produto 208 para todos sem endereço de entrega e ano igual 2017, com a quantidade
-- 80 e preço unitário R$ 18.00
-- RESOLUÇÃO:
INSERT INTO ITEM_PRODUTO
SELECT 208 AS CODIGO_PRO,
NUMERO AS NUMERO_PED,
80 AS QUANTIDADE,
18.00 AS PRECO_UNITARIO,
NULL
FROM PEDIDO
WHERE TO_CHAR(DATA, 'YYYY') = 2017
 AND RUA IS NULL;

-- 6. Produto 208 para todos sem endereço de entrega e ano igual 2018, com a quantidade
-- 70 e preço unitário R$ 20.00
-- RESOLUÇÃO:
INSERT INTO ITEM_PRODUTO
SELECT 208 AS CODIGO_PRO,
NUMERO AS NUMERO_PED,
70 AS QUANTIDADE,
20.00 AS PRECO_UNITARIO,
NULL
FROM PEDIDO
WHERE TO_CHAR(DATA, 'YYYY') = 2018
 AND PRAZO_ENTREGA IS NULL;

-- 7. Produto 202 para todos pedidos com endereço de entrega e dia impar de entrega, com a
-- quantidade 60 e preço unitário R$ 15.00
-- RESOLUÇÃO:
INSERT INTO ITEM_PRODUTO
SELECT 202 AS CODIGO_PRO,
NUMERO AS NUMERO_PED,
60 AS QUANTIDADE,
15.00 AS PRECO_UNITARIO,
NULL
FROM PEDIDO
WHERE MOD(TO_NUMBER(TO_CHAR(PRAZO_ENTREGA, 'DD')),2) = 1
 AND RUA IS NOT NULL;

-- 8. Produto 205 para todos pedidos com endereço de entrega e dia par da data do pedido,
-- com a quantidade 90 e preço unitário R$ 11.50
-- RESOLUÇÃO:
INSERT INTO ITEM_PRODUTO
SELECT 205 AS CODIGO_PRO,
NUMERO AS NUMERO_PED,
90 AS QUANTIDADE,
11.50 AS PRECO_UNITARIO,
NULL
FROM PEDIDO
WHERE MOD(TO_NUMBER(TO_CHAR(DATA, 'DD')),2) = 0
 AND RUA IS NOT NULL;

-- 9. Produto 203 para todos pedidos com endereço de entrega e dia ímpar da data de
-- pedido, com a quantidade 550 e preço unitário R$ 21.35
-- RESOLUÇÃO:
INSERT INTO ITEM_PRODUTO
SELECT 203 AS CODIGO_PRO,
NUMERO AS NUMERO_PED,
550 AS QUANTIDADE,
21.35 AS PRECO_UNITARIO,
NULL
FROM PEDIDO
WHERE MOD(TO_NUMBER(TO_CHAR(DATA, 'DD')),2) = 1
 AND RUA IS NOT NULL;

-- 10. Produto 204 para todos pedidos sem endereço de entrega e dia par da data do pedido,
-- com a quantidade 150 e preço unitário R$ 25.85
-- RESOLUÇÃO:
INSERT INTO ITEM_PRODUTO
SELECT 204 AS CODIGO_PRO,
NUMERO AS NUMERO_PED,
150 AS QUANTIDADE,
25.85 AS PRECO_UNITARIO,
NULL
FROM PEDIDO
WHERE MOD(TO_NUMBER(TO_CHAR(DATA, 'DD')),2) = 0
 AND RUA IS NULL;

COMMIT;

-- Selecionar dados em tabela simples do projeto PEDIDO, em conformidade com os enunciados a seguir:

-- a. Listar os vendedores . Mostrar: Vendedor (MATRICULA e NOME).
-- Ordenados pelo nome decrescente.
-- RESOLUÇÃO:
SELECT MATRICULA,
NOME
FROM VENDEDOR
ORDER BY NOME DESC;

-- b. Listar distintamente os clientes PJ. Mostrar: Nome do cliente
-- (CLIENTE), CNPJ e CIDADE onde reside. Ordenados pelo nome do cliente
-- ascendente e, dentro deste, pela cidade descendente.
-- RESOLUÇÃO:
SELECT DISTINCT NOME AS CLIENTE,
CNPJ,
CIDADE
FROM CLIENTE INNER JOIN
PJ ON CLIENTE.CODIGO = PJ.CODIGO_CLI
ORDER BY NOME,
CIDADE DESC;

-- c. Listar os vendedores e seus pedidos já realizados com total de
-- fatura entre R$ 1000,00 e R$ 5000,00, inclusive.. Mostrar: Nome do
-- vendedor (VENDEDOR), número do pedido (PEDIDO),data do pedido (DATA)
-- com a formatação 'dd/mm/yyyy'. Ordenados pelo nome do vendedor
-- descendente e, dentro deste, pela data ascendente.
-- RESOLUÇÃO:
SELECT NOME AS VENDEDOR,
NUMERO AS PEDIDO,
TO_CHAR(DATA, 'DD/MM/YYYY') AS DATA
FROM PEDIDO JOIN
VENDEDOR ON PEDIDO.MATRICULA_VEN = VENDEDOR.MATRICULA
WHERE TOTAL_FATURA BETWEEN 1000.00 AND 5000.00
ORDER BY NOME DESC,
DATA;

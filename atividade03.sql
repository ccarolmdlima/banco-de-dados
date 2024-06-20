/*
1) Criar uma constraint que garanta que o valor do NUMERO da tabela PEDIDO esteja
entre, inclusive, 1 e 99999.
2) Criar os indexes das tabelas PF e PJ. Estes indexes serão únicos e utilizados como
listas invertidas.
3) Criar uma sequence de nome SEQ_ITEM_ID para o campo CODIGO de
ITEM_PRODUTO, com incremento de 2.
*/

-- SOLUÇÃO 1)
alter table PEDIDO
add constraint CK_NUMERO_PEDIDO check (NUMERO BETWEEN 1 AND 99999);

-- SOLUÇÃO 2)
CREATE UNIQUE INDEX IND_CNPF_PF
ON PF (CNPF DESC);
CREATE UNIQUE INDEX IND_CNPF_PJ
ON PJ (CNPJ DESC);

-- SOLUÇÃO 3)
drop sequence SEQ_ITEM_ID;
create sequence SEQ_ITEM_ID start with 2 increment by 2;

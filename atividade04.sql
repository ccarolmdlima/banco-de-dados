/*
1) Criar comentários para a tabela ITEM_PRODUTO e suas respectivas colunas.
*/

-- SOLUÇÃO
comment on table ITEM_PRODUTO is
'Mantém os dados dos itens de produtos dos pedidos no negócio do sistema de pedido.';
comment on column ITEM_PRODUTO.CODIGO_PRO is
'Código que identifica cada produto do negócio. PEx: 12345.';
comment on column ITEM_PRODUTO.NUMERO_PED is
'Número que identifica cada pedido efetuado no sistema. Seu valor é sequencial e é gerado por
uma sequence de nome SEQ_NUMERO_PEDIDO. PEx: 123456.';

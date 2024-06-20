-- 1) Criar as tabelas associativas: PEDIDO, ESTOQUE, CAPACIDADE_ESTOQUE e
-- ITEM_PRODUTO. Não incluir na criação destas tabelas as chaves primária (PK) e
-- chaves estrangeiras (FK). Substituir todos os tipos de dados INTEGER do modelo por
-- NUMBER.
-- 2) Criar as constraints de chave primária (primary key) para as tabelas associativas.
-- 3) Criar as constraints das chaves estrangeiras (foreing key) para as tabelas associativas.

-- SOLUÇÃO 1)
/*==============================================================*/
/* Table: PEDIDO */
/*==============================================================*/
DROP TABLE PEDIDO CASCADE CONSTRAINT;
create table PEDIDO (
NUMERO NUMBER(6) not null,  -- NUMERO: Número do pedido (6 dígitos, não nulo).
DATA DATE not null,
PRAZO_ENTREGA DATE,
RUA varchar2(80),
NR NUMBER(4),
BAIRRO varchar2(50),
COMPLEMENTO varchar2(100),
CIDADE varchar2(50),
UF varchar2(2),
CEP varchar2(10),
TOTAL_FATURA NUMBER(8,2),  -- TOTAL_FATURA: Total da fatura (8 dígitos com 2 casas decimais).
CODIGO_CLI NUMBER not null,
MATRICULA_VEN NUMBER not null
);
/*==============================================================*/
/* Table: ITEM_PRODUTO */
/*==============================================================*/
DROP TABLE ITEM_PRODUTO;
create table ITEM_PRODUTO (
CODIGO_PRO NUMBER not null,
NUMERO_PED NUMBER(6) not null,  -- NUMERO_PED: Número do pedido (6 dígitos, não nulo).

QUANTIDADE NUMBER(5) not null,
PRECO_UNITARIO NUMBER(5,2) not null,  -- PRECO_UNITARIO: Preço unitário do produto (5 dígitos com 2 casas decimais, não nulo).
VALOR_ITEM NUMBER(7,2)
);
/*==============================================================*/
/* Table: CAPACIDADE_ESTOQUE */
/*==============================================================*/
DROP TABLE CAPACIDADE_ESTOQUE;
create table CAPACIDADE_ESTOQUE (
CODIGO_PRO NUMBER not null,
CODIGO_PRA NUMBER(3) not null,
QUANTIDADE NUMBER(5) not null
);
/*==============================================================*/
/* Table: ESTOQUE */
/*==============================================================*/
DROP TABLE ESTOQUE;
create table ESTOQUE (
DATA_ENTRADA DATE not null,  -- DATA_ENTRADA: Data de entrada no estoque (não nulo).
CODIGO_PRO NUMBER not null,
CODIGO_PRA NUMBER(3) not null,
QUANTIDADE NUMBER(5) not null,
DATA_VALIDADE DATE  -- DATA_VALIDADE: Data de validade do produto.
);


-- SOLUÇÃO 2)
alter table PEDIDO  -- PEDIDO: Define NUMERO como chave primária.
ADD constraint PK_PEDIDO primary key (NUMERO);  -- PK_PEDIDO: Define NUMERO como chave primária da tabela PEDIDO. Isso significa que o valor de NUMERO deve ser único em cada registro da tabela e não pode ser nulo.

alter table ITEM_PRODUTO  -- ITEM_PRODUTO: Define chave primária composta pelas colunas CODIGO_PRO e NUMERO_PED.
ADD constraint PK_ITEM_PRODUTO primary key (CODIGO_PRO, NUMERO_PED);  -- PK_ITEM_PRODUTO: Define uma chave primária composta por CODIGO_PRO e NUMERO_PED na tabela ITEM_PRODUTO. Ambos os valores combinados devem ser únicos para cada registro, garantindo que não haja duplicatas de produtos por pedido.

alter table CAPACIDADE_ESTOQUE  -- CAPACIDADE_ESTOQUE: Define chave primária composta pelas colunas CODIGO_PRO e CODIGO_PRA.
ADD constraint PK_CAPACIDADE_ESTOQUE primary key (CODIGO_PRO, CODIGO_PRA);  -- PK_CAPACIDADE_ESTOQUE: Define uma chave primária composta por CODIGO_PRO e CODIGO_PRA na tabela CAPACIDADE_ESTOQUE. Ambos os valores combinados devem ser únicos para cada registro.

alter table ESTOQUE  -- ESTOQUE: Define chave primária composta pelas colunas CODIGO_PRO, CODIGO_PRA e DATA_ENTRADA.
ADD constraint PK_ESTOQUE primary key (CODIGO_PRO, CODIGO_PRA, DATA_ENTRADA); -- PK_ESTOQUE: Define uma chave primária composta por CODIGO_PRO, CODIGO_PRA e DATA_ENTRADA na tabela ESTOQUE. A combinação desses três valores deve ser única para cada registro.


-- SOLUÇÃO 3)
alter table PEDIDO
add constraint FK_PED_VENDEDOR foreign key (MATRICULA_VEN)  -- FK_PED_VENDEDOR: Define MATRICULA_VEN na tabela PEDIDO como uma chave estrangeira que referencia MATRICULA na tabela VENDEDOR. Isso garante que cada valor em MATRICULA_VEN exista na tabela VENDEDOR, assegurando que cada pedido tenha um vendedor válido.
references VENDEDOR (MATRICULA);

alter table PEDIDO
add constraint FK_PED_CLIENTE foreign key (CODIGO_CLI)  -- FK_PED_CLIENTE: Define CODIGO_CLI na tabela PEDIDO como uma chave estrangeira que referencia CODIGO na tabela CLIENTE. Isso assegura que cada pedido esteja associado a um cliente válido.
references CLIENTE (CODIGO);

alter table ITEM_PRODUTO
add constraint FK_ITEM_PEDIDO foreign key (NUMERO_PED)  -- FK_ITEM_PEDIDO: Define NUMERO_PED na tabela ITEM_PRODUTO como uma chave estrangeira que referencia NUMERO na tabela PEDIDO. Isso garante que cada item de produto esteja associado a um pedido válido.
references PEDIDO (NUMERO);

alter table ITEM_PRODUTO
add constraint FK_ITEM_PRODUTO foreign key (CODIGO_PRO)  -- FK_ITEM_PRODUTO: Define CODIGO_PRO na tabela ITEM_PRODUTO como uma chave estrangeira que referencia CODIGO na tabela PRODUTO. Isso assegura que cada item de produto esteja associado a um produto válido.
references PRODUTO (CODIGO);

alter table CAPACIDADE_ESTOQUE
add constraint FK_CAP_EST_PRATELEIRA foreign key (CODIGO_PRA)  -- FK_CAP_EST_PRATELEIRA: Define CODIGO_PRA na tabela CAPACIDADE_ESTOQUE como uma chave estrangeira que referencia CODIGO na tabela PRATELEIRA. Isso garante que cada registro de capacidade de estoque esteja associado a uma prateleira válida.
references PRATELEIRA (CODIGO);

alter table CAPACIDADE_ESTOQUE
add constraint FK_CAP_EST_PRODUTO foreign key (CODIGO_PRO)  -- FK_CAP_EST_PRODUTO: Define CODIGO_PRO na tabela CAPACIDADE_ESTOQUE como uma chave estrangeira que referencia CODIGO na tabela PRODUTO. Isso assegura que cada registro de capacidade de estoque esteja associado a um produto válido.
references PRODUTO (CODIGO);

alter table ESTOQUE
add constraint FK_EST_PRATELEIRA foreign key (CODIGO_PRA)  -- FK_EST_PRATELEIRA: Define CODIGO_PRA na tabela ESTOQUE como uma chave estrangeira que referencia CODIGO na tabela PRATELEIRA. Isso garante que cada registro de estoque esteja associado a uma prateleira válida.
references PRATELEIRA (CODIGO);

alter table ESTOQUE
add constraint FK_EST_PRODUTO foreign key (CODIGO_PRO)  -- FK_EST_PRODUTO: Define CODIGO_PRO na tabela ESTOQUE como uma chave estrangeira que referencia CODIGO na tabela PRODUTO. Isso assegura que cada registro de estoque esteja associado a um produto válido.
references PRODUTO (CODIGO);


/*
No contexto das restrições de chave estrangeira (foreign key constraints), a palavra-chave references é usada para definir
a relação entre uma coluna (ou um conjunto de colunas) em uma tabela e a coluna correspondente em outra tabela.
Isso estabelece uma ligação entre as duas tabelas, garantindo que os valores na coluna de chave estrangeira correspondam
a valores existentes na coluna de chave primária da tabela referenciada.

Tabela PEDIDO:

FK_PED_VENDEDOR (MATRICULA_VEN) references VENDEDOR (MATRICULA):
Garante que cada MATRICULA_VEN na tabela PEDIDO exista na coluna MATRICULA da tabela VENDEDOR.
FK_PED_CLIENTE (CODIGO_CLI) references CLIENTE (CODIGO):
Garante que cada CODIGO_CLI na tabela PEDIDO exista na coluna CODIGO da tabela CLIENTE.
Tabela ITEM_PRODUTO:

FK_ITEM_PEDIDO (NUMERO_PED) references PEDIDO (NUMERO):
Garante que cada NUMERO_PED na tabela ITEM_PRODUTO exista na coluna NUMERO da tabela PEDIDO.
FK_ITEM_PRODUTO (CODIGO_PRO) references PRODUTO (CODIGO):
Garante que cada CODIGO_PRO na tabela ITEM_PRODUTO exista na coluna CODIGO da tabela PRODUTO.
Tabela CAPACIDADE_ESTOQUE:

FK_CAP_EST_PRATELEIRA (CODIGO_PRA) references PRATELEIRA (CODIGO):
Garante que cada CODIGO_PRA na tabela CAPACIDADE_ESTOQUE exista na coluna CODIGO da tabela PRATELEIRA.
FK_CAP_EST_PRODUTO (CODIGO_PRO) references PRODUTO (CODIGO):
Garante que cada CODIGO_PRO na tabela CAPACIDADE_ESTOQUE exista na coluna CODIGO da tabela PRODUTO.
Tabela ESTOQUE:

FK_EST_PRATELEIRA (CODIGO_PRA) references PRATELEIRA (CODIGO):
Garante que cada CODIGO_PRA na tabela ESTOQUE exista na coluna CODIGO da tabela PRATELEIRA.
FK_EST_PRODUTO (CODIGO_PRO) references PRODUTO (CODIGO):
Garante que cada CODIGO_PRO na tabela ESTOQUE exista na coluna CODIGO da tabela PRODUTO.
*/

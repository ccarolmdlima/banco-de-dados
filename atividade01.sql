-- Implementar o script DDL para criar as tabelas do BD de pedidos: CLIENTE, PF, PJ,
-- PRODUTO, VENDEDOR, FONE_CLIENTE, FONE_VENDEDOR e PRATELEIRA.
-- Colocar as regras de integridade básica no script de criação. Substituir todos os tipos de
-- dados INTEGER que estão no modelo por NUMBER.

-- SOLUÇÃO:
/*==============================================================*/
/* Table: CLIENTE */
/*==============================================================*/
DROP TABLE CLIENTE CASCADE CONSTRAINT;  --  Remove a tabela CLIENTE e todas as suas constraints (restrições), caso exista.
create table CLIENTE (
CODIGO NUMBER not null,  -- CODIGO: Número único identificador do cliente (chave primária).
NOME varchar2(60) not null,  -- NOME: Nome do cliente.
RUA varchar2(80) not null,  -- RUA, NR, BAIRRO, COMPLEMENTO, CIDADE, UF, CEP: Informações de endereço do cliente.
NR NUMBER(4) not null,
BAIRRO varchar2(50) not null,
COMPLEMENTO varchar2(100),
CIDADE varchar2(50) not null,
UF varchar2(2) not null,
CEP varchar2(10) not null,
constraint PK_CLIENTE primary key (CODIGO)  -- constraint PK_CLIENTE primary key (CODIGO): Define CODIGO como a chave primária da tabela.
);
/*==============================================================*/
/* Table: VENDEDOR */
/*==============================================================*/
DROP TABLE VENDEDOR CASCADE CONSTRAINT;  -- DROP TABLE VENDEDOR CASCADE CONSTRAINT: Remove a tabela VENDEDOR e todas as suas constraints, caso exista.
create table VENDEDOR (  -- create table VENDEDOR: Cria a tabela VENDEDOR com as seguintes colunas:
MATRICULA NUMBER not null,  -- MATRICULA: Número único identificador do vendedor (chave primária).
NOME varchar2(60) not null,  -- NOME: Nome do vendedor.
CNPF varchar2(14) not null,  -- CNPF: Cadastro Nacional da Pessoa Física do vendedor.
constraint PK_VENDEDOR primary key (MATRICULA)  -- constraint PK_VENDEDOR primary key (MATRICULA): Define MATRICULA como a chave primária da tabela.
);
/*==============================================================*/
/* Table: FONE_CLIENTE */
/*==============================================================*/
DROP TABLE FONE_CLIENTE CASCADE CONSTRAINT;  -- DROP TABLE FONE_CLIENTE CASCADE CONSTRAINT: Remove a tabela FONE_CLIENTE e todas as suas constraints, caso exista.

create table FONE_CLIENTE (  -- create table FONE_CLIENTE: Cria a tabela FONE_CLIENTE com as seguintes colunas:
NUMERO varchar2(14) not null,  -- NUMERO: Número de telefone do cliente.
CODIGO_CLI NUMBER not null,  -- CODIGO_CLI: Código do cliente (chave estrangeira referenciando CLIENTE(CODIGO)).
constraint PK_FONE_CLIENTE primary key (NUMERO, CODIGO_CLI),  -- constraint PK_FONE_CLIENTE primary key (NUMERO, CODIGO_CLI): Define uma chave primária composta pelas colunas NUMERO e CODIGO_CLI.
constraint FK_FONE_CLIENTE foreign key (CODIGO_CLI) references CLIENTE (CODIGO)  -- constraint FK_FONE_CLIENTE foreign key (CODIGO_CLI) references CLIENTE (CODIGO): Define CODIGO_CLI como chave estrangeira que referencia a coluna CODIGO na tabela CLIENTE.
);
/*==============================================================*/
/* Table: FONE_VENDEDOR */
/*==============================================================*/
DROP TABLE FONE_VENDEDOR CASCADE CONSTRAINT;
create table FONE_VENDEDOR (
NUMERO varchar2(14) not null,
MATRICULA_VEN NUMBER not null,
constraint PK_FONE_VENDEDOR primary key (NUMERO, MATRICULA_VEN),  -- constraint PK_FONE_VENDEDOR primary key (NUMERO, MATRICULA_VEN): Define uma chave primária composta pelas colunas NUMERO e MATRICULA_VEN.
constraint FK_FONE_VENDEDOR foreign key (MATRICULA_VEN) references VENDEDOR (MATRICULA)  -- constraint FK_FONE_VENDEDOR foreign key (MATRICULA_VEN) references VENDEDOR (MATRICULA): Define MATRICULA_VEN como chave estrangeira que referencia a coluna MATRICULA na tabela VENDEDOR.
);
/*==============================================================*/
/* Table: PF */
/*==============================================================*/
DROP TABLE PF;
create table PF (
CODIGO_CLI NUMBER not null,
CNPF varchar2(14) not null,
RG varchar2(10) not null,
DATA_NASCIMENTO DATE not null,
constraint PK_PF primary key (CODIGO_CLI),
constraint FK_PF_CLIENTE foreign key (CODIGO_CLI) references CLIENTE (CODIGO)
);
/*==============================================================*/
/* Table: PJ */
/*==============================================================*/
DROP TABLE Pj;
create table PJ (
CODIGO_CLI NUMBER not null,
CNPJ varchar2(19) not null,
IE varchar2(10) not null,
NOME_FANTASIA varchar2(60) not null,
constraint PK_PJ primary key (CODIGO_CLI),
constraint FK_PJ_CLIENTE foreign key (CODIGO_CLI) references CLIENTE (CODIGO)
);

/*==============================================================*/
/* Table: PRATELEIRA */
/*==============================================================*/
DROP TABLE PRATELEIRA CASCADE CONSTRAINT;
create table PRATELEIRA (
CODIGO NUMBER(3) not null,
DESCRICAO varchar2(50) not null,
NUMERO_SECOES NUMBER(2) not null,
constraint PK_PRATELEIRA primary key (CODIGO)
);
/*==============================================================*/
/* Table: PRODUTO */
/*==============================================================*/
DROP TABLE PRODUTO CASCADE CONSTRAINT;
create table PRODUTO (
CODIGO NUMBER not null,
DESCRICAO varchar2(80) not null,
UNID_MEDIDA varchar2(10) not null,
constraint PK_PRODUTO primary key (CODIGO)
);

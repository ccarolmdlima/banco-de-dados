/*
1) Selecionar os metadados das tabelas criadas pelo usuário logado.
2) Selecionar os metadados das colunas das tabelas criadas pelo usuário logado.
3) Selecionar os metadados das regras (constraints) implementadas nas tabelas criadas
pelo usuário logado.
4) Selecionar os metadados das regras (constraints) implementadas nas colunas das
tabelas criadas pelo usuário logado.
*/

-- SOLUÇÃO 1)
SELECT *
FROM USER_TABLES;

-- SOLUÇÃO 2)
SELECT *
FROM USER_TAB_COLUMNS;

-- SOLUÇÃO 3)
SELECT *
FROM USER_CONSTRAINTS;

-- SOLUÇÃO 4)
SELECT *
FROM USER_CONS_COLUMNS;

-- O DUPLO SINAL DE MENOS COMENTA TODA A LINHA

/*
DUAS FORMAS DE EXECUÇÃO DAS QUERIES:
1) COMO INSTRUÇÃO - GERA UM RESULTADO EM FORMA DE TABELA
2) COMO SCRIPT - GERA RESULTADO EM TEXTO
*/

SELECT * -- * ESTÁ INDICANDO QUE A QUERY IRÁ TRAZER TODAS AS COLUNAS DA TABELA
FROM EMP; -- TODA QUERY TERMINA COM PONTO E VÍRGULA

SELECT FIRST_NAME
FROM EMP;

/*
SELECT -- PROJETA AS COLUNAS DESEJADAS EXISTENTES NA ORIGEM FROM, SEPARADAS POR VÍRGULA
FROM -- RELACIONA A ORIGEM ONDE ESTÃO OS DADOS CONSULTADOS
WHERE -- FAZ A RESTRIÇÃO/FILTRO DAS LINHAS A SEREM MOSTRADAS CONFORME UMA CONDIÇÃO
      -- OPERADORES PARA DEFINIR UMA CONDIÇÃO: =, <> (!=), <=, >=, <, >, NOT, AND, OR
      --                                       BETWEEN, LIKE, IN
GROUP BY -- ESTABELECER SUBGRUPOS NO RESULTADO DA QUERY
HAVING -- FAZ A RESTRIÇÃO/FILTRO DOS SUBGRUPOS FORMADOS CONFORME UMA CONDIÇÃO
ORDER BY -- ORDENAR O RESULTADO APRESENTADO, CRESCENTE (ASCENDENTE) OU DECRESCENTE (DESCENDENTE)POR COLUNAS
 */
 
 -- PRODUZINDO RESULTADOS CONSTANTES
 SELECT ROUND(123456743 / 34215734,2) AS CALC1,
        TO_CHAR(SYSDATE, 'DD-MM-YYYY') "DATA HOJE",
        'Teste' AS STRING,
        5 AS NUMERO
 FROM DUAL; -- DUAL É UM OBJETO EQUIVALENTE A UMA TABELA SEM COLUNAS NO BD
 
 -- OBTENDO VALORES A PARTIR DE UMA TABELA COM DADOS NO BD
 SELECT ROUND(123456743 / 34215734,2) AS CALC1,
        TO_CHAR(SYSDATE, 'DD-MM-YYYY') "DATA HOJE",
        'Teste' AS STRING,
        5 AS NUMERO,
        FIRST_NAME PRIMEIRO_NOME
 FROM EMP;
 
 -- VERIFICANDO E ANALISANDO METADADOS NO DICIONÁRIO DE DADOS DINÂMICO (CATÁLOGO)
 DESC ALL_OBJECTS -- DESC DESCREVE A ESTRUTURA DE UMA TABELA OU VIEW
 
 -- SELECIONANDO OS DADOS DA VIEW ALL_OBJECTS
 SELECT *
 FROM ALL_OBJECTS;
 
 SELECT COUNT (*) -- CONTANDO A QUANTIDADE DE OBJETOS QUE O USUÁRIO LOGADO PODE VER
 FROM ALL_OBJECTS;
 
 SHOW USER;
 
 SELECT DISTINCT OBJECT_TYPE -- VERIFICANDO OS OBJETOS DISTINTOS EXISTENTES NO BD
 FROM ALL_OBJECTS;
 
 
 -- VERIFICAR OS OBJETOS EXISTENTES A PARTIR DE UM FILTRO COM PALAVRAS DE INTERESSE
 SELECT OBJECT_NAME
 FROM ALL_OBJECTS;
 WHERE OBJECT_TYPE ='VIEW'; -- OS DADOS ARMAZENADOS NO BD SÃO SENSÍVEIS A MAIÚSCULAS/MINÚSCULAS
 
 -- BUSCANDO INFORMAÇÕES SOBRE TABELAS NO CATÁLOGO (DD)
 SELECT OBJECT_NAME
 FROM ALL_OBJECTS;
 WHERE OBJECT_TYPE ='VIEW'
   AND OBJECT_NAME LIKE '%TABLE%'; -- BUSCANDO AS VIEWS COM INFORMAÇÕES RELACIONADAS A TABELAS
                                   -- OS METATACARATERES SÃO % E O _ (UNDERLINE)
                                   -- % SUBSTITUI UMA CADEIA DE CARACTERES
                                   -- _ SUBSTITUI UMA A POSIÇÃO DE UM CARACTER
   
 -- BUSCANDO INFORMAÇÕES RELACIONADAS A COLUNAS DE TABELAS NO CATÁLOGO (DD)
 SELECT OBJECT_NAME
 FROM ALL_OBJECTS;
 WHERE OBJECT_TYPE ='VIEW'
   AND OBJECT_NAME LIKE '______TAB%COL%';
   OR OBJECTS_NAME LIKE 'U%TAB%COL%';
   
 -- BUSCANDO OS DADOS DE UMA VIEW RELACIONADA ÀS TABELAS E COLUNAS
 SELECT COUNT(*) -- TODAS AS COLUNA QUE O USUÁRIO LOGADO PODE VER
 FROM USER_TAB_COLUMNS;
 
 -- CRIANDO TABELAS E REGRAS
 DROP TABLE TA1 CASCADE CONSTRAINT; -- ELIMINANDO A TABELA TA1
 
 -- RECRIANDO A TABELA TA1
 CREATE TABLE TA1
 (
 C1     NUMBER, -- CONSTRAINT PK_TA1 PRIMARY KEY
 C2     CHAR    NOT     NULL,
 C3     VARCHAR2(100),
 CONSTRAINT PK_TA1 PRIMARY KEY (C1,C2)
 );
 
 -- VERIFICANDO A TABELA CRIADA NO DD (DICIONÁRIO DE DADOS/CATÁLOGO)
 DESC TA1; -- DESCREVE A ESTRUTURA DA TABELA/VIEW
 
 SELECT *
 FROM USER_TABLES
 WHERE TABLE_NAME='TA1';
 
 -- VERIFICANDO AS COLUNAS DA TABELA/VIEW
 SELECT *
 FROM USER_TAB_COLUMNS
 WHERE TABLE_NAME='TA1';
 
  -- VERIFICANDO AS REGRAS (CONSTRAINTS) TABELA/VIEW
 SELECT *
 FROM USER_CONSTRAINTS
 WHERE TABLE_NAME='TA1';
 
 -- VERIFICANDO AS REGRAS (CONSTRAINTS) APLICADAS EM QUAL COLUNA DA TABELA/VIEW
SELECT *
FROM USER_CONS_COLUMNS
WHERE TABLE_NAME='TA1';
 
  -- VERIFICANDO ÍNDICES DA TABELA/VIEW
 SELECT *
 FROM USER_INDEXES
 WHERE TABLE_NAME='TA1';
 
-- VERIFICANDO AS COLUNAS DE ÍNDICES DA TABELA/VIEW
SELECT *
FROM USER_IND_COLUMNS
WHERE TABLE_NAME='TA1';


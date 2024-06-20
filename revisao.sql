/*
1) Fazer uma query para selecionar as publicações existentes na biblioteca.
Mostrar: Nome do autor (AUTOR), título do livro (TITULO), cidade de publicação (CIDADE),
edição (ED), unidade de federação (UF) e ano da publicação (ANO).
Ordenação: Decrescente pelo nome do autor e ascendente pelo ano de publicação.
*/

/*
2) Fazer uma query para selecionar a quantidade de empréstimo sem devolução por usuário.
Mostrar: Nome do usuário (USUARIO) e QDE_ESD.
Ordenação: Decrescente pela quantidade de empréstimo sem devolução (QDE_ESD).
*/

/*
3) Fazer uma query para selecionar os bibliotecários que não realizaram empréstimos na biblioteca.
Mostrar: O código do bibliotecário (CODIGO) e o nome do bibliotecário (BIBLIOTECARIO).
Ordenação: Ascendente pelo código do bibliotecário.
*/

/*
4) Fazer uma query para selecionar os livros com situações disponível.
Mostrar: O código e observações dos livros.
Ordenação: Ascendente pelo código dos livros.
*/

/*
5) Fazer uma query para selecionar os empréstimos sem devolução (sem data de devolução
preenchida, significa não devolvido).
Mostrar: Nome do usuário (USUARIO), nome do bibliotecário (BIBLIOTECARIO), código do livro (LIVRO)
e a data de empréstimo (DATA_EMPRESTIMO).
Ordenação: Crescente pelo nome do usuário.
*/

/*
MER FÍSICO DO BANCO DE DADOS

USUARIO                                            EMPRESTIMO
CODIGO  NUMBER    <pk>        FK_EMPR_USUARIO      CODIGO          NUMBER      <pk>   not null
NOME    VARCHAR2(80)                               DT_EMPRESTIMO   DATE               not null
                                                   DT_DEVOLUCAO    DATE               null
BIBLIOTECARIO                                      OBESVACOES      VARCHAR2(200)      null
CODIGO  NUMBER    <pk>    FK_EMPR_BIBLIOTECARIO    CD_USR          NUMBER      <fk2>  not null
NOME    VARCHAR2(80)                               CD_BIB          NUMBER      <fk3>  not null
                                                   CD_LIV          NUMBER      <fk1>  not null
                                                   
                                                   FK_EMPR_LIVRO
                                                   
AUTOR                                              LIVRO
CODIGO  NUMBER  <pk>  not null                     CODIGO       NUMBER         <pk>
NOME    VARCHAR2(80)  not null                     VOLUME       VARCHAR2(3)
                                                   PAGINAS      NUMBER(3)
                                                   SITUACAO     VARCHAR2(500)
                                                   OBSERVACOES  VARCHAR2(500)
                                                   CD_PUB       NUMBER          <fk>
                                                   
FK_PUB_AUTOR                                       FK_LIVRO_PUBLICACAO

                                                   PUBLICACAO
                                                   CODIGO          NUMBER          <pk>   not null                      TITULO
                                                   ANO             VARCHAR2(4)            not null     FK_PUB_TITULO    CODIGO      NUMBER          <pk>
                                                   EDICAO          NUMBER(2)              not null                      DESCRICAO   VARCHAR2(100)
                                                   AREA            VARCHAR2(50)           null
                                                   RESUMO          VARCHAR2(2000)         null                          CIDADE
                                                   CD_TIT          NUMBER          <fk2>  not null     FK_PUB_CIDADE    CODIGO  NUMBER        <pk>
                                                   CD_CID          NUMBER          <fk1>  not null                      NOME    VARCHAR2(60)
                                                   CD_AUT          NUMBER          <fk3>  not null                      UF      VARCHAR2(2)
*/

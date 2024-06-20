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
CODIGO  NUMBER    <pk>  <-----FK_EMPR_USUARIO----  CODIGO          NUMBER      <pk>  not null
NOME    VARCHAR2(80)                               DT_EMPRESTIMO   DATE              not null
                                                   DT_DEVOLUCAO    DATE              null
BIBLIOTECARIO                                      OBESVACOES      VARCHAR2(200)     null
CODIGO  NUMBER    <pk> <--FK_EMPR_BIBLIOTECARIO--  
NOME    VARCHAR2(80)
*/

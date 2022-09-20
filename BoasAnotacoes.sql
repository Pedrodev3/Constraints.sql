-- Select -> Comando para recuperar dados de uma ou mais tabelas

-- Se quiser recuperar o dia da semana que vc nasceu

SELECT TO_CHAR(TO_DATE('03/06/2004', 'DD/MM/YYYY'), 'DAY') FROM T_SIP_DEPTO;

-- Para ordenar as colunas de uma tabela a partir da ordem crescente (ASC) e descrescente (DESC)
-- Se quiser organizar em 1 ou mais colunas na tabela � s� colocar o n�mero que quiser

SELECT * FROM T_SIP_DEPTO ORDER BY 1 ASC;


-- Sequences -> CREATE, ALTER  e DROP. S�o objetos usados para gerar valores de auto numera��o, 
-- onde se poder definir valores iniciais e seus incrementos

CREATE SEQUENCE SQ_T_SIP_DEPTO
START WITH 16
INCREMENT BY 1
MAXVALUE 20
NOCYCLE;

-- CYCLE -> Valor da coluna � regenerado do MINVALUE a partir do momento que o MAXVALUE � alcan�ado. 
-- Essa op��o n�o deve ser usada quando a SEQUENCE criada vem de uma coluna com primary key

-- NOCYCLE -> Valores da coluna n�o s�o regenerados do MINVALUE quando um MAXVALUE � alcan�ado.


-- NEXTVAL -> Retorna o pr�ximo valor livre da SEQUENCE. Ele � feito para sempre atualizar o valor da coluna para o pr�ximo da sequence
-- CURRVAL -> Para usar CURRVAL � necess�rio que antes tenha sido usado o NEXTVAL na mesma sess�o. 
-- Pois ele mostra o valor atual da sequence mas n�o faz essa atualiza��o que ocorre no NEXTVAL.
-- Lembre-se que o valor do CURRVAL s� ir� mudar ap�s o uso do NEXTVAL, ent�o fa�a sem medo

INSERT INTO T_SIP_DEPTO(CD_DEPTO, NM_DEPTO, SG_DEPTO, ST_DEPTO)
VALUES (SQ_T_SIP_DEPTO.NEXTVAL, 'Marketing Digital', 'DMG', 'A');

-- Lembre-se do que est� sendo feito:
-- Est� sendo inserido nas c�lulas da coluna os respectivos valores:
-- A chave prim�ria e estrangeira da tabela
-- Com um atributo para nome
-- Um atributo para sigla
-- E um atributo para status
-- Est� sendo utilizando esse comando NEXTVAL para sempre atualizar para esse novo valor



-- Constraints -> Caso tenha d�vida, constraints s�o basicamente restri��es que voc� estabelece para uma coluna no banco de dados, 
-- para verifica��o de integridade. Lembre-se que Constraints fazem parte dos comandos DML.
-- Exemplos de Constraints:

-- Primary Key (PK) = Est� restri��o cria um �ndice �nico para um conjunto de colunas ou uma coluna para Chave Primaria.
-- Unique = Est� Contraint determina que uma coluna n�o poder� ter 2 linhas com o mesmo valor.
-- Foreign Key (FK ou Chave Estrangeira) = Determina uma coluna ou um conjunto de colunas que possuem valores em outras tabelas, 
-- referente a uma refer�ncia ou um relacionamento.
-- Check = Especifica a condi��o que a coluna precisa para salvar o registro.
-- Not Null = Determina que a coluna tem preenchimento obrigat�rio.



-- Select -> Comando para recuperar dados de uma ou mais tabelas

-- Se quiser recuperar o dia da semana que vc nasceu

SELECT TO_CHAR(TO_DATE('03/06/2004', 'DD/MM/YYYY'), 'DAY') FROM T_SIP_DEPTO;

-- Para ordenar as colunas de uma tabela a partir da ordem crescente (ASC) e descrescente (DESC)
-- Se quiser organizar em 1 ou mais colunas na tabela é só colocar o número que quiser

SELECT * FROM T_SIP_DEPTO ORDER BY 1 ASC;


-- Sequences -> CREATE, ALTER  e DROP. São objetos usados para gerar valores de auto numeração, 
-- onde se poder definir valores iniciais e seus incrementos

CREATE SEQUENCE SQ_T_SIP_DEPTO
START WITH 16
INCREMENT BY 1
MAXVALUE 20
NOCYCLE;

-- CYCLE -> Valor da coluna é regenerado do MINVALUE a partir do momento que o MAXVALUE é alcançado. 
-- Essa opção não deve ser usada quando a SEQUENCE criada vem de uma coluna com primary key

-- NOCYCLE -> Valores da coluna não são regenerados do MINVALUE quando um MAXVALUE é alcançado.


-- NEXTVAL -> Retorna o próximo valor livre da SEQUENCE. Ele é feito para sempre atualizar o valor da coluna para o próximo da sequence
-- CURRVAL -> Para usar CURRVAL é necessário que antes tenha sido usado o NEXTVAL na mesma sessão. 
-- Pois ele mostra o valor atual da sequence mas não faz essa atualização que ocorre no NEXTVAL.
-- Lembre-se que o valor do CURRVAL só irá mudar após o uso do NEXTVAL, então faça sem medo

INSERT INTO T_SIP_DEPTO(CD_DEPTO, NM_DEPTO, SG_DEPTO, ST_DEPTO)
VALUES (SQ_T_SIP_DEPTO.NEXTVAL, 'Marketing Digital', 'DMG', 'A');

-- Lembre-se do que está sendo feito:
-- Está sendo inserido nas células da coluna os respectivos valores:
-- A chave primária e estrangeira da tabela
-- Com um atributo para nome
-- Um atributo para sigla
-- E um atributo para status
-- Está sendo utilizando esse comando NEXTVAL para sempre atualizar para esse novo valor



-- Constraints -> Caso tenha dúvida, constraints são basicamente restrições que você estabelece para uma coluna no banco de dados, 
-- para verificação de integridade. Lembre-se que Constraints fazem parte dos comandos DML.
-- Exemplos de Constraints:

-- Primary Key (PK) = Está restrição cria um índice único para um conjunto de colunas ou uma coluna para Chave Primaria.
-- Unique = Está Contraint determina que uma coluna não poderá ter 2 linhas com o mesmo valor.
-- Foreign Key (FK ou Chave Estrangeira) = Determina uma coluna ou um conjunto de colunas que possuem valores em outras tabelas, 
-- referente a uma referência ou um relacionamento.
-- Check = Especifica a condição que a coluna precisa para salvar o registro.
-- Not Null = Determina que a coluna tem preenchimento obrigatório.



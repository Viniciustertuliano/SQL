--Aula 01 06/02/2020
select getdate()
--Inserindo "---" comentario

/*
Comentario em bloco
selecionar cada programa passo a passo
*/

--Tecla comentario CTRL + KC
--sql serve como SELECT GETDATE(), select getdate() ou SELECT GetDate()
--CTRL + R deixar de exibir o resultado

--Criando o banco de dados

CREATE DATABASE AULA01

--EXPERIMENTANDO AS TABELAS DO
--FIT_ALUNOS

SELECT * FROM E_EMPRESA

--EXERCICIO: VERIFICAR O REGISTRO DAS TABELA E_EVENTO, E_LOCAL, FABRICANTE E FT_ESTADIO
--QUANTOS REGISTROS CADAS TABELA POSSUI

SELECT * FROM E_EVENTO
--2 linhas

SELECT * FROM E_LOCAL
--1 linhas

SELECT * FROM FABRICANTE
--9 linhas

SELECT * FROM FT_ESTADIO
--6 linhas

--AULA 02 13/02/2020

--ENTRANDO NO DATABASE

USE master
USE fit_alunos

SELECT * FROM fit_alunos.dbo.FT_ESTADIO -- 6 resultados

--CRIANDO TABELAS

CREATE TABLE TB_IMPACTA
(
	NOME_ALUNO	CHAR(50)
)

 --CONSULTADO A TABELA CRIADA
SELECT * FROM TB_IMPACTA

--VERIFICANDO A ESTRUTURA DA TABELA

SP_HELP TB_IMPACTA

---INSERINDO VALORES NA TABELA

INSERT INTO TB_IMPACTA
(NOME_ALUNO)
VALUES
('ABNER PORTO'),
('JAIR PORTO')

SELECT * FROM TB_IMPACTA

--EXERCICIO AULA 13.02

CREATE TABLE TB_AULA02
(

CIDADE CHAR(30)

)

INSERT INTO TB_AULA02
(CIDADE)
VALUES
('São Paulo'),
('Rio de Janeiro')

SELECT * FROM TB_AULA02

--DROP TABLE - EXCLUIR TABELA

/*
CRIANDO UMA TABELA COM CAMPO DE AUTO NUMERAÇÃO E
COM CHAVE PRIMÁRIA.
*/


CREATE TABLE UF
	(
		ID_UF INT IDENTITY,
		UF CHAR(30)
	)

INSERT INTO UF
	(UF)
VALUES
	('SÃO PAULO'),
	('RIO DE JANEIRO')

SELECT * FROM UF

-- DELETAR TODOS OS REGISTROS DA TABELA
-- OBS: A CONTAGEM DO ID NÃO É ZERADA, DANDO CONTINUIDADE AO INSERIR NOVOS DADOS.

DELETE UF

-- CRIANDO TABELA COM CHAVE PRIMARIA

CREATE TABLE TB_SI_E_ADS
(

	COD_ALUNO INT,
	NOME_ALUNO CHAR(30)
	
	-- CONFIGURAÇÃO CHAVE PRIMARIA E RESTRIÇÃO DE DUPLICIDADE
	CONSTRAINT PK_COD_ALUNO PRIMARY KEY (COD_ALUNO)
)

INSERT INTO TB_SI_E_ADS
(COD_ALUNO, NOME_ALUNO)
VALUES

(1800074,'Beltrano')

SELECT * FROM TB_SI_E_ADS


/*
UML: UNIFYING MODELING LANGUAGE
________________________
|	   TB_CADASTRO     |
________________________
|COD_CLIENTE INT       |
|NOME_CLIENTE CHAR(30) |
|TELEFONE BIGINT	   |
________________________
OBS: COD_CLIENTE (PK)
*/

CREATE TABLE TB_CADASTRO
	(
		COD_CLIENTE INT,
		NOME_CLIENTE CHAR(30),
		TELEFONE BIGINT
		-- CHAVE PRIMARIA E RESTRIÇÃO DE DUPLICIDADE
		CONSTRAINT PK_COD_CLIENTE PRIMARY KEY (COD_CLIENTE)
	)

INSERT INTO TB_CADASTRO
	(COD_CLIENTE,NOME_CLIENTE,TELEFONE)
VALUES
	(4,'TESTE',46578000)


SELECT * FROM TB_CADASTRO

SP_HELP TB_CADASTRO

--20/02/2020

--clustered    1.Performance
--unique       2.Não repete
--primary key  3.Abre uma porta para uma foreign key

--non clustered 

--Foreign key

CREATE TABLE TB_FUNC
(
	COD_FUNC	INT,
	NOME_FUNC	CHAR(30)

	CONSTRAINT PK_FUNC PRIMARY KEY(COD_FUNC)
)

INSERT INTO TB_FUNC
(COD_FUNC, NOME_FUNC)
VALUES 
(1000, 'JÓSE'),
(2000, 'MARIA')

CREATE TABLE TB_DEPN
(
	COD_DEPN	INT, 
	NOME_DEPN	CHAR(30),
	COD_FUNC	INT

	CONSTRAINT PK_COD_DEPN PRIMARY KEY (COD_DEPN),
	CONSTRAINT FK_COD_FUNC FOREIGN KEY (COD_FUNC)
	REFERENCES TB_FUNC(COD_FUNC)
)

INSERT INTO TB_DEPN
(COD_DEPN,NOME_DEPN, COD_FUNC)
VALUES
(1000,'jOSÉ JUNIOR', 1000),
(2000, 'MARIO BROS',2000),
--(3000,'ORFÃO',3000)

SELECT * FROM TB_DEPN

--CRIAR TABELA DE VEICULOS 
--COD_VEIC (PK)	BIGINT
--NOME_VEIC		VARCHAR(50)

--CRIAR TABELA DE MULTAS
--COD_MULTA(PK)		BIGINT
--VALOR_MULTA		MONEY
--COD_VEICULO(FK)	BIGINT

--ESTABELECER RELACIONAMENTO ENTRE AS DUAS TABELAS

CREATE TABLE TB_VEICULOS
(
	COD_VEIC	BIGINT,
	NOME_VEIC	VARCHAR(30)

	CONSTRAINT PK_COD_VEIC PRIMARY KEY(COD_VEIC)
)

INSERT INTO TB_VEICULOS
(COD_VEIC, NOME_VEIC)
VALUES
(1000, 'FOX'),
(2000, 'GOL')

CREATE TABLE TB_MULTA
(
	COD_MULTA		BIGINT,
	VALOR_MULTA		MONEY,	
	COD_VEIC		BIGINT

	CONSTRAINT PK_COD_MULTA PRIMARY KEY (COD_MULTA),
	CONSTRAINT FK_COD_VEIC FOREIGN KEY (COD_VEIC)
	REFERENCES TB_VEICULOS(COD_VEIC)
)

INSERT INTO TB_MULTA
(COD_MULTA,VALOR_MULTA,COD_VEIC)
VALUES
(1000,100.00,1000),
(2000,500.00,2000),
--(3000,350.00,3000)

--CRIAR A ESTRUTURA DE UM RESTAURANTE (CARDÁPIO + COMANDA)
--NA TABELA DE CARDÁPIO, COLOCAR: COD_PRAT + NOME_PRATO + VALOR_PRATO
--NA TABELA DE COMANDA, COLOCAR, COD_PRATO + DATA_PEDIDO
--FORMATO DATA: AAAA-MM-DD

CREATE TABLE TB_CARDAPIO
(
	COD_PRAT	INT,
	NOME_PRAT	VARCHAR (30),
	VALOR_PRAT	MONEY

	CONSTRAINT PK_COD_PRAT PRIMARY KEY(COD_PRAT)
)



INSERT INTO TB_CARDAPIO
(COD_PRAT,NOME_PRAT,VALOR_PRAT)
VALUES
(10,'FEIJOADA',25.00),
(20,'LASANHA',20.00)

CREATE TABLE TB_COMANDA
(	COD_PRATO		INT,
	DATA_PEDIDO		DATE
	
	CONSTRAINT FK_COD_PRAT FOREIGN KEY(COD_PRATO)
	REFERENCES TB_CARDAPIO(COD_PRAT)

)

INSERT INTO TB_COMANDA
(COD_PRATO,DATA_PEDIDO)
VALUES
(10,'2020-02-20'),
(20,'2020-02-19'),
(30,'2020-02-19')

SELECT * FROM TB_COMANDA


--27/02/2020

CREATE TABLE TB_CLIMA
(
	ID_CLIMA	INT,
	DESCRIÇÃO	CHAR(50)
)

DROP TABLE TB_CLIMA

INSERT INTO TB_CLIMA
(ID_CLIMA, DESCRIÇÃO)
VALUES
(2000, '')

SELECT * FROM TB_CLIMA

CREATE TABLE TB_CLIMA2
(
	ID_CLIMA	INT,
	DESCRICAO	CHAR(50) NOT NULL
)

INSERT INTO TB_CLIMA2
(ID_CLIMA , DESCRICAO)
VALUES
(1000, 'TEMPO GELADO')

INSERT INTO TB_CLIMA2
( DESCRICAO )
VALUES
( 'TEMPO MUITO GELADO' )

INSERT INTO TB_CLIMA2
( ID_CLIMA )
VALUES
( 3000 )

--EXERCICIO: CRIAR UMA TABELA DE TIMES, CONTENDO OS CAMPOS:
--ID_BID		(CAMPO DE AUTO NUMERAÇÃO)
--CNPJ_TIME		(NÃO ACEITA NULOS)
--NOME_TIME		(NÃO ACEITA NULOS)
--QTD_TITULOS		(ACEITA NULOS)

CREATE TABLE TB_TIMES
(
	ID_BID			INT IDENTITY,
	CNPJ_TIME		BIGINT NOT NULL,
	NOME_TIME		CHAR(20) NOT NULL,
	QTD_TITULOS		INT
)

DROP TABLE TB_TIMES


--PRIMEIRO ERRO: TENTAR INSERIR VALOR A COLUNO COM IDENTITY
INSERT INTO TB_TIMES
(ID_BID, CNPJ_TIME,NOME_TIME, QTD_TITULOS)
VALUES
(301,123450001, 'TIME', 3)

--INSERT CORRETO
INSERT INTO TB_TIMES
(CNPJ_TIME, NOME_TIME, QTD_TITULOS)
VALUES
(302,'TIME2', 3)

--SEGUNDO ERRO: TENTAR INSERIR UM VALOR CHAR MAIOR QUE O TAMANHO DO PARAMETRO
INSERT INTO TB_TIMES
(CNPJ_TIME, NOME_TIME, QTD_TITULOS)
VALUES
(304, 'KLSJEFGNSKLJERNGOOSERNGSERG' , 3)

--TERCEIRO TIPO DE ERRO: ESTOURO DA VARIÁVEL NUMÉRICA 
   INSERT INTO TB_TIMES
(CNPJ_TIME, NOME_TIME, QTD_TITULOS)
VALUES
(9223372036854775808, 'SPFC' , 3)

SELECT * FROM TB_TIMES

--EXERCICIO: APAGAR A TABELA ACIMA E CRIAR COM AS MESMAS CONDIÇÕES,
--ALTERANDO APENAS O CAMPO CNPJ PARA UNIQUE

DROP TABLE TB_TIMES

--EXERCICIO: CRIAR UMA TABELA DE TIMES, CONTENDO OS CAMPOS:
--ID_BID		(CAMPO DE AUTO NUMERAÇÃO)
--CNPJ_TIME		(NÃO ACEITA NULOS) + (CAMPO SEM DUPLICIDADE)
--NOME_TIME		(NÃO ACEITA NULOS)
--QTD_TITULOS		(ACEITA NULOS)

CREATE TABLE TB_TIMES
(
	ID_BID			INT IDENTITY,
	CNPJ_TIME		BIGINT NOT NULL ,
	NOME_TIME		CHAR(20) NOT NULL,
	QTD_TITULOS		INT
	CONSTRAINT UQ_TIMES_CNPJ UNIQUE(CNPJ_TIME) 
)

--PRIMEIRO ERRO: TENTAR INSERIR VALOR A COLUNO COM IDENTITY
INSERT INTO TB_TIMES
(ID_BID, CNPJ_TIME,NOME_TIME, QTD_TITULOS)
VALUES
(301,123450001, 'TIME', 3)

--INSERT CORRETO
INSERT INTO TB_TIMES
(CNPJ_TIME, NOME_TIME, QTD_TITULOS)
VALUES
(302,'TIME2', 3)

--SEGUNDO ERRO: NÃO É POSSIVEL INSERIR UM ELEMENTO REPETIDO NO CAMPO CNPJ
INSERT INTO TB_TIMES
(CNPJ_TIME, NOME_TIME, QTD_TITULOS)
VALUES
(302,'TIME2', 3)

--TERCEIRO ERRO: TENTAR INSERIR UM VALOR CHAR MAIOR QUE O TAMANHO DO PARAMETRO
INSERT INTO TB_TIMES
(CNPJ_TIME, NOME_TIME, QTD_TITULOS)
VALUES
(304, 'KLSJEFGNSKLJERNGOOSERNGSERG' , 3)

--QUARTO ERRO: ESTOURO DA VARIÁVEL NUMÉRICA 
INSERT INTO TB_TIMES
(CNPJ_TIME, NOME_TIME, QTD_TITULOS)
VALUES
(9223372036854775808, 'SPFC' , 3)

SELECT * FROM TB_TIMES

--CONSTRAINT DEFAULT

DROP TABLE TB_TIMES

CREATE TABLE TB_TIMES
(
	ID_BID			INT IDENTITY,
	CNPJ_TIME		BIGINT NOT NULL ,
	NOME_TIME		CHAR(20) NULL DEFAULT 'TRICOLOR',
	QTD_TITULOS		INT	DEFAULT 150
	CONSTRAINT UQ_TIMES_CNPJ UNIQUE(CNPJ_TIME) 
)

INSERT INTO TB_TIMES
(CNPJ_TIME,QTD_TITULOS)
VALUES
(302,NULL)

SELECT * FROM TB_TIMES

SP_HELP TB_TIMES

--CONSTRAINT CHECK

CREATE TABLE TB_CADASTRO_DATA
(
	CPF				BIGINT,
	DATA_CADASTRO	DATE,

	CONSTRAINT CK_DATA CHECK (DATA_CADASTRO >= '2020-02-26')
)

INSERT INTO TB_CADASTRO_DATA
(CPF, DATA_CADASTRO)
VALUES
(317, '2020-02-01')

--EXERCICIO:
--CRIAR TABELA DE CLIENTES, CONTENDO OS CAMPOS
--1.CPF		(NÃO PERMITE DUPLICIDADE)
--2.NOME		(NÃO PERMITE NULOS)
--3.DATA_NASC	(NÃO PERMITE VALORES ANTERIORES AO ANO 2000)
--4.PROFISSÃO	(CASO NÃO PREENCHA NADA, INSERIR'DBA')


CREATE TABLE TB_CLIENTES
(
	CPF			BIGINT, 
	NOME		VARCHAR(30) NOT NULL,
	PROFISSÃO	VARCHAR(25) NULL DEFAULT 'DBA',
	DATA_NASC	DATE,
	

	CONSTRAINT UQ_CLI_CPF UNIQUE(CPF),
	CONSTRAINT CK_DATA_NASC CHECK (DATA_NASC >= '2000-01-01')
	
)

--INSERT CORRETO 
INSERT INTO TB_CLIENTES
(CPF, NOME, DATA_NASC, PROFISSÃO)
VALUES
(48161546800,'VINICIUS','2000-02-05', 'MONITOR')

--1° ERRO DE DUPLICIDADE NO CAMPO CPF
INSERT INTO TB_CLIENTES
(CPF, NOME, DATA_NASC, PROFISSÃO)
VALUES
(48161546800,'VINICIUS','2000-02-05', 'MONITOR')

--2° ERRO DE CAMPO NOME VAZIO 
INSERT INTO TB_CLIENTES
(CPF, DATA_NASC, PROFISSÃO)
VALUES
(48161546800,'2000-02-05', 'MONITOR')

--3° ERRO NÃO PERMITE VALORES MENORES QUE 2000 
INSERT INTO TB_CLIENTES
(CPF, NOME,DATA_NASC, PROFISSÃO)
VALUES
(48161546900,'THAYNA','1999-01-05', 'MONITOR')

--4° ERRO CAMPO PROFISSÃO VAZIO PREENCHA DBA 
INSERT INTO TB_CLIENTES
(CPF, NOME,DATA_NASC )
VALUES
(48161567900,'CECILIA','2017-01-05')

SELECT * FROM TB_CLIENTES

USE PEDIDOS

-- COMANDOS DE SELECT
SELECT	*
FROM	TB_EMPREGADO

-- SELECT UTILIZANDO APENAS AS COLUNAS DESEJADAS
-- + INSERINDO O COMANDO ALIAS
SELECT		NOME, SALARIO, DATA_ADMISSAO, 'SANTANDER' AS FUNC
FROM		TB_EMPREGADO

SELECT		NOME, SALARIO, DATA_ADMISSAO, DATA_NASCIMENTO ,
			GETDATE() AS DATA_REL,
			COD_CARGO
FROM		TB_EMPREGADO

-- RETORNANDO APENAS UMA QUANTIDADE "N" DE LINHAS EM UMA CONSULTA
SELECT		TOP 10
					NOME, SALARIO, SINDICALIZADO
FROM			TB_EMPREGADO

-- RETORNO CONSIDERANDO UMA DETERMINADA ORDEM DE SAÍDA
-- EXEMPLO: RETORNAR OS NOMES EM ORDEM ALFABETICA
SELECT		NOME, SALARIO, DATA_ADMISSAO
FROM		TB_EMPREGADO
ORDER BY	NOME 

-- EXEMPLO: ORDENANDO PELO SALARIO PRIMEIRO E DEPOIS POR NOME
SELECT		NOME, SALARIO, DATA_ADMISSAO
FROM		TB_EMPREGADO
ORDER BY	SALARIO, NOME

-- ORDENAÇÃO EM ORDEM CRESCENTE E DECRESCENTE
-- SE EU NÃO INSERIR NENHUM COMANDO, O DEFAULT É CRESCENTE
SELECT		NOME, SALARIO, DATA_ADMISSAO
FROM		TB_EMPREGADO
ORDER BY	SALARIO ASC, NOME ASC

-- ORDENANDO EM ORDEM DECRESCENTE
SELECT		NOME, SALARIO, DATA_ADMISSAO
FROM		TB_EMPREGADO
ORDER BY	SALARIO DESC, NOME ASC

-- ORDENANDO POR UM CAMPO QUE NÃO ESTÁ NA CLÁUSULA SELECT
SELECT		NOME, SALARIO, DATA_ADMISSAO, SINDICALIZADO
FROM		TB_EMPREGADO
ORDER BY	SINDICALIZADO

-- CRIANDO RANKINGS NO RETORNO DAS CONSULTAS
-- UM RANKING É A SOMA DE ORDENAÇÃO COM QUANTIDADE DE REGISTROS
-- RETORNADOS. POR EXEMPLO: UM PÓDIUM DE FÓRMULA 1
-- COMO RETORNAR ORDENAÇÃO: ORDER BY
-- COMO RETORNAR OS "N" PRIMEIROS REGISTROS: TOP N
-- OU SEJA, UM RANKING NO SQL É FORMADO POR TOP + ORDER BY
-- EXEMPLO: TRAZER OS 5 FUNCIONÁRIOS COM MENOR SALÁRIO
-- + COMANDO ADICIONAL: WITH TIES
SELECT		TOP 8 --WITH TIES
			NOME, SALARIO, DATA_NASCIMENTO
FROM		TB_EMPREGADO
WHERE		SALARIO IS NOT NULL
ORDER BY	SALARIO ASC

-- RETORNANDO REGISTROS DE ACORDO COM UMA CONDIÇÃO
-- CLÁUSULA WHERE
-- + OPERADORES RELACIONAIS ( > , >= , < , <= , = , <> , != )
SELECT		*
FROM		TB_EMPREGADO
WHERE		CODFUN = 1

SELECT		*
FROM		TB_EMPREGADO
WHERE		CODFUN <> 1

-- EXEMPLO: RETORNAR FUNCIONÁRIOS QUE POSSUAM SALARIO ACIMA DE 3000
SELECT		* 
FROM		TB_EMPREGADO
WHERE		SALARIO > 3000

-- POSSO COMPARAR UM CAMPO COM OUTRO DA TABELA
SELECT		TOP 3 * -- * = TODOS OS CAMPOS 
FROM		TB_EMPREGADO
WHERE		SALARIO < PREMIO_MENSAL

-- RETORNANDO MULTIPLOS VALORES DE UM MESMO CAMPO EM UMA CLÁUSULA WHERE
-- EXEMPLO: RETORNAR TODOS OS FUNCIONÁRIOS DOS CARGOS 10, 11, 12, 13, 14
-- CLÁUSULA: IN
SELECT		*
FROM		TB_EMPREGADO
WHERE		COD_CARGO IN ( 10 , 11 , 12 , 13 , 14 )

-- EXEMPLO: RETORNAR OS FUNCIONÁRIOS COM NUM. DEPENDENTES IGUAL A 0 OU 2
SELECT		*
FROM		TB_EMPREGADO
WHERE		NUM_DEPEND IN ( 0 , 2 )
-- 48 LINHAS DE RETORNO
-- ALTERAR A CONSULTA ACIMA PARA RETORNAR AS DEMAIS CONDIÇÕES
-- TODOS QUE SÃO DIFERENTES DE 0 E DE 2
SELECT		*
FROM		TB_EMPREGADO
WHERE		NUM_DEPEND NOT IN ( 0 , 2 )
-- 12 LINHAS DE RETORNO

-- ENTENDENDO ONDE ESTÁ O REGISTRO FALTANTE
SELECT		*
FROM		TB_EMPREGADO
ORDER BY	NUM_DEPEND
-- ESTÁ NO REGISTRO NULO

-- + OPERADORES LÓGICOS ( AND , OR )
-- AND: SOMAR CONDIÇÕES, EXCLUINDO MAIS LINHAS DO RETORNO (OU RESTRINGE)
-- OR:  ALTERNAR CONDIÇÕES, INSERINDO MAIS LINHAS NO RETORNO

-- EXEMPLO: RETORNAR TODOS OS FUNCIONÁRIOS DO CARGO 14 E QUE POSSUAM
-- SALARIO ACIMA DE 2000
SELECT		*
FROM		TB_EMPREGADO
WHERE		COD_CARGO      = 14
  AND		PREMIO_MENSAL  > 500

-- EXEMPLO: RETORNAR TODOS OS FUNCIONÁRIOS QUE SEJAM DO DEPTO MAIOR QUE 5
-- OU QUE SEJAM SINDICALIZADOS
SELECT		*
FROM		TB_EMPREGADO
WHERE		COD_DEPTO > 5
  OR		SINDICALIZADO = 'S'

-- AULA 02 ABRIL 2020...

 -- IMPORTANDO UM BANCO DE DADOS
 USE PEDIDOS
 
 -- OPERADORES AULA PASSADA: RELACIONAIS (> , < ... ) E LÓGICOS (AND E OR)

 -- OPERADORES DESTA AULA: OPERADORES MATEMÁTICOS ( + , - , / ,  * )
 SELECT TOP 3 * FROM TB_EMPREGADO

 -- EXEMPLO: SOMAR UM DETERMINADO VALOR (500) NO CAMPO PREMIO_MENSAL
 SELECT		TOP 10 
			NOME, PREMIO_MENSAL, PREMIO_MENSAL + 500 AS NOVO_PREMIO_MENSAL
 FROM		TB_EMPREGADO

 -- EXEMPLO: SUBSTRAIR 100 NO SALARIO DE TODOS OS FUNCIONÁRIOS DO COD_CARGO > 10
 SELECT		NOME, SALARIO, SALARIO - 100 AS NOVO_SALARIO, COD_CARGO
 FROM		TB_EMPREGADO
 WHERE		COD_CARGO > 10

 -- EXERCICIO: DAR AUMENTO DE 10% EM TODOS OS FUNCIONÁRIOS QUE SEJAM SINDICALIZADOS
 -- DICA: VARIÁVEL + (VARIÁVEL * 0.10) OU VARIÁVEL * 1.10
  SELECT TOP 3 * FROM TB_EMPREGADO WHERE SALARIO = 600

  SELECT		NOME, SALARIO, SINDICALIZADO,  
				SALARIO + (SALARIO * 0.10)	AS NOVO_SAL01,
				SALARIO * 1.10				AS NOVO_SAL02
  FROM			TB_EMPREGADO
  WHERE			SINDICALIZADO = 'S'

 -- UTILIZANDO WHERE COM MÚLTIPLAS CONDIÇÕES
  -- EXEMPLO DE CONDIÇÃO: CAMPO DE DATA
 SELECT * FROM TB_PEDIDO
 ORDER BY DATA_EMISSAO
  -- BUSCAR PEDIDOS COM DATA DE EMISSÃO NO ANO DE 2014
 SELECT		*
 FROM			TB_PEDIDO
 WHERE		DATA_EMISSAO >= '2014-01-01'-- FORMATO DE DATA NO SQL: 'AAAA-MM-DD'
 AND			DATA_EMISSAO <= '2014-12-31'
-- COMANDO BETWEEN: SELECIONA UMA RANGE DE VALORES ENTRE O LIMITE 01 E O LIMITE 02
SELECT		*
 FROM			TB_PEDIDO
 WHERE		DATA_EMISSAO BETWEEN '2014-01-01' AND '2014-12-31'
  -- FUNÇÕES DE DATA: SEPARAR ELEMENTOS DE UM CAMPO DE DATA
 -- YEAR(CAMPO): RETORNA O VALOR DO ANO DE UMA DATA
SELECT		*
FROM		TB_PEDIDO
WHERE		YEAR(DATA_EMISSAO) = 2014

-- EXERCICIO: BUSCAR OS PEDIDOS COM VALORES ENTRE 500 E 1500 REAIS E QUE SEJAM PRIMEIRO SEMESTRE DE 2014
SELECT		*
FROM		TB_PEDIDO
WHERE		VLR_TOTAL >= 500 AND VLR_TOTAL <= 1500
--			VLR_TOTAL BETWEEN 500 AND 1500
AND			DATA_EMISSAO BETWEEN '2014-01-01' AND '2014-06-30'

SELECT * FROM TB_PEDIDO
WHERE	DATA_EMISSAO >= '2014-01-01' -- O FORMATO PODE SER: AAAA-DD-MM (FORMATO AMERICANO)
AND		DATA_EMISSAO <= '2014-12-31'

SELECT * FROM TB_PEDIDO
WHERE	DATA_EMISSAO BETWEEN '2014-01-01' AND '2014-12-31'

  -- FUNÇÕES DE DATA: SEPARAR ELEMENTOS DE UM CAMPO DE DATA
 -- YEAR(CAMPO):	RETORNA O VALOR DO ANO DE UMA DATA
 -- MONTH(CAMPO):	RETORNA O VALOR DO MÊS DE UMA DATA
 -- DAY(CAMPO):		RETORNA O VALOR DO DIA DE UMA DATA

 -- UTILIZANDO O EXEMPLO DO EXERCICIO ABAIXO
 -- EXERCICIO: BUSCAR OS PEDIDOS COM VALORES ENTRE 500 E 1500 REAIS E QUE SEJAM PRIMEIRO SEMESTRE DE 2014
SELECT		*
FROM			TB_PEDIDO
WHERE			VLR_TOTAL BETWEEN 500 AND 1500
AND				YEAR(DATA_EMISSAO) = 2014 
AND				MONTH(DATA_EMISSAO) IN ( 01 , 02, 03, 04, 05, 06 )
 

 -- BUSCANDO EM VARIÁVEIS DO TIPO CHAR E VARCHAR
 -- E
 -- BUSCA POR APROXIMAÇÃO
SELECT		*
FROM		TB_EMPREGADO
WHERE		SINDICALIZADO = 'S'

-- COMO RETORNAR OS INTEGRANTES DA FAMILIA SILVA
-- EXEMPLO CLÁSSICO: CENTRAL DE ATENDIMENTO, BUSCAR O NOME ENQUANTO FALA COM O CLIENTE

SELECT		*
FROM			TB_EMPREGADO
WHERE			NOME = 'JOSE REIS'

-- E SE EU QUISESSE BUSCAR TODOS OS NOMES QUE COMECEM COM "JOSE"
-- COMANDO OU EXPRESSÃO: LIKE (BUSCA POR APROXIMAÇÃO NO SQL)
-- CARACTERE PERCENTUAL NO LIKE, SERVE COMO CORINGA, ELE IGNORA O QUE VEM ANTES OU DEPOIS DELE...
SELECT		*
FROM			TB_EMPREGADO
WHERE			NOME LIKE 'JOSE%'
-- E SE EU QUISESSE BUSCAR POR TODAS AS PESSOAS QUE O NOME TENHA JOSE EM QUALQUER PARTE DELE
SELECT		*
FROM			TB_EMPREGADO
WHERE			NOME LIKE '%JOSE%'
-- COMO RETORNAR OS INTEGRANTES DA FAMILIA SILVA
SELECT		*
FROM			TB_EMPREGADO
WHERE			NOME LIKE '%silv%'
-- EXEMPLO: RETORNAR TODOS OS FUNCIONARIOS QUE TENHAM A LETRA "A" NO NOME SEGUIDA DE "B" EM QUALQUER PARTE DELE
SELECT		*
FROM			TB_EMPREGADO
WHERE			NOME LIKE '%A%Z%'
-- ESTANDO EM MAIÚSCULA OU MINÚSCULA, O SQL INTERPRETA DE QQ FORMA. POIS ELE NÃO É CASE SENSITIVE
-- EXERCICIO: BUSCAR TODOS OS INTEGRANTES DA FAMILIA SOUZA (CONSIDERAR TAMBÉM SE O NOME ESTIVER COM S: SOUSA)
SELECT		* 
FROM			TB_EMPREGADO
WHERE			NOME LIKE '%SOUZA%'
   OR			NOME LIKE '%SOUSA%'

-- QUANDO EU TENHO UMA CONDIÇÃO ONDE EXISTE LISTA DE VARIÁVEIS DENTRO DE UM NOME (SOU"S"A OU SOU"Z"A)
-- EU POSSO UTILIZAR OS CARACTERES DE COLCHETE (OPCÕES DENTRO DO LIKE)
SELECT		* 
FROM			TB_EMPREGADO
WHERE			NOME LIKE '%SOU[SZ]A%'

-- DESAFIO PARA VOCÊS: LISTAR TODOS OS NOMES QUE COMECEM COM VOGAIS
@NOME CHAR(30)

SELECT	* 
FROM	TB_EMPREGADO
WHERE	NOME LIKE @NOME

-- VISA:	4...-....-....-....
-- MASTER:	5...-....-....-....

-- LIKE: BUSCA APROXIMADA DE CARACTERES OU BUSCA POSICIONAL...

-- EXEMPLO DE DÚVIDA: PODERIA SER ASSIM? NÃO!
SELECT	*
FROM	TB_EMPREGADO
WHERE	NOME LIKE '%A%E%I%O%U%' 

-- ÚNICO CASO EM QUE RETORNARIA ALGO NESTA CONSULTA
INSERT INTO TB_EMPREGADO
( NOME )
VALUES
('JANA ESPERIDIAO OMENA ULRICH')

 -- EXERCÍCIOS

-- AULA 09 DE ABRIL DE 2020

-- TRABALHANDO COM VARIÁVEIS DE TEXTO, EXPLORANDO AS FUNÇÕES

-- 6 TIPOS DE FUNÇÕES PARA MANIPULAÇÃO DE TEXTO 

-- NO EXCEL, FÓRMULA ESQUERDA: RETORNA OS "N" DIGITOS A ESQUERDA DE UM CAMPO CHAR OU VARCHAR

-- NO SQL, LEFT(CAMPO , N): RETORNA OS "N" DIGITOS A ESQUERDA DE UM CAMPO CHAR OU VARCHAR

-- EXEMPLO: RETORNAR OS 10 DIGITOS A ESQUERDA DO CAMPO NOME DA TABELA DE EMPREGADOS
USE MASTER
USE PEDIDOS

SELECT		LEFT(NOME , 10) AS '10_A_ESQUERDA' , NOME
FROM		TB_EMPREGADO
		
-- RIGHT(CAMPO , N): RETORNA OS "N" DIGITOS A DIREITA DE UM CAMPO CHAR OU VARCHAR
SELECT		RIGHT(NOME , 10) AS '10_A_DIREITA' , NOME
FROM			TB_EMPREGADO
--WHERE			NOME LIKE '%FABIANO%'

-- 123456789

INSERT INTO TB_EMPREGADO
( NOME )
VALUES
( 'FABIANO 123456789' )

-- NECESSIDADE: RETORNAR CARACTERES DO MEIO DA MINHA VARIÁVEL OU DO MEU CAMPO
--'FABIANO ROMEU HENRY PASSOS'

-- EXEMPLO: RETORNAR DA POSIÇÃO 5 ATÉ A POSIÇÃO 10 DE UM CAMPO DE NOME

SELECT TOP 1 * FROM TB_FORNECEDOR

-- SUBSTRING(CAMPO , POS-INI , QTDE_CARACTERES): RETORNAR DO CAMPO, A QTDE DE CARACTERES ESPECIFICADA, PARTINDO DA POSIÇÃO
-- INICIAL

SELECT		SUBSTRING('FABIANO ROMEU HENRY PASSOS', 5 , 5),
					'FABIANO ROMEU HENRY PASSOS'

--123456789012345678901234567890
--FABIANO ROMEU HENRY PASSOS	

-- EXEMPLO: RETORNAR DA POSIÇÃO 5 ATÉ A POSIÇÃO 10 DE UM CAMPO DE NOME
SELECT		NOME,
					SUBSTRING(NOME , 5 , 6) AS NOME_NO_MEIO,
					CNPJ
FROM			TB_FORNECEDOR

-- CONTANDO...
--123456789012345678901234567890
--CADIUM COMERCIO IMP.E EXP. LTDA.

--UM COM

-- LEN(CAMPO) OU LENGHT(CAMPO): RETORNA A QUANTIDADE DE CARACTERES EXISTENTES EM UM DETERMINADO CAMPO

SELECT		LEN('FABIANO H')

SELECT NOME, LEN(NOME) AS COMPRIMENTO
FROM TB_EMPREGADO

--OLAVO TRINDADE

SP_HELP TB_EMPREGADO

-- LEFT(CAMPO , N)
-- RIGHT(CAMPO , N)
-- SUBSTRING(CAMPO , POS-INI , QTDE_CARAC)
-- LEN(CAMPO)

-- CONCATENANDO TEXTOS...
-- CONCAT( CAMPO1, CAMPO2, CAMPO3, ... , CAMPON)

-- EXEMPLO: CONCATENAR O VALOR "AAAA" NO CAMPO NOME DA TABELA DE EMPREGADOS

SELECT	CONCAT('AAAA' , NOME)
FROM	TB_EMPREGADO

-- EXEMPLO: CONCATENAR O NOME E O NOME_FANTASIA DA TABELA DE FORNECEDORES

SELECT CONCAT(NOME , NOME_FANTASIA) AS NOVO_NOME, NOME , NOME_FANTASIA
FROM TB_FORNECEDOR

-- ÍNDICE DO CARACTERE: CHARINDEX(VALOR, CAMPO)

-- LOCALIZAR A POSIÇÃO DO @ DENTRO DO MEU EMAIL
SELECT 'fabiano.passos@ymail.com' -- POSIÇÃO 15

SELECT CHARINDEX('@', 'fabiano.passos@ymail.com')

-- EXEMPLO: LOCALIZAR A POSIÇÃO DO VALOR "SILVA"
SELECT		NOME , CHARINDEX('SILVA', NOME) AS POSICAO_SILVA
FROM			TB_EMPREGADO
WHERE			NOME LIKE '%SILVA%'

-- EXERCICIOS DE FIXAÇÃO 

USE PEDIDOS

/*
1. TRAZER TODOS OS FUNCIONÁRIOS DOS CARGOS 10, 14 E 15 OU OS FUNCIONÁRIOS QUE 
   POSSUAM SALÁRIO ACIMA DE 3000

2. TRAZER TODOS OS FUNCIONÁRIOS QUE GANHEM MENOS QUE 1000
   E TAMBÉM OS FUNCIONÁRIOS QUE GANHEM MAIS DO QUE 4000

3. TRAZER TODOS OS FUNCIONÁRIOS QUE ESTEJAM NOS CARGOS
   10 E 14 E TAMBÉM OS FUNCIONÁRIOS COM SALARIO ACIMA DE 5000

4. SOMAR R$ 500,00 NO SALÁRIO DE TODOS OS FUNCIONÁRIOS E INCREMENTAR
   O PREMIO_MENSAL EM 30%

5. RETORNAR OS REGISTROS DE DE VENDA DO CÓDIGO 01 EM JANEIRO DE 2014
-- TABELA: TB_PRODUTO

6. LISTAR TODOS OS FORNECEDORES QUE POSSUAM NO NOME, O CONTEÚDO "LTDA"
--TB_FORNECEDOR 

7. TRAZER OS FORNECEDORES DO ESTADO DE SÃO PAULO, COM CODIGO DO FORNEDOR SUPERIOR 
   A 500 E QUE POSSUAM "FERR" NO NOME

8. RETORNAR OS CLIENTES QUE POSSUAM BAIRRO NULO
--TB_CLIENTE

9. TRAZER OS NOMES E NOMES FANTASIA CLIENTES DO SUDESTE (COLUNA ESTADO) + APENAS
   A PARTE DO ANO DA DATA DE CADASTRO

10. 

A. RETORNAR, UTILIZANDO RANKEAMENTO (ORDER BY + TOP), O FUNCIONÁRIO MAIS VELHO DE EMPRESA

B. RETORNAR, UTILIZANDO RANKEAMENTO (ORDER BY + TOP), O FUNCIONÁRIO MAIS NOVO DE IDADE

-- VARIÁVEIS DE TEXTO

11. RETORNAR OS 5 CARACTERES DA ESQUERDA DO CAMPO NOME DA TABELA DE CLIENTES

12. DESCOBRIR A POSIÇÃO DA VARIÁVEL "SILV" NO CAMPO NOME DA TABELA DE EMPREGADOS

13. CONCATENAR OS TRÊS PRIMEIROS DÍGITOS DO NOME DOS EMPREGADOS COM A POSIÇÃO 5 A 8 
    DO MESMO NOME, APENAS PARA OS COLABORADORES DE CARGOS ACIMA DE 10

14. RETORNAR O CNPJ DO FORNECEDOR EM FORMATO 'XX.XXX.XXX/XXXX-XX'
    APENAS PARA OS CNPJS QUE POSSUIREM 14 DE TAMANHO NESTE CAMPO

15. DESAFIO: TROCAR TODOS OS "SILV" POR "RODRIGUES" NA TABELA DE EMPREGADOS

*/

	 SELECT 	* 
	 FROM			TB_EMPREGADO
	 WHERE COD_CARGO IN (10, 14, 15) OR
	 SALARIO >= 3000

	 SELECT		*
	 FROM			TB_EMPREGADO
	 WHERE		SALARIO < 1000
	 OR 			SALARIO > 4000

	 SELECT * 
	 FROM TB_EMPREGADO
	 WHERE COD_CARGO IN (10, 14)
	 OR SALARIO >= 5000

	 SELECT		NOME,SALARIO,SALARIO + 500 AS NOVO_SALARIO, PREMIO_MENSAL,(PREMIO_MENSAL * 0.3)+PREMIO_MENSAL AS NOVO_PREMIO_MENSAL
	 FROM			TB_EMPREGADO

	 SELECT		*
	 FROM			TB_PRODUTO
	 WHERE COD_TIPO = 1
	 
	 SELECT		*
	 FROM			TB_FORNECEDOR
	 WHERE			NOME
	 LIKE			'%LTDA%'
	 
	 SELECT		*
	 FROM			TB_FORNECEDOR
	 WHERE		ESTADO = 'SP' 
	 AND			COD_FORNECEDOR >= 500
	 AND			NOME LIKE '%FERR%'

	 SELECT		*
	 FROM			TB_CLIENTE
	 WHERE		BAIRRO IS NULL

	 SELECT		NOME, FANTASIA
	 FROM			TB_CLIENTE
	 WHERE		ESTADO IN ('SP', 'MG', 'RJ', 'ES')

	 SELECT		TOP 1 NOME, DATA_NASCIMENTO
	 FROM			TB_EMPREGADO
	 WHERE		DATA_NASCIMENTO IS NOT NULL
	 ORDER BY DATA_NASCIMENTO ASC

	 SELECT		TOP 1 NOME, DATA_NASCIMENTO
	 FROM			TB_EMPREGADO
	 WHERE		DATA_NASCIMENTO IS NOT NULL
	 ORDER BY DATA_NASCIMENTO DESC

	 SELECT		LEFT(NOME,5)
	 AS				NOME_ESQUERDA,NOME 
	 FROM			TB_CLIENTE

	 SELECT		NOME , CHARINDEX('SILV', NOME) 
	 AS				POSICAO_SILV
	 FROM			TB_EMPREGADO
	 WHERE		NOME LIKE '%SILV%'

	 SELECT		NOME,CONCAT(LEFT(NOME,3),SUBSTRING (NOME, 5, 8)) 
	 AS				CONCAT_NOME
	 FROM			TB_EMPREGADO
	 WHERE		COD_CARGO >= 10

	 SELECT SUBSTRING (CNPJ,1,2) + '.'
	 + SUBSTRING (CNPJ,3,3) + '.'
	 + SUBSTRING (CNPJ,6,3) + '/'
	 + SUBSTRING (CNPJ,9,4) + '-'
	 + SUBSTRING (CNPJ, 13,2)
	 FROM TB_FORNECEDOR
	 WHERE LEN(CNPJ) = 14

	 SELECT
	 REPLACE	(NOME, 'SILVA', 'RODRIGUES') AS NOVO_NOME
	 FROM	TB_EMPREGADO
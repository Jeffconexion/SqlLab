CREATE DATABASE LEARNSQL;
USE LEARNSQL;

CREATE TABLE carro (
    niv VARCHAR(50) PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    preco DECIMAL(10, 2),
    ano_producao INT NOT NULL
);

INSERT INTO carro (niv, marca, modelo, preco, ano_producao) VALUES
('LJCPCBLCX14500264', 'Ford', 'Focus', 8000.00, 2005),
('WPOZZZZ79ZTS372128', 'Ford', 'Fusion', 12500.00, 2008),
('JF1BR93D7BG498281', 'Toyota', 'Avensis', 11300.00, 1999),
('KLATF08Y1VB3636', 'Volkswagen', 'Golf', 3270.00, 1992),
('1M8GDM9AXKP042788', 'Volkswagen', 'Golf', 13000.00, 2010),
('1HGCM82633A004352', 'Volkswagen', 'Jetta', 6420.00, 2003),
('1G1YZ23J9P5800003', 'Fiat', 'Punto', 5700.00, 1999),
('GS723HDSAK2399002', 'Opel', 'Corsa', NULL, 2007);

SELECT *
FROM CARRO

SELECT *
FROM CARRO WITH(NOLOCK);

SELECT MARCA
FROM CARRO;

SELECT MODELO, PRECO
FROM CARRO;

SELECT NIV, MARCA, MODELO, PRECO, ANO_PRODUCAO
FROM CARRO
WHERE ANO_PRODUCAO = 1999;

SELECT NIV, MARCA, MODELO, PRECO, ANO_PRODUCAO
FROM CARRO
WHERE PRECO > 10000

SELECT NIV, MARCA, MODELO, PRECO, ANO_PRODUCAO
FROM CARRO
WHERE ANO_PRODUCAO <> 1999

SELECT MARCA, MODELO, ANO_PRODUCAO
FROM CARRO
WHERE PRECO <= 11300

SELECT NIV
FROM CARRO
WHERE ANO_PRODUCAO < 2005 OR PRECO < 10000

SELECT NIV
FROM CARRO
WHERE ANO_PRODUCAO > 1999 AND PRECO < 7000

-- O operador BETWEEN
SELECT NIV, MARCA, MODELO
FROM CARRO
WHERE ANO_PRODUCAO BETWEEN 1995 AND 2005

-- Operadores Lógicos - NOT
SELECT NIV, MARCA, MODELO
FROM CARRO
WHERE ANO_PRODUCAO NOT BETWEEN 1995 AND 2005

-- Inclua ainda mais condições
SELECT NIV
FROM CARRO
WHERE (ANO_PRODUCAO < 1999 OR ANO_PRODUCAO > 2005) AND (PRECO < 4000 OR PRECO > 10000)

-- Usar texto
SELECT NIV, MARCA, MODELO, PRECO, ANO_PRODUCAO
FROM CARRO
WHERE MARCA = 'Ford'

-- O sinal de porcentagem (%)
SELECT NIV, MARCA, MODELO
FROM CARRO
WHERE MARCA LIKE 'F%'

-- Continuação sobre o sinal de porcentagem (%)
SELECT NIV 
FROM CARRO
WHERE MODELO LIKE '%s'

-- O sinal de sublinhado (_)
SELECT NIV, MARCA, MODELO, PRECO, ANO_PRODUCAO
FROM CARRO
WHERE MARCA LIKE 'Volk_wagen'

--Procurando por valores NOT NULL
SELECT NIV, MARCA, MODELO, PRECO, ANO_PRODUCAO
FROM CARRO
WHERE PRECO IS NOT NULL

SELECT NIV, MARCA, MODELO, PRECO, ANO_PRODUCAO
FROM CARRO
WHERE PRECO IS NULL

--Comparações com NULL
SELECT NIV, MARCA, MODELO, PRECO, ANO_PRODUCAO
FROM CARRO
WHERE PRECO >= 0

-- Operadores matemáticos básicos
SELECT NIV, MARCA, MODELO, PRECO, ANO_PRODUCAO
FROM CARRO
WHERE (PRECO * 0.2) > 2000


/*
Exercício
Selecione todas as colunas de carros que:

foram produzidos entre 1999 e 2005,
não são da marca Volkswagen,
têm um modelo que começa com 'P' ou 'F',
têm um preço definido.
*/

SELECT NIV, MARCA, MODELO, PRECO, ANO_PRODUCAO
FROM CARRO
WHERE 
(ANO_PRODUCAO BETWEEN 1999 AND 2005)
AND
MARCA != 'Volkswagen'
AND
MODELO LIKE '[PF]%'
AND
PRECO IS NOT NULL

-- Conheça as tabelas
CREATE TABLE Diretor (
    Id INT PRIMARY KEY,
    Nome NVARCHAR(100) NOT NULL,
    Ano_Nascimento INT NOT NULL
);

INSERT INTO Diretor (Id, Nome, Ano_Nascimento) VALUES 
(1, 'Alfred Hitchcock', 1899),
(2, 'Steven Spielberg', 1946),
(3, 'Woody Allen', 1935),
(4, 'Quentin Tarantino', 1963),
(5, 'Pedro Almodóvar', 1949);

CREATE TABLE Filme (
    Id INT PRIMARY KEY,
    Titulo NVARCHAR(255) NOT NULL,
    Ano_Producao INT NOT NULL,
    Id_Diretor INT,
    FOREIGN KEY (Id_Diretor) REFERENCES Diretor(Id)
);

INSERT INTO Filme (Id, Titulo, Ano_Producao, Id_Diretor) VALUES
(1, 'Psicose', 1960, 1),
(2, 'O Resgate do Soldado Ryan', 1998, 2),
(3, 'A Lista de Schindler', 1993, 2),
(4, 'Meia-Noite em Paris', 2011, 3),
(5, 'Poucas e Boas', 1993, 3),
(6, 'Pulp Fiction: Tempo de Violência', 1994, 4),
(7, 'Fale com Ela', 2002, 5),
(8, 'A Pele que Habito', 2011, 5);

SELECT * FROM Diretor
SELECT * FROM Filme

-- Várias tabelas na cláusula FROM
SELECT * FROM
Diretor, Filme

-- Junte tabelas com uma condição
SELECT * 
FROM Filme,Diretor
WHERE Filme.Id_Diretor = Diretor.Id

-- Juntar tabelas usando JOIN
SELECT *
FROM Filme
JOIN Diretor
ON Filme.Id_Diretor = Diretor.Id

--Exibir colunas específicas
SELECT Filme.Titulo, Diretor.Nome
FROM Filme
JOIN Diretor
ON Filme.Id_Diretor = Diretor.Id

--Consulte as colunas sem nomes de tabelas
SELECT TITULO, NOME
FROM FILME
JOIN DIRETOR
ON FILME.ID_DIRETOR = DIRETOR.ID

-- Renomeando colunas com AS
SELECT Filme.Titulo AS filme_titulo, Diretor.Nome AS diretor_nome
FROM Filme
JOIN Diretor
ON Filme.Id_Diretor = Diretor.Id

--Filtrando as tabelas unidas

SELECT F.ID, F.TITULO, F.ANO_PRODUCAO, F.ID_DIRETOR, D.ID, D.NOME, D.ANO_NASCIMENTO
FROM Filme F
JOIN Diretor D
ON F.Id_Diretor = D.Id
WHERE F.ANO_PRODUCAO > 2000

-- Filtrando as tabelas unidas - Continuação
SELECT F.ID, F.TITULO, F.ANO_PRODUCAO, F.ID_DIRETOR, D.ID, D.NOME, D.ANO_NASCIMENTO
FROM FILME F
JOIN DIRETOR D
ON F.Id_Diretor = D.Id
WHERE D.Nome = 'Steven Spielberg'

-- * Pratique seus conhecimentos
SELECT F.TITULO, F.ANO_PRODUCAO, D.NOME, D.ANO_NASCIMENTO AS NASCIDO_EM
FROM FILME F
JOIN DIRETOR D
ON F.Id_Diretor = D.Id
WHERE (F.Ano_Producao - D.Ano_Nascimento) < 40

SELECT F.ID, F.TITULO, F.ANO_PRODUCAO AS PRODUZIDO_EM, D.NOME, D.ANO_NASCIMENTO AS NASCIDO_EM
FROM FILME F
JOIN DIRETOR D
ON F.Id_Diretor = D.Id
WHERE 
(F.Titulo LIKE '%a%') AND (F.Ano_Producao > 2000)
OR
D.Ano_Nascimento BETWEEN 1945 AND 1995

-- Conheçendo as tabelas
CREATE TABLE funcionarios (
    departamento VARCHAR(50),
    nome VARCHAR(50),
    sobrenome VARCHAR(50),
    ano INT,
    salario DECIMAL(10, 2),
    cargo VARCHAR(50)
);

INSERT INTO funcionarios (departamento, nome, sobrenome, ano, salario, cargo) VALUES
('TI', 'Olivia', 'Pereira', 2011, 3000, 'Estagiário'),
('TI', 'Olivia', 'Pereira', 2012, 3000, 'Estagiário'),
('TI', 'Olivia', 'Pereira', 2012, 4200, 'Desenvolvedor Júnior'),
('TI', 'Olivia', 'Pereira', 2013, 4900, 'Desenvolvedor Júnior'),
('TI', 'Olivia', 'Pereira', 2014, 8100, 'Desenvolvedor Sênior'),
('Administração', 'Jonas', 'Junqueira', 2011, 4300, 'Gerente de Projetos Júnior'),
('Administração', 'Jonas', 'Junqueira', 2012, 5100, 'Gerente de Projetos'),
('Administração', 'Jonas', 'Junqueira', 2013, 7200, 'Gerente de Projetos Sênior'),
('Administração', 'Jonas', 'Junqueira', 2014, 7600, 'Gerente de Projetos Sênior'),
('Administração', 'Jonas', 'Junqueira', 2015, 9500, 'Chefe de Departamento'),
('TI', 'Hugo', 'Toledo', 2015, 2700, 'Estagiário'),
('Recursos Humanos', 'Livia', 'Borba', 2013, 1900, 'Especialista Júnior de RH'),
('Recursos Humanos', 'Livia', 'Borba', 2014, 2300, 'Especialista de RH'),
('Recursos Humanos', 'Livia', 'Borba', 2015, 3650, 'Especialista Sênior de RH'),
('Contabilidade', 'Carlos', 'Junqueira', 2010, 2000, 'Contador Júnior'),
('Contabilidade', 'Carlos', 'Junqueira', 2011, 2000, 'Contador Júnior'),
('Contabilidade', 'Carlos', 'Junqueira', 2012, 2500, 'Contador'),
('Contabilidade', 'Carlos', 'Junqueira', 2013, 3200, 'Contador'),
('Contabilidade', 'Carlos', 'Junqueira', 2014, 3700, 'Contador Sênior'),
('Contabilidade', 'Carlos', 'Junqueira', 2015, 4200, 'Contador Sênior'),
('TI', 'Jacó', 'Reis', 2013, 3400, 'Estagiário'),
('TI', 'Jacó', 'Reis', 2014, 4100, 'Desenvolvedor Júnior'),
('TI', 'Jacó', 'Reis', 2015, 5900, 'Desenvolvedor'),
('Contabilidade', 'Jessica', 'Piaz', 2014, 3800, 'Contador Sênior'),
('Contabilidade', 'Jessica', 'Piaz', 2015, 4300, 'Contador Sênior'),
('Administração', 'Ethan', 'Bastos', 2013, 5100, 'Gerente de Projetos'),
('Administração', 'Ethan', 'Bastos', 2014, 5900, 'Gerente de Projetos'),
('Administração', 'Ethan', 'Bastos', 2015, 6300, 'Gerente de Projetos Sênior'),
('Central de Ajuda', 'Emilia', 'Vargas', 2013, 1400, 'Estagiário'),
('Central de Ajuda', 'Emilia', 'Vargas', 2014, 1900, 'Assistente de Atendimento ao Cliente'),
('Central de Ajuda', 'Emilia', 'Vargas', 2015, 2300, 'Assistente de Atendimento ao Cliente'),
('Recursos Humanos', 'Sophia', 'Conde', 2011, 2100, 'Especialista Júnior de RH'),
('Marketing', 'Amelia', 'Romão', 2014, 2100, 'Estagiário'),
('Marketing', 'Amelia', 'Romão', 2015, 2300, 'Especialista em CEO Júnior'),
('Marketing', 'Lúcia', 'Verdini', 2013, 2000, 'Estagiário'),
('Marketing', 'Rúbia', 'Chagas', 2012, 2500, 'Estagiário'),
('Marketing', 'Rúbia', 'Chagas', 2013, 3400, 'Especialista em CEO Júnior'),
('Marketing', 'Rúbia', 'Chagas', 2014, 3900, 'Especialista em CEO'),
('Marketing', 'Rúbia', 'Chagas', 2015, 5400, 'Especialista em CEO Sênior'),
('null', 'Amália', 'Wagner', NULL, NULL, NULL),
('Central de Ajuda', 'Breno', 'Mafra', 2012, 1500, 'Estagiário'),
('Central de Ajuda', 'Breno', 'Mafra', 2013, 2000, 'Assistente de Atendimento ao Cliente'),
('Central de Ajuda', 'Breno', 'Mafra', 2014, 2500, 'Assistente de Atendimento ao Cliente'),
('Central de Ajuda', 'Breno', 'Mafra', 2015, 3700, 'Especialista em Atendimento ao Cliente'),
('Administração', 'Eva', 'Santos', 2011, 2100, 'Estagiário'),
('Administração', 'Eva', 'Santos', 2012, 4100, 'Gerente de Projetos Júnior'),
('Administração', 'Eva', 'Santos', 2013, 4600, 'Gerente de Projetos Júnior'),
('Administração', 'Eva', 'Santos', 2014, 5300, 'Gerente de Projetos'),
('Administração', 'Eva', 'Santos', 2015, 6100, 'Gerente de Projetos Sênior');


SELECT departamento, nome, sobrenome, ano, salario, cargo
FROM funcionarios

--Ordene as linhas - ORDER BY
SELECT DEPARTAMENTO, NOME, SOBRENOME, ANO, SALARIO, CARGO
FROM funcionarios
ORDER BY SALARIO 

SELECT DEPARTAMENTO, NOME, SOBRENOME, ANO, SALARIO, CARGO
FROM funcionarios
ORDER BY SALARIO ASC

SELECT DEPARTAMENTO, NOME, SOBRENOME, ANO, SALARIO, CARGO
FROM funcionarios
ORDER BY SALARIO DESC

--ORDER BY com condições

SELECT departamento, nome, sobrenome, ano, salario, cargo
FROM funcionarios
WHERE
ANO = 2011
ORDER BY salario

--Ordem ascendente e descendente
SELECT DEPARTAMENTO, NOME, SOBRENOME, ANO, SALARIO, CARGO
FROM funcionarios
ORDER BY SOBRENOME DESC

-- Ordenar por algumas colunas
SELECT DEPARTAMENTO, NOME, SOBRENOME, ANO, SALARIO, CARGO
FROM funcionarios
ORDER BY DEPARTAMENTO ASC, SALARIO DESC

-- Resultados duplicados
SELECT ANO
FROM funcionarios
ORDER BY ANO ASC

--Selecione valores distintos
SELECT DISTINCT ANO
FROM funcionarios

-- Selecione valores distintos em algumas colunas
SELECT DISTINCT DEPARTAMENTO, CARGO
FROM funcionarios

-- Conte as linhas
SELECT COUNT(*)
FROM funcionarios

--Conte as linhas ignorando valores NULLS
SELECT COUNT(CARGO) AS non_null_no
FROM funcionarios

-- Conte os valores distintos em uma coluna
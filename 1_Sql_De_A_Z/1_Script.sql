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

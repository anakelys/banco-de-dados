-- Exercício 1: Serviço de RH de uma empresa.

CREATE DATABASE rh_empresa;
USE rh_empresa;

CREATE TABLE tb_colaboradores(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    data_nascimento DATE,
    email VARCHAR(150) UNIQUE NOT NULL,
    cargo VARCHAR(100) NOT NULL
);

INSERT INTO tb_colaboradores (nome, data_nascimento, email, cargo)
VALUES 
("Fabiana de Souza", "1991-09-22", "fabiana_souza@email.com", "Secretária"),
("João Santos", "1995-05-01", "joao.santos2@email.com", "Estagiário"),
("Joana Almeida", "1989-01-13", "joana_almeida@email.com", "Supervisora"),
("Fernanda Silva", "1993-03-30", "fernanda_s2@email.com", "Desenvolvedor Jr."),
("Pedro Monteiro", "1990-04-25", "pedro.monteiro@email.com", "Desenvolvedor Sr.");

SELECT * FROM tb_colaboradores; -- Mostrando a tabela de colaboradores

ALTER TABLE tb_colaboradores -- Adicionando uma coluna ref. salário
ADD COLUMN salario DECIMAL(10,2);

UPDATE tb_colaboradores -- Adicionando o salário de todos os colaboradores
SET salario = 2500
WHERE id = 1;

UPDATE tb_colaboradores
SET salario = 1500
WHERE id = 2;

UPDATE tb_colaboradores
SET salario = 3500
WHERE id = 3;

UPDATE tb_colaboradores
SET salario = 4000
WHERE id = 4;

UPDATE tb_colaboradores
SET salario = 5000
WHERE id = 5;

SELECT * FROM tb_colaboradores -- Exibir salários > 2000
WHERE salario > 2000;

SELECT * FROM tb_colaboradores -- Exbir salários < 2000
WHERE salario < 2000;

UPDATE tb_colaboradores 
SET 
	cargo = "Gerente",
	salario = 4500
WHERE id = 3;

SELECT * FROM tb_colaboradores;

-- Exercicio 2: Banco de dados para ecommerce

CREATE DATABASE ecommerce_jogos;
USE ecommerce_jogos;

CREATE TABLE tb_jogos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,   
    nome VARCHAR(255) NOT NULL,              
    categoria VARCHAR(100) NOT NULL,         
    preco DECIMAL(10, 2) NOT NULL,           
    quantidade_estoque INT NOT NULL,         
    plataforma VARCHAR(100) NOT NULL         
);

INSERT INTO tb_jogos (nome, categoria, preco, quantidade_estoque, plataforma)
VALUES
    ("Console Super Gamer 5", "Console", 4999.90, 20, "G5"),            
    ("Console Xtreme X", "Console", 4899.90, 15, "XTX"),           
    ("Zumbi 2", "Jogo", 149.90, 30, "XTX"),     
    ("Futebol Mania 2025", "Jogo", 299.90, 100, "G5"),                     
    ("Batalha Moderna 2", "Jogo", 349.90, 50, "XTX"), 
    ("Monitor 4K 27", "Acessório", 999.90, 10, "PC"),         
    ("Teclado", "Acessório", 799.90, 40, "PC"),      
    ("Cadeira Gamer ", "Acessório", 1999.99, 25, "PC");    

SELECT * FROM tb_jogos;

SELECT * FROM tb_jogos 
WHERE preco > 500;

SELECT * FROM tb_jogos 
WHERE preco < 500;

UPDATE tb_jogos
SET 
	preco = 49.50,
	quantidade_estoque = 45
WHERE 
	id = 3;
    
UPDATE tb_jogos
SET 
	preco = 989.90,
	quantidade_estoque = 10
WHERE 
	id = 8;
    
SELECT * FROM tb_jogos;

-- Exercicio 3: Banco de dados para registro de uma escola

CREATE DATABASE escola_registro;
USE escola_registro;

CREATE TABLE tb_estudantes (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,   
    nome VARCHAR(150) NOT NULL,              
    data_nascimento DATE,         
    cpf VARCHAR(14) UNIQUE NOT NULL,         
    nota DECIMAL(5,2) NOT NULL         
);

INSERT INTO tb_estudantes (nome, data_nascimento, cpf, nota)
VALUES
    ("Maria Rocha", "2009-05-07", "374.829.150-62", 7.5), 
    ("Pedro Schutz", "2010-03-15", "328.467.590-12", 5.7), 
	("Felipe Fernandez", "2010-08-29", "581.237.940-04", 9.8), 
    ("Ricardo Câmara", "2011-02-01", "692.143.870-25", 9.0),
	("Paola Tuche", "2009-07-14", "843.569.210-37", 6.3), 
    ("Fátima Porto", "2011-11-25", "102.754.360-56", 10.0), 
	("Lucca de Souza", "2010-12-17", "673.915.240-78", 9.2), 
    ("Anna Flor", "2010-10-03", "215.486.730-91", 4.1);
    
SELECT * FROM tb_estudantes;

SELECT * FROM tb_estudantes 
WHERE nota > 7;

SELECT * FROM tb_estudantes 
WHERE nota < 7;

UPDATE tb_estudantes
SET 
	nota = 8.2
WHERE 
	id = 2;
    
UPDATE tb_estudantes
SET 
	nota = 9.8
WHERE 
	id = 8;
    
SELECT * FROM tb_estudantes;
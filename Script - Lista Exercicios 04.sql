DROP DATABASE IF EXISTS lista_exercicios_4;
CREATE DATABASE IF NOT EXISTS lista_exercicios_4;
USE lista_exercicios_4;

CREATE TABLE estado (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    sigla CHAR(2) NOT NULL,
    ativo ENUM('S', 'N') NOT NULL DEFAULT 'S',
    data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE cidade (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    ativo ENUM('S', 'N') NOT NULL DEFAULT 'S',
    data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado_id INT NOT NULL, FOREIGN KEY (estado_id) REFERENCES estado(id)
);

CREATE TABLE cliente (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    senha VARCHAR(25) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    ativo ENUM('S', 'N') NOT NULL DEFAULT 'S',
    data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    cidade_id INT NOT NULL, FOREIGN KEY (cidade_id) REFERENCES cidade(id)
);

INSERT INTO estado(nome, sigla) VALUES ('AMAZONAS', 'AM'), ('RONDÔNIA', 'RO'), ('PARÁ', 'PA'), ('ACRE', 'AC'), ('AMAPÁ', 'AM'), ('RORAIMA', 'RA'), ('TOCANTINS', 'TO');
INSERT INTO estado(nome, sigla) VALUES ('PARANÁ', 'PR'), ('SANTA CATARINA', 'SC'), ('RIO GRANDE DO SUL', 'RS');

INSERT INTO cidade(nome, estado_id) VALUES ('MANACAPURÚ', 1), ('TEFÉ', 1), ('SANTARÉM', 3), ('MARABÁ', 3), ('ACRELANDIA', 4), ('SANTANA', 5), ('LARANJAL DO JARI', 5), ('PRACUUBA', 5), ('CURITIBA', 8);

-- Exercício 1
SELECT c.id, c.nome, e.sigla FROM cidade c, estado e WHERE c.estado_id = e.id;
SELECT c.id, c.nome, e.sigla FROM cidade c JOIN estado e ON c.estado_id = e.id;

-- Exercício 2
SELECT c.id 'ID DA CIDADE', c.nome 'NOME DA CIDADE', e.sigla 'SIGLA DO ESTADO' FROM cidade c, estado e WHERE c.estado_id = e.id;
SELECT c.id 'ID DA CIDADE', c.nome 'NOME DA CIDADE', e.sigla 'SIGLA DO ESTADO' FROM cidade c JOIN estado e ON c.estado_id = e.id;

-- Exercício 3
SELECT cidade.id 'ID DA CIDADE', cidade.nome 'NOME DA CIDADE', estado.sigla 'SIGLA DO ESTADO' FROM cidade, estado WHERE cidade.estado_id = estado.id;
SELECT cidade.id 'ID DA CIDADE', cidade.nome 'NOME DA CIDADE', estado.sigla 'SIGLA DO ESTADO' FROM cidade JOIN estado ON cidade.estado_id = estado.id;

-- Exercício 4
SELECT cid.id 'ID DA CIDADE', cid.nome 'NOME DA CIDADE', est.sigla 'SIGLA DO ESTADO' FROM cidade cid, estado est WHERE cid.estado_id = est.id;
SELECT cid.id 'ID DA CIDADE', cid.nome 'NOME DA CIDADE', est.sigla 'SIGLA DO ESTADO' FROM cidade cid JOIN estado est ON cid.estado_id = est.id;

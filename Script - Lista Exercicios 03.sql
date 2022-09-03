DROP DATABASE IF EXISTS lista_exercicios_3;
CREATE DATABASE IF NOT EXISTS lista_exercicios_3;
USE lista_exercicios_3;

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


-- INSERT | Exercícios 2 e 3
INSERT INTO estado(nome, sigla, ativo, data_cadastro) VALUES ('PARANÁ', 'PR', 'S', '2022-09-03'), ('SANTA CATARINA', 'SC', 'S', '2022-09-03'), ('RIO GRANDE DO SUL', 'RS', 'S', '2022-09-03');
INSERT INTO estado(nome, sigla) VALUES ('AMAZONAS', 'AM'), ('RONDÔNIA', 'RO'), ('PARÁ', 'PA'), ('ACRE', 'AC'), ('AMAPÁ', 'AM'), ('RORAIMA', 'RA'), ('TOCANTINS', 'TO');

SELECT * FROM estado;

-- DELETE | Exercícios 2 e 3
UPDATE estado SET nome = 'PARANA' WHERE nome = 'PARANÁ';
UPDATE estado SET nome = 'PARANÁ' WHERE nome = 'PARANA';

UPDATE estado SET ativo = 'N' WHERE nome = 'TOCANTINS' OR nome = 'AMAZONAS';

-- SELECT | Exercícios 4 e 5

SELECT e.id, e.nome, e.sigla FROM estado e;

SELECT e.id 'ID do Estado', e.nome 'Nome do Estado', e.sigla 'Sigla do Estado', e.ativo 'Estado está ativo?' FROM estado e;
DROP DATABASE IF EXISTS lista_exercicios_2;
CREATE DATABASE IF NOT EXISTS lista_exercicios_2;
USE lista_exercicios_2;

CREATE TABLE estado (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(25) NOT NULL UNIQUE,
    sigla CHAR(2) NOT NULL UNIQUE,
    ativo ENUM('S', 'N') NOT NULL DEFAULT 'S',
    data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE cidade (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(35) NOT NULL,
    ativo ENUM('S', 'N') NOT NULL DEFAULT 'S',
    data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado_id INT NOT NULL, FOREIGN KEY (estado_id) REFERENCES estado(id)
);

-- Exercício 1
INSERT INTO estado VALUES(NULL, 'ACRE', 'AC', 'S', '2022-09-03');

-- Exercício 2
INSERT INTO estado(nome, sigla, ativo, data_cadastro) VALUES ('ALAGOAS', 'AL', 'S', '2022-09-03');

-- Exercício 3
INSERT INTO estado(nome, sigla) VALUES ('AMAPÁ', 'AP');

-- Exercício 4
SELECT * FROM estado;

INSERT INTO cidade VALUES (NULL, 'ACRELANDIA', 'S', '2022-09-03', 1);
INSERT INTO cidade(nome, ativo, data_cadastro, estado_id) VALUES ('ASSIS BRASIL', 'S', '2022-09-03', 1);
INSERT INTO cidade(nome, estado_id) VALUES ('BRASILEIA', 1);

-- Exercício 5
INSERT INTO estado VALUES (NULL, 'PARANÁ', 'PR', 'S', '2022-09-03'), (NULL, 'SANTA CATARINA', 'SC', 'S', '2022-09-03'), (NULL, 'RIO GRANDE DO SUL', 'RS', 'S', '2022-09-03');

-- Exercício 6
INSERT INTO estado(nome, sigla, ativo, data_cadastro) VALUES ('RIO DE JANEIRO', 'RJ', 'S', '2022-09-03'), ('SÃO PAULO', 'SP', 'S', '2022-09-03');

-- Exercício 7
INSERT INTO estado(nome, sigla) VALUES ('RONDÔNIA', 'RO'), ('RORAIMA', 'RA');

-- Exercício 8
INSERT INTO cidade VALUES (NULL, 'PARANAVAÍ', 'S', '2022-09-03', 4), (NULL, 'SÃO PAULO', 'S', '2022-03-09', 8);
INSERT INTO cidade(nome, ativo, data_cadastro, estado_id) VALUES ('PELOTAS', 'S', '2022-09-03', 6), ('RIO GRANDE', 'S', '2022-09-03', 6);
INSERT INTO cidade(nome, estado_id) VALUES ('SANTA MARIA', 6), ('VILHENA', 9), ('ARIQUEMES', 9), ('JI-PARANÁ', 9);

-- Exercício 9
CREATE TABLE cliente (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    senha VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    ativo ENUM('S', 'N') NOT NULL DEFAULT 'S',
    data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    cidade_id INT NOT NULL, FOREIGN KEY (cidade_id) REFERENCES cidade(id)
);

SELECT * FROM cidade;

INSERT INTO cliente(nome, senha, email, cidade_id) VALUES ('ROBERTO CARLOS', 'esseCARAnSou3U', 'robertocarloscover@hotmail.com', 11), ('BARRY ALLEN', 'maisBu77oViVO', 'iamnottheflash@gmail.com', 1);

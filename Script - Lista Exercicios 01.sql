CREATE DATABASE lista_exercicios_1;
USE lista_exercicios_1;

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
    estado_id INT NOT NULL,
    CONSTRAINT fk_estado_cidade FOREIGN KEY (estado_id) REFERENCES estado(id)
);


-- inserindo estados
INSERT INTO estado (nome,sigla) VALUES ('PARANÁ','PR');
INSERT INTO estado (nome,sigla) VALUES ('SÃO PAULO','SP');
INSERT INTO estado (nome,sigla) VALUES ('MATO GROSSO','MT');
INSERT INTO estado (nome,sigla) VALUES ('SANTA CATARINA','SC');
INSERT INTO estado (nome,sigla) VALUES ('RIO GRANDE DO SUL','RS');

-- inserindo cidades
INSERT INTO cidade (nome, estado_id) VALUES ('BAURU',2);
INSERT INTO cidade (nome, estado_id) VALUES ('MARINGÁ',1);
INSERT INTO cidade (nome, estado_id) VALUES ('GUARULHOS',2);
INSERT INTO cidade (nome, estado_id) VALUES ('CAMPINAS',2);
INSERT INTO cidade (nome, estado_id) VALUES ('FLORIANÓPOLIS',4);
INSERT INTO cidade (nome, estado_id) VALUES ('PARANAVAÍ',1);
INSERT INTO cidade (nome, estado_id) VALUES ('CUIABA',3);
INSERT INTO cidade (nome, estado_id) VALUES ('BALNEÁRIO CAMBORIÚ',4);
INSERT INTO cidade (nome, estado_id) VALUES ('LONDRINA',1);
INSERT INTO cidade (nome, estado_id) VALUES ('CASCAVEL',1);
INSERT INTO cidade (nome, estado_id) VALUES ('JOINVILLE',4);
INSERT INTO cidade (nome, estado_id) VALUES ('PORTO ALEGRE',5);
INSERT INTO cidade (nome, estado_id) VALUES ('BLUMENAL',4);
INSERT INTO cidade (nome, estado_id) VALUES ('BARRA DOS GARÇAS',3);
INSERT INTO cidade (nome, estado_id) VALUES ('CHAPECÓ',4);
INSERT INTO cidade (nome, estado_id) VALUES ('ITAJAÍ',4);


SELECT id, nome, sigla, ativo, data_cadastro FROM estado;
SELECT id, nome, ativo, data_cadastro, estado_id FROM cidade;

-- Exercício 1
UPDATE estado SET nome = 'PARANÁ' WHERE id = 57;
UPDATE estado SET nome = 'PARANA' WHERE id = 1;

-- Exercício 2
UPDATE estado SET nome = 'PARANÁ' WHERE estado.nome = 'PARANA';

-- Exercício 3
UPDATE estado SET ativo = 'S';
UPDATE estado SET ativo = 'N' WHERE estado.nome = 'SANTA CATARINA' OR estado.nome = 'PARANÁ' OR estado.nome = 'RIO GRANDE DO SUL';

-- Exercício 4
SELECT id FROM estado WHERE nome = 'PARANÁ';
UPDATE cidade SET nome = 'MARINGÁ', ativo = 'N' WHERE id = 97;
SELECT * FROM cidade WHERE id = 97;

-- Exercício 5
DELETE FROM estado WHERE id = 57;

-- Exercício 6
DELETE FROM cidade WHERE estado_id = 1;
DELETE FROM estado WHERE nome = 'PARANÁ';

-- Exercício 7
CREATE TABLE cliente (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    senha VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    ativo ENUM('S', 'N') NOT NULL DEFAULT 'S',
    data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    cidade_id INT NOT NULL,
    CONSTRAINT fk_cidade_cliente FOREIGN KEY (cidade_id) REFERENCES cidade(id)
);

INSERT INTO cliente (nome, senha, email, cidade_id) VALUES ('Iago', 'EuTenhoSó4Ano$', 'iagogamermadruga@hotmail.com', 4);
INSERT INTO cliente (nome, senha, email, cidade_id) VALUES ('Leonardo', 'SuquinPr@ts', 'leonardosimaoprats@gmail.com', 7);

SELECT * FROM cliente;
DELETE FROM cliente;

-- Exercício 8
DELETE FROM cidade WHERE estado_id = 23;
DELETE FROM estado WHERE id = 23;
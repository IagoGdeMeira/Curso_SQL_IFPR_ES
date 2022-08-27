CREATE DATABASE teste_bd;
CREATE DATABASE IF NOT EXISTS teste_bd;

DROP DATABASE teste_bd;
DROP DATABASE IF EXISTS teste_bd;

CREATE DATABASE teste_bd_2;

USE teste_bd;

CREATE TABLE estado (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL UNIQUE,
    sigla CHAR(2) NOT NULL UNIQUE,
    ativo CHAR(1) NOT NULL DEFAULT 'S',
    data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT checar_ativo CHECK(ativo IN('S', 'N'))
);

INSERT INTO estado(nome, sigla) VALUES('BAHIA','BA');
INSERT INTO estado(nome, sigla) VALUES('PARANÁ','PR');
INSERT INTO estado(nome, sigla) VALUES('SÃO PAULO','SP');
INSERT INTO estado(nome, sigla) VALUES('RIO DE JANEIRO','RJ');
INSERT INTO estado(nome, sigla) VALUES('RIO GRANDE DO SUL','RS');

SELECT id, nome, sigla, ativo, data_cadastro FROM estado;

CREATE TABLE cidade (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    ativo CHAR(1) NOT NULL DEFAULT 'S',
    data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado_id INT NOT NULL REFERENCES estado(id),
    CONSTRAINT checar_ativo_cidade CHECK(ativo IN('S', 'N'))
);

INSERT INTO cidade(nome, estado_id) VALUES('PARANAVAÍ', 2);
INSERT INTO cidade(nome, estado_id) VALUES('MARINGÁ', 2);
INSERT INTO cidade(nome, estado_id) VALUES('NITERÓI', 4);
INSERT INTO cidade(nome, estado_id) VALUES('SÃO PAULO', 3);
INSERT INTO cidade(nome, estado_id) VALUES('RIO DE JANEIRO', 4);

SELECT id, nome, ativo, data_cadastro, estado_id FROM cidade;
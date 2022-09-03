DROP DATABASE IF EXISTS teste_bd;
CREATE DATABASE IF NOT EXISTS teste_bd;
USE teste_bd;

CREATE TABLE estado (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL UNIQUE,
    sigla CHAR(2) NOT NULL UNIQUE,
    ativo ENUM('S', 'N') NOT NULL DEFAULT 'S',
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

ALTER TABLE cidade MODIFY COLUMN estado_id INT NOT NULL;
ALTER TABLE cidade ADD CONSTRAINT fk_estado_id FOREIGN KEY(estado_id) REFERENCES estado(id);

ALTER TABLE estado DROP CONSTRAINT checar_ativo;
ALTER TABLE estado MODIFY COLUMN ativo ENUM('S', 'N') NOT NULL DEFAULT 'S';

ALTER TABLE cidade DROP CONSTRAINT checar_ativo_cidade;
ALTER TABLE cidade MODIFY COLUMN ativo ENUM('S', 'N') NOT NULL DEFAULT 'S';

UPDATE estado SET nome = 'são paulo' WHERE id = 3;
UPDATE estado SET nome = 'SÃO PAULO' WHERE id = 3;

DELETE FROM cidade WHERE estado_id = 5;
DELETE FROM cidade WHERE estado_id = 2;
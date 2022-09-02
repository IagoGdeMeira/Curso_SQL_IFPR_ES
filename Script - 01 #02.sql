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

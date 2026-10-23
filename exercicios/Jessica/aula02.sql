-- Aula 02 - Criando as tabelas
-- Enunciado: exercicios/enunciados/aula02-ddl.md
--
-- Escreva a resposta de cada exercicio embaixo do marcador dele.
-- Nao apague os marcadores, nao troque a ordem.
-- Cada bloco roda num banco em branco: crie o que voce for usar.

-- ex1
CREATE TABLE LIVRO (
    id INTEGER PRIMARY KEY,
    titulo TEXT NOT NULL,
    autor TEXT NOT NULL,
    ano INTEGER,
    exemplares INTEGER NOT NULL DEFAULT 1
);

INSERT INTO LIVRO (id, titulo, autor, ano, exemplares) 
VALUES (1, 'Dom Casmurro', 'Machado de Assis', 1899, 3);

INSERT INTO LIVRO (id, titulo, autor, ano) 
VALUES (2, 'O Cortiço', 'Aluísio Azevedo', 1890);


-- ex2
CREATE TABLE LEITOR (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL
);

INSERT INTO LEITOR (id, nome) VALUES (1, 'Ana Silva');
INSERT INTO LEITOR (id, nome) VALUES (2, 'Bruno Souza');
INSERT INTO LEITOR (id, nome) VALUES (3, 'Carla Costa');

ALTER TABLE LEITOR ADD COLUMN telefone TEXT;

SELECT * FROM LEITOR;


-- ex3
CREATE TABLE EMPRESTIMO (
    id INTEGER PRIMARY KEY,
    id_livro INTEGER NOT NULL
);

INSERT INTO EMPRESTIMO (id, id_livro) VALUES (1, 101);
INSERT INTO EMPRESTIMO (id, id_livro) VALUES (2, 102);

ALTER TABLE EMPRESTIMO ADD COLUMN situacao TEXT NOT NULL DEFAULT 'ativo';

-- ex4
CREATE TABLE EDITORA (
    id INTEGER PRIMARY KEY,
    nm TEXT
);

INSERT INTO EDITORA (id, nm) VALUES (1, 'Companhia das Letras');

ALTER TABLE EDITORA RENAME COLUMN nm TO nome;


-- ex5
CREATE TABLE RASCUNHO (
    id INTEGER PRIMARY KEY,
    texto TEXT
);

INSERT INTO RASCUNHO (id, texto) VALUES (1, 'Rascunho 1');
INSERT INTO RASCUNHO (id, texto) VALUES (2, 'Rascunho 2');
INSERT INTO RASCUNHO (id, texto) VALUES (3, 'Rascunho 3');

DELETE FROM RASCUNHO;

SELECT * FROM RASCUNHO;

DROP TABLE RASCUNHO;


-- ex6

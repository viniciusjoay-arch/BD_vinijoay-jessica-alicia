-- Aula 03 - O dado entra, e o banco discute
-- Enunciado: exercicios/enunciados/aula03-dml.md
--
-- Escreva a resposta de cada exercicio embaixo do marcador.
-- Comece CADA bloco com: PRAGMA foreign_keys = ON;
-- Os blocos rodam sobre o banco da secretaria ja carregado.

-- ex1
CREATE TABLE LIVRO (
    id INTEGER PRIMARY KEY,
    titulo TEXT NOT NULL,
    autor TEXT NOT NULL,
    ano INTEGER,
    exemplares INTEGER NOT NULL DEFAULT 1
);


INSERT INTO LIVRO (id, titulo, autor, ano)
VALUES (1, 'Dom Casmurro', 'Machado de Assis', 1899);

INSERT INTO LIVRO (id, titulo, autor, ano, exemplares)
VALUES (2, 'O Pequeno Principe', 'Antoine de Saint-Exupery', 1943, 3);

-- ex2
CREATE TABLE LEITOR (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL
);


INSERT INTO LEITOR (id, nome)
VALUES (1, 'Ana');

INSERT INTO LEITOR (id, nome)
VALUES (2, 'Carlos');

INSERT INTO LEITOR (id, nome)
VALUES (3, 'Mariana');


ALTER TABLE LEITOR ADD COLUMN telefone TEXT;


SELECT * FROM LEITOR;
-- ex3
CREATE TABLE EMPRESTIMO (
    id INTEGER PRIMARY KEY,
    id_livro INTEGER NOT NULL
);


INSERT INTO EMPRESTIMO (id, id_livro)
VALUES (1, 1);

INSERT INTO EMPRESTIMO (id, id_livro)
VALUES (2, 2);


ALTER TABLE EMPRESTIMO
ADD COLUMN situacao TEXT NOT NULL DEFAULT 'Em andamento';
-- ex4

-- ex5

-- ex6

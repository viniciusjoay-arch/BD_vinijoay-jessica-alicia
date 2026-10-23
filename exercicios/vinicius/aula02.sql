-- Aula 02 - Criando as tabelas
-- Enunciado: exercicios/enunciados/aula02-ddl.md
--
-- Escreva a resposta de cada exercicio embaixo do marcador dele.
-- Nao apague os marcadores, nao troque a ordem.
-- Cada bloco roda num banco em branco: crie o que voce for usar.

-- ex1
CREATE TABLE LIVRO (
    id INTEGER PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    ano INTEGER,
    exemplares INTEGER NOT NULL DEFAULT 1
);

INSERT INTO LIVRO (id, titulo, autor, ano)
VALUES (1, 'Dom Casmurro', 'Machado de Assis', 1899);

INSERT INTO LIVRO (id, titulo, autor, ano, exemplares)
VALUES (2, 'O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 1943, 5);

SELECT * FROM LIVRO;

-- ex2
CREATE TABLE LEITOR (
    id INTEGER PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

INSERT INTO LEITOR (id, nome)
VALUES (1, 'Ana Silva');

INSERT INTO LEITOR (id, nome)
VALUES (2, 'Pedro Santos');

INSERT INTO LEITOR (id, nome)
VALUES (3, 'Maria Oliveira');

ALTER TABLE LEITOR
ADD COLUMN telefone VARCHAR(20);

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
ADD COLUMN situacao VARCHAR(20) NOT NULL DEFAULT 'Ativo';

SELECT * FROM EMPRESTIMO;

-- ex4
-- 1. Criar a tabela
CREATE TABLE EDITORA (
    id INTEGER PRIMARY KEY,
    nm TEXT
);

-- 2. Inserir uma linha
INSERT INTO EDITORA (nm)
VALUES ('Editora Exemplo');

-- 3. Renomear a coluna nm para nome, preservando os dados
ALTER TABLE EDITORA
RENAME COLUMN nm TO nome;

-- 4. Conferir se a linha foi preservada
SELECT * FROM EDITORA;
-- ex5
-- Criar a tabela
CREATE TABLE RASCUNHO (
    id INTEGER PRIMARY KEY,
    texto TEXT
);

-- Inserir três linhas
INSERT INTO RASCUNHO (texto) VALUES ('Primeira linha');
INSERT INTO RASCUNHO (texto) VALUES ('Segunda linha');
INSERT INTO RASCUNHO (texto) VALUES ('Terceira linha');

-- 1. Esvaziar a tabela, mantendo a estrutura
DELETE FROM RASCUNHO;

-- 2. Conferir se ficou vazia
SELECT * FROM RASCUNHO;

-- 3. Derrubar a tabela inteira
DROP TABLE RASCUNHO;

-- ex6
PRAGMA foreign_keys = ON;

-- 1. Criar a tabela LIVRO
CREATE TABLE LIVRO (
    id INTEGER PRIMARY KEY,
    titulo TEXT NOT NULL
);

-- 2. Criar a tabela LEITOR
CREATE TABLE LEITOR (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL
);

-- 3. Criar a tabela associativa EMPRESTIMO
CREATE TABLE EMPRESTIMO (
    id_livro INTEGER NOT NULL,
    id_leitor INTEGER NOT NULL,
    data_saida TEXT NOT NULL,
    data_volta TEXT,

    PRIMARY KEY (id_livro, id_leitor, data_saida),

    FOREIGN KEY (id_livro) REFERENCES LIVRO(id),
    FOREIGN KEY (id_leitor) REFERENCES LEITOR(id)
);

-- 4. Inserir livros
INSERT INTO LIVRO (id, titulo) VALUES
    (1, 'Dom Casmurro'),
    (2, 'O Hobbit');

-- 5. Inserir leitores
INSERT INTO LEITOR (id, nome) VALUES
    (1, 'Ana'),
    (2, 'Bruno');

-- 6. Inserir dois empréstimos válidos
INSERT INTO EMPRESTIMO
    (id_livro, id_leitor, data_saida, data_volta)
VALUES
    (1, 1, '2026-10-16', '2026-10-23'),
    (1, 1, '2026-10-20', '2026-10-27');

-- 7. Exemplo de empréstimo que deve ser recusado:
-- INSERT INTO EMPRESTIMO
--     (id_livro, id_leitor, data_saida, data_volta)
-- VALUES
--     (1, 1, '2026-10-16', '2026-10-25');

-- Motivo:
-- A chave primária (id_livro, id_leitor, data_saida)
-- impede repetir o mesmo livro, para o mesmo leitor,
-- na mesma data de saída.

-- 8. Conferir os empréstimos cadastrados
SELECT * FROM EMPRESTIMO;
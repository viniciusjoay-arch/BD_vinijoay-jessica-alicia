-- Banco de apoio das aulas: a secretaria do CEEP em quatro tabelas.
--
-- Este banco NAO e o projeto do trio. Ele existe para voce ter dados de
-- verdade para consultar nas aulas de DQL, sem depender do banco do grupo
-- estar pronto.
--
-- Para montar (ou remontar do zero):
--     sqlite3 banco/escola.db < banco/escola.sql
--
-- Cabe na tela: 3 turmas, 10 alunos, 5 modalidades, 13 inscricoes.
-- Confira tudo no olho antes de acreditar em qualquer consulta.

DROP TABLE IF EXISTS INSCRICAO;
DROP TABLE IF EXISTS ALUNO;
DROP TABLE IF EXISTS MODALIDADE;
DROP TABLE IF EXISTS TURMA;

CREATE TABLE TURMA (
    id      INTEGER PRIMARY KEY,
    nome    TEXT NOT NULL,
    turno   TEXT NOT NULL
);

CREATE TABLE ALUNO (
    id          INTEGER PRIMARY KEY,
    nome        TEXT NOT NULL,
    nascimento  TEXT,
    id_turma    INTEGER,
    FOREIGN KEY (id_turma) REFERENCES TURMA(id)
);

CREATE TABLE MODALIDADE (
    id          INTEGER PRIMARY KEY,
    nome        TEXT NOT NULL,
    vagas       INTEGER NOT NULL,
    responsavel TEXT
);

-- O N:N com atributo proprio: a data e a situacao nao sao do aluno
-- nem da modalidade, sao da inscricao.
CREATE TABLE INSCRICAO (
    id_aluno      INTEGER NOT NULL,
    id_modalidade INTEGER NOT NULL,
    data          TEXT NOT NULL,
    situacao      TEXT NOT NULL,
    PRIMARY KEY (id_aluno, id_modalidade),
    FOREIGN KEY (id_aluno)      REFERENCES ALUNO(id),
    FOREIGN KEY (id_modalidade) REFERENCES MODALIDADE(id)
);

INSERT INTO TURMA (id, nome, turno) VALUES
    (1, '1C', 'manha'),
    (2, '2C', 'manha'),
    (3, '3M', 'tarde');

INSERT INTO ALUNO (id, nome, nascimento, id_turma) VALUES
    (1,  'Ana Lima',        '2009-03-14', 1),
    (2,  'Bruno Castro',    '2008-11-02', 1),
    (3,  'Carla Menezes',   '2009-07-25', 1),
    (4,  'Diego Prestes',   '2008-01-30', 2),
    (5,  'Eduarda Rocha',   '2008-09-09', 2),
    (6,  'Fabio Nunes',     NULL,         2),
    (7,  'Gabriela Souza',  '2007-05-18', 3),
    (8,  'Heitor Barreto',  '2007-12-01', 3),
    (9,  'Isabela Kraus',   '2008-04-22', 3),
    (10, 'Joao Vitor Sa',   '2009-02-08', NULL);

INSERT INTO MODALIDADE (id, nome, vagas, responsavel) VALUES
    (1, 'Futsal',    20, 'Prof. Marcos'),
    (2, 'Voleibol',  16, 'Prof. Marcos'),
    (3, 'Xadrez',    12, 'Prof. Helena'),
    (4, 'Robotica',  10, NULL),
    (5, 'Teatro',    15, 'Prof. Helena');

INSERT INTO INSCRICAO (id_aluno, id_modalidade, data, situacao) VALUES
    (1, 1, '2026-03-10', 'ativa'),
    (1, 3, '2026-03-12', 'ativa'),
    (2, 1, '2026-03-10', 'ativa'),
    (3, 2, '2026-03-11', 'trancada'),
    (3, 5, '2026-04-02', 'ativa'),
    (4, 1, '2026-03-15', 'ativa'),
    (4, 4, '2026-03-15', 'ativa'),
    (5, 3, '2026-03-20', 'ativa'),
    (6, 2, '2026-04-05', 'ativa'),
    (7, 5, '2026-03-09', 'ativa'),
    (7, 1, '2026-03-09', 'trancada'),
    (8, 4, '2026-04-10', 'ativa'),
    (9, 3, '2026-04-11', 'ativa');

# Banco de apoio

As tabelas da secretaria, em tamanho de bolso: 3 turmas, 10 alunos,
5 modalidades e 13 inscrições. Cabe na tela. Você confere qualquer resposta no
olho antes de acreditar nela.

Este **não** é o banco do seu projeto. Ele existe para você ter dado de verdade
para consultar nas aulas, sem depender do banco do trio estar pronto.

## Montando

```bash
python banco/montar.py
```

Se você tem o `sqlite3` na linha de comando, tanto faz:

```bash
sqlite3 banco/escola.db < banco/escola.sql
```

O arquivo `escola.db` **não vai para o GitHub** (está no `.gitignore`). Cada um
monta o seu. Bagunçou testando `UPDATE` sem `WHERE`? Roda o `montar.py` de novo
e o banco volta ao estado original.

## O que tem dentro

```
TURMA       id, nome, turno
ALUNO       id, nome, nascimento, id_turma       -> FK para TURMA
MODALIDADE  id, nome, vagas, responsavel
INSCRICAO   id_aluno, id_modalidade, data, situacao
```

`INSCRICAO` é a associativa: o N:N entre aluno e modalidade, com `data` e
`situacao`, que não são do aluno nem da modalidade, são da inscrição.

Quatro coisas foram colocadas ali de propósito, e uma hora elas vão te morder:

- o aluno 10 (`Joao Vitor Sa`) está **sem turma**;
- o `Fabio Nunes` está **sem data de nascimento**;
- a `Robotica` está **sem responsável**;
- e duas inscrições estão `trancada` (Carla no Voleibol, Gabriela no Futsal),
  que não é a mesma coisa que não ter inscrição nenhuma.

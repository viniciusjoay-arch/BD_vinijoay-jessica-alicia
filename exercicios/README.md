# Exercícios das aulas

Uma pasta por integrante. Uma pasta de enunciados, que vem do professor.

```
exercicios/
  enunciados/       o que fazer em cada aula   (não mexer, vem do upstream)
  ana/              as respostas da Ana
  bruno/            as respostas do Bruno
  carla/            as respostas da Carla
```

Copie a pasta `SEU-NOME/`, renomeie com o seu primeiro nome em minúsculo e sem
acento, e apague a original quando os três já tiverem a sua.

## O contrato

Um arquivo por aula, com o número da aula em dois dígitos:

```
aula02.sql   aula03.sql   aula04.sql   ...
```

Dentro do arquivo, cada exercício começa com um marcador em comentário, sozinho
na linha:

```sql
-- ex1
SELECT nome FROM ALUNO WHERE id_turma = 1;

-- ex2
SELECT nome, vagas
  FROM MODALIDADE
 WHERE vagas > 12
 ORDER BY vagas DESC;
```

Serve `-- ex1` ou `-- ===== ex1 =====`, tanto faz. O que não serve é
`-- exercicio 1`, `-- 1)` ou nada. Sem marcador, o corretor não acha o
exercício.

## Vale entrega, não acerto

Você não perde ponto por errar um exercício de aula. Perde por não entregar.

Então entregue **errado** em vez de não entregar. Um `SELECT` que devolveu a
coluna trocada é matéria da aula seguinte. Um arquivo vazio não é nada.

## Conferindo antes do push

```bash
python conferir.py
```

Ele diz, por exercício: **rodou** (com quantas linhas voltaram), **vazio**, ou
**ERRO** com a mensagem do SQLite. E não diz se a resposta está certa — isso é
com você e com a defesa.

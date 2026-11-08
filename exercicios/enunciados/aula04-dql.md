# Aula 04 — Agora a gente pergunta pro banco

**Arquivo de resposta:** `exercicios/<seu-nome>/aula04.sql`

Cada exercício abaixo começa um bloco novo no seu arquivo, marcado com
`-- ex1`, `-- ex2`, e assim por diante.

Os blocos rodam sobre o **banco da secretaria já carregado** — `TURMA`, `ALUNO`,
`MODALIDADE`, `INSCRICAO`, os mesmos dados da aula passada. Você não vai mudar
nada hoje, só perguntar. `SELECT` não mexe no banco: ele lê e devolve uma
tabela de resposta.

---

## O estrago do dia

Você quer a lista de todos os alunos que **não** são da turma 1. Escreve o
óbvio:

```sql
SELECT nome FROM ALUNO WHERE id_turma != 1;
```

E a lista volta errada. O João Vitor, que está **sem turma**, não aparece. Mas
ele claramente não é da turma 1, então deveria estar na lista.

O motivo é a coisa mais escorregadia do SQL inteiro: o `id_turma` do João Vitor
é `NULL`, e `NULL` não é igual a nada nem diferente de nada. Não é `!= 1`, não é
`= 1`. É "não sei". E o banco, quando não sabe, deixa a linha de fora.

```sql
SELECT nome FROM ALUNO WHERE id_turma != 1;   -- NÃO traz quem está sem turma
SELECT nome FROM ALUNO WHERE id_turma IS NULL; -- é assim que se pergunta por vazio
```

⚠️ Para `NULL` não se usa `=` nem `!=`. Usa-se `IS NULL` e `IS NOT NULL`. Quem
esquece isso entrega relatório com gente faltando e não percebe, porque a
consulta roda normal.

---

### ex1 — a lista simples

Traga só o `nome` e o `nascimento` de todos os alunos. Nada de `SELECT *`:
escolha as colunas.

### ex2 — o filtro

Traga o `nome` dos alunos da turma 1. Antes de rodar, diga para você mesmo
quantas linhas espera. Depois confira.

### ex3 — o filtro por texto

Traga as inscrições com `situacao` igual a `ativa`. Conte quantas linhas
voltaram e anote o número em comentário.

### ex4 — o vazio

Traga o `nome` dos alunos que estão **sem turma**. Depois rode a versão com
`id_turma != 1`, olhe a diferença, e escreva em comentário por que os alunos sem
turma não aparecem nela.

### ex5 — duas condições

Traga os alunos da turma 2 que nasceram a partir de 2009. Use `AND`. Depois
troque por `OR` e, em comentário, explique com suas palavras por que o `OR`
devolve muito mais gente.

### ex6 — (Desafio) a consulta que mente

Esta consulta roda sem erro e responde a pergunta errada:

```sql
SELECT nome FROM ALUNO WHERE id_turma = 1 OR id_turma = 2 AND id_turma IS NOT NULL;
```

A intenção era: alunos da turma 1 ou da turma 2. Rode, veja o resultado, e
descubra o que o banco entendeu de verdade. Escreva em comentário qual foi o
engano e a versão corrigida. Dica: o banco resolve `AND` antes de `OR`, e
parênteses existem por causa disso.

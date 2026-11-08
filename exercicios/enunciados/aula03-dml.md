# Aula 03 — O dado entra, e o banco discute

**Arquivo de resposta:** `exercicios/<seu-nome>/aula03.sql`

Cada exercício abaixo começa um bloco novo no seu arquivo, marcado com
`-- ex1`, `-- ex2`, e assim por diante.

**O que mudou da aula passada:** aqui os blocos rodam sobre o **banco da
secretaria já carregado** — as quatro tabelas (`TURMA`, `ALUNO`, `MODALIDADE`,
`INSCRICAO`) com os dados que você conhece. Não crie nada, use o que está lá.

E comece **todo bloco** com a linha abaixo:

```sql
PRAGMA foreign_keys = ON;
```

O SQLite vem com a checagem de chave estrangeira desligada por padrão. Sem essa
linha, ele aceita um aluno apontando para uma turma que não existe e não
reclama. Com ela, ele passa a cobrar o que você declarou lá no `CREATE TABLE`.

---

## O estrago do dia

A secretaria precisa corrigir uma inscrição: a da Carla, que está `trancada` e
deveria estar `ativa`. Alguém abre o banco e escreve:

```sql
UPDATE INSCRICAO SET situacao = 'ativa';
```

O banco responde que atualizou 4.000 linhas.

Não deu erro. Não perguntou nada. Fez exatamente o que foi mandado: ponha
`ativa` em `situacao`. Em todas. Faltou dizer **em qual**, e nessa frase que
faltou moram as 4.000 inscrições da escola inteira.

```sql
UPDATE INSCRICAO SET situacao = 'ativa';                     -- 4.000 linhas
UPDATE INSCRICAO SET situacao = 'ativa' WHERE id_aluno = 3;  -- 1 linha
```

A diferença é o `WHERE`. É a mesma ausência do `WHERE` que, no `DELETE FROM` da
aula passada, esvaziava a tabela de propósito. Lá era o que a gente queria. Aqui
é o acidente.

⚠️ A regra do trimestre, agora para `UPDATE` e `DELETE`: antes de rodar, rode o
`SELECT` com o **mesmo** `WHERE` e veja quantas linhas aparecem. Custa cinco
segundos e é a diferença entre corrigir uma inscrição e reescrever a escola.

---

### ex1 — a turma nova

Insira a turma `1J`, turno `noite`, e dois alunos nela. Use a forma com os nomes
das colunas, nunca a forma curta. Pense na ordem: quem precisa existir primeiro?

### ex2 — a recusa

Tente inserir um aluno na turma de `id` 99, que não existe. Deixe o comando no
arquivo, comentado, junto com a mensagem que o banco devolveu. Depois escreva a
versão que funciona.

### ex3 — o conserto da Carla

A inscrição da Carla (aluno 3) em Voleibol (modalidade 2) está `trancada` e
deveria estar `ativa`. Escreva o `SELECT` de conferência primeiro e, embaixo, o
`UPDATE` que corrige só ela.

### ex4 — o remanejamento

O João Vitor (aluno 10) está sem turma. Coloque ele na turma 2. Depois escreva,
em comentário, o `UPDATE` errado que colocaria **todos** os alunos da escola na
turma 2, e diga quantas linhas ele pegaria.

### ex5 — o que o banco não deixa apagar

Tente apagar a turma 1 e registre, em comentário, o que aconteceu e por quê.
Depois apague o aluno 10, que o banco deixa, e explique em uma linha a diferença
entre os dois casos.

### ex6 — (Desafio) as três decisões

Num único bloco, crie três pares de tabelas de teste (`PAI_A`/`FILHO_A`,
`PAI_B`/`FILHO_B`, `PAI_C`/`FILHO_C`), cada par com uma opção diferente de
`ON DELETE`: `RESTRICT`, `CASCADE` e `SET NULL`.

Insira um pai e dois filhos em cada, apague o pai dos três e rode um `SELECT` em
cada tabela de filhos. Escreva em comentário o que sobrou em cada caso, e qual
das três opções você usaria entre `ALUNO` e `INSCRICAO`, com o motivo.

# Aula 04: O banco responde

**Arquivo de resposta:** `exercicios/<seu-nome>/aula04.sql`

Cada exercício abaixo começa um bloco novo no seu arquivo, marcado com
`-- ex1`, `-- ex2`, e assim por diante.

Hoje os blocos rodam sobre o **banco da secretaria já carregado** (`TURMA`,
`ALUNO`, `MODALIDADE`, `INSCRICAO`), os mesmos dados da aula passada. Não crie
tabela, não insira dado, não altere registro. `SELECT` só lê e devolve uma
tabela de resposta.

**Regra do arquivo:** antes de cada `SELECT`, escreva a pergunta em português,
em comentário. Exemplo:

```sql
-- ex3
-- Pergunta: quais alunos estão sem turma?
SELECT nome FROM ALUNO WHERE id_turma IS NULL;
```

---

## O estrago do dia

A coordenação pergunta: "quais alunos estão sem turma?". Alguém escreve:

```sql
SELECT * FROM ALUNO WHERE id_turma = 0;
```

O banco executa. Nenhum erro, nenhum aviso. A resposta vem vazia, e quem
olha pensa: "ótimo, ninguém está sem turma".

Só que tem aluno sem turma. No banco, "sem turma" não é o número zero. É
`NULL`, que quer dizer "não há valor registrado".

```sql
SELECT * FROM ALUNO WHERE id_turma = 0;       -- roda, devolve vazio, está errada
SELECT * FROM ALUNO WHERE id_turma IS NULL;   -- a pergunta certa
```

⚠️ A consulta rodou e respondeu **outra pergunta**. Esse é o erro mais caro do
SQL, porque ninguém desconfia dele. Hoje o jogo é esse: antes de escrever, diga
em português o que a consulta precisa responder. Depois de rodar, confira se o
número de linhas faz sentido.

---

### ex1: escolher colunas

Mostre apenas o `nome` e o `nascimento` dos alunos. Nada de `SELECT *`.

### ex2: filtrar linhas

Liste o nome dos alunos da turma de `id` 1. Depois, em outra consulta, liste
as inscrições cuja `situacao` é `ativa`.

### ex3: procurar o que não existe

Liste os alunos sem turma, usando a forma correta de testar `NULL`. Depois
deixe, em comentário, a consulta errada com `= NULL` e explique por que ela não
responde à pergunta.

### ex4: duas condições

Liste as inscrições ativas da modalidade 2. Depois faça uma segunda consulta
que mostre os alunos das turmas 1 ou 2 usando `IN`.

### ex5: texto e intervalo

Liste os alunos cujo nome começa com a letra `A`. Depois liste as inscrições
realizadas entre `2026-05-01` e `2026-05-31`.

Antes de rodar a segunda, escreva em comentário quantas linhas você espera.
Depois confira o que voltou e anote se bateu.

### ex6: ordenar e limitar

Mostre os alunos em ordem alfabética. Em outra consulta, mostre as três
primeiras linhas depois de ordenar pelo nome.

### ex7: consultas que parecem certas

Corrija as três consultas abaixo. Deixe a versão errada em comentário, escreva a
versão corrigida embaixo e diga, em comentário, qual era o erro lógico de cada
uma.

```sql
-- a) alunos sem turma
SELECT nome FROM ALUNO WHERE id_turma = 0;

-- b) nomes que começam com Ana
SELECT nome FROM ALUNO WHERE nome = 'Ana%';

-- c) inscrições ativas ou trancadas da modalidade 2
SELECT * FROM INSCRICAO
WHERE situacao = 'ativa'
   OR situacao = 'trancada'
  AND id_modalidade = 2;
```

### ex8: ler uma consulta

Para cada consulta abaixo, escreva em português a pergunta que ela responde e
diga quantas linhas você espera encontrar **antes** de executar. Depois execute
e anote se acertou.

```sql
SELECT nome FROM ALUNO WHERE id_turma IS NULL;
SELECT nome FROM ALUNO WHERE nome LIKE '%Silva%' ORDER BY nome;
SELECT * FROM INSCRICAO
WHERE situacao = 'ativa' AND data >= '2026-09-01';
```

### ex9: (Desafio) perguntas do caso do trio

Escreva três perguntas reais sobre o domínio do projeto de vocês e transforme
cada uma em um `SELECT`. Pelo menos uma deve usar `IS NULL`, `LIKE`, `IN` ou
`BETWEEN`, e pelo menos uma deve usar `ORDER BY`.

Como o `aula04.sql` roda no banco da secretaria e as tabelas do trio não
existem lá, deixe as três perguntas e as três consultas **em comentário** no
`aula04.sql`. As consultas de verdade vão para o `projeto/03-consultas.sql`,
pelo dono do arquivo.

---

## Entrega

```
git pull
git add exercicios/seunome/aula04.sql
git commit -m "aula04 - exercicios de DQL"
git push
```

Depois do push, confira a aba `Actions`. **Rodou** quer dizer que o SQL
executou. Não quer dizer que a consulta respondeu a pergunta certa.

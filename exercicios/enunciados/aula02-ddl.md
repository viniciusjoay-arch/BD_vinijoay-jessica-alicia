# Aula 02 — Criando as tabelas

**Arquivo de resposta:** `exercicios/<seu-nome>/aula02.sql`

Cada exercício abaixo começa um bloco novo no seu arquivo, marcado com
`-- ex1`, `-- ex2`, e assim por diante.

Cada bloco roda num **banco em branco**. Ou seja: se o ex3 mexe numa tabela, é
porque aquele mesmo bloco criou ela antes. Não dá para contar com o que ficou
do exercício anterior, nem com o banco de apoio.

---

## O estrago do dia

A tabela `INSCRICAO` já está em produção com 300 linhas. A coordenação pede uma
coisa razoável: registrar quem autorizou cada inscrição, e isso é obrigatório.

Você faz o óbvio:

```sql
ALTER TABLE INSCRICAO ADD COLUMN autorizado_por TEXT NOT NULL;
```

E o banco recusa. Não é implicância: ele está te perguntando o que vai colocar
nas 300 linhas que já existem, já que `NOT NULL` proíbe deixar em branco. Ou
você dá um valor padrão, ou a coluna nasce aceitando nulo e você preenche
depois. Guarde essa: quase todo `ALTER` que dá errado dá errado por causa de
dado que já está lá.

---

### ex1 — `CREATE TABLE`

Crie a tabela `LIVRO`, com:

- `id` inteiro, chave primária
- `titulo` texto, obrigatório
- `autor` texto, obrigatório
- `ano` inteiro
- `exemplares` inteiro, obrigatório, valendo `1` quando ninguém informar

Depois insira dois livros, para provar que a tabela aceita dado.

### ex2 — a coluna que faltou

No mesmo bloco: crie a tabela `LEITOR` (`id` chave primária, `nome` obrigatório)
e insira três leitores.

Só depois descubra que faltou o telefone, e adicione a coluna `telefone` com um
`ALTER TABLE`. Rode um `SELECT * FROM LEITOR` no fim e olhe o que ficou nas três
linhas que já existiam.

### ex3 — a coluna obrigatória que faltou

Mesmo enredo, agora com o problema do estrago de hoje.

Crie `EMPRESTIMO` (`id` chave primária, `id_livro` inteiro obrigatório) e insira
duas linhas. Depois adicione a coluna `situacao`, texto, **obrigatória**, sem
quebrar as duas linhas que já estão lá.

Dica: o `ALTER TABLE` aceita `DEFAULT`. Use, e escolha o valor padrão pensando
no que é verdade sobre um empréstimo que já existia antes da coluna existir.

### ex4 — o nome errado

Crie a tabela `EDITORA` com as colunas `id` e `nm` (sim, `nm`). Insira uma
linha. Depois renomeie a coluna `nm` para `nome`, sem apagar a tabela e sem
perder a linha.

### ex5 — esvaziar e derrubar

Crie a tabela `RASCUNHO` (`id` chave primária, `texto` texto), insira três
linhas e então:

1. esvazie a tabela, mantendo a estrutura;
2. confira com um `SELECT` que ela ficou vazia;
3. derrube a tabela inteira.

⚠️ O `TRUNCATE` que você vai ver na internet **não existe no SQLite**. Aqui o
esvaziamento é `DELETE FROM RASCUNHO;` sem `WHERE`. Repare no que isso significa:
a coisa mais destrutiva que você faz nesta aula é a mesma linha que, com um
`WHERE` esquecido na aula que vem, apaga o banco da secretaria.

### ex6 — (Desafio) as duas com a associativa

Num único bloco, monte o miolo do banco de uma biblioteca:

- `LIVRO` (`id`, `titulo`)
- `LEITOR` (`id`, `nome`)
- `EMPRESTIMO`, a associativa entre os dois, com `data_saida` e `data_volta`

A associativa precisa ter chave estrangeira para as duas tabelas, e a chave
primária dela tem que impedir que o mesmo leitor pegue o mesmo livro duas vezes
**no mesmo dia** — e permitir que ele pegue de novo em outro dia.

Insira dois empréstimos válidos. Depois escreva, em comentário, um `INSERT` que
a sua chave primária deveria recusar, e diga por quê.

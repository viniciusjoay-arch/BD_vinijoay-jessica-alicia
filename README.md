# Banco de Dados I — 3º Trimestre

**CEEP Pedro Boaretto Neto · Técnico em Desenvolvimento de Sistemas · Prof. Diego**

Este é o repositório do **seu trio**. O caso que vocês escolherem na Aula 01 é
modelado, criado, carregado, consultado e defendido aqui dentro.

---

## Como este repositório funciona

```
modelo/                 o modelo do caso do trio        -> Aula 01, os três juntos
exercicios/<seu-nome>/  os exercícios de cada aula      -> vale ENTREGA (1,0)
projeto/                o banco do trio, em três arquivos com dono
banco/                  banco de apoio das aulas (não é o de vocês)
```

**Os exercícios das aulas valem por fazer.** Você não perde ponto por errar um
exercício de aula. Perde por não entregar.

**O projeto vale por defender.** Cada um dos três arquivos de `projeto/` tem um
dono declarado, e na defesa o dono responde pelo que está no arquivo dele.

---

## A primeira coisa a fazer

Cada integrante cria a própria pasta dentro de `exercicios/`, com o próprio
primeiro nome, em minúsculo e sem acento:

```
exercicios/ana/
exercicios/bruno/
exercicios/carla/
```

Tem uma pasta `SEU-NOME/` de exemplo lá dentro. Copie ela três vezes,
renomeie e apague a original.

Por que separado, se o repositório é do trio? Porque exercício de aula é
individual. E porque o histórico do Git mostra quem enviou o quê: é isso que
confirma o dono na hora da defesa.

---

## A regra que não se negocia: o contrato

O enunciado diz o **nome do arquivo** e o **número do exercício**. Você não muda
nem um nem outro.

Cada arquivo é uma aula: `aula02.sql`, `aula03.sql`, e assim por diante. Dentro
dele, cada exercício começa com um marcador em comentário:

```sql
-- ex1
SELECT nome FROM ALUNO;

-- ex2
SELECT nome, turno FROM TURMA ORDER BY nome;
```

O corretor procura por esses marcadores. Sem marcador, o exercício não é
encontrado. Isso não é frescura de professor: é a mesma razão pela qual uma
coluna se chama `id_aluno` nas quatro tabelas e não `idAluno` numa e `aluno_id`
noutra. Nome combinado é contrato.

---

## Antes de entregar, rode

```bash
python banco/montar.py    # monta o banco de apoio (uma vez, ou quando bagunçar)
python conferir.py        # confere o que você já entregou
```

O `conferir.py` executa cada bloco do seu arquivo num banco novo e diz uma de
três coisas: **rodou**, **vazio** ou **ERRO** com a mensagem do SQLite.

Repare no que ele **não** diz: se a resposta está certa. Ele diz se o banco
entendeu. `SELECT nome FROM ALUNO` roda lindamente quando a pergunta era o
telefone.

---

## Enviando

```bash
git add .
git commit -m "aula04 ex1 a ex5"
git push
```

Commite várias vezes ao longo do trabalho, não uma vez só no fim. E commite da
**sua** conta: no trio, o histórico é o que diz quem fez o quê.

Depois do push, abra o repositório no GitHub: aparece um ✓ verde ou um ✗
vermelho ao lado do seu commit, e clicando nele você vê a conferência completa.

Vermelho **não** tira sua nota de entrega. Vermelho quer dizer que algum SQL que
você entregou não executa. Você quer saber disso.

---

## Recebendo os enunciados

Os enunciados de cada aula são publicados durante o trimestre. Configure uma vez:

```bash
git remote add upstream URL_DO_REPOSITORIO_MODELO
```

E quando o professor avisar que saiu:

```bash
git pull upstream main
```

Isso traz os enunciados novos sem mexer no que vocês já fizeram.

---

## Prazos e ajuda

- Exercício de aula fecha **na aula seguinte**.
- Você pode usar qualquer coisa para **entender**: livro, internet, colega, IA.
  O que você não pode é entregar SQL que não sabe explicar. Toda entrega pode
  ser arguida, e no projeto ela **vai** ser.

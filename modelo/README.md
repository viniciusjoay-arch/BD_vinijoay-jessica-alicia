# O modelo do caso do trio

Feito na **Aula 01**, pelos três juntos. É a única entrega do repositório que
não tem dono individual: se o modelo estiver errado, os três arquivos do
projeto vão estar errados junto.

## O que entra aqui

| Arquivo | O que é |
|---|---|
| `frase.md` | o caso em uma frase, e a lista de entidades |
| `conceitual.png` | o MER, exportado do draw.io |
| `conceitual.drawio` | o arquivo editável, para poder corrigir depois |
| `logico.md` | as tabelas em texto, com chaves e FKs |

## O requisito mínimo

O caso de vocês precisa de **pelo menos 4 tabelas** e **pelo menos um N:N com
atributo próprio na associativa**.

Atributo próprio quer dizer um dado que não é de nenhum dos dois lados. A data
de uma inscrição não é do aluno nem da modalidade: é da inscrição. A nota de uma
avaliação não é do aluno nem da prova. Se a associativa de vocês só tem as duas
chaves e mais nada, o caso ainda não está pronto.

## `logico.md`: como escrever

Texto puro, sem desenho. Chave primária sublinhada com `_`, chave estrangeira
marcada:

```
ALUNO (_id_, nome, nascimento, id_turma -> TURMA)
TURMA (_id_, nome, turno)
MODALIDADE (_id_, nome, vagas, responsavel)
INSCRICAO (_id_aluno -> ALUNO, id_modalidade -> MODALIDADE_, data, situacao)
```

Este é o texto que vira o `projeto/01-ddl.sql` na Aula 02. Se ele estiver
completo, o DDL é quase transcrição. Se estiver vago, vocês vão inventar coluna
no meio do `CREATE TABLE`, e aí cada um inventa uma coisa diferente.

# O banco do trio

Três arquivos, três donos. O modelo em `modelo/` é dos três; estes aqui, não.

| Arquivo | Dono | Entrega na | O que o dono responde na defesa |
|---|---|---|---|
| `01-ddl.sql` | | Aula 02 | por que essa tabela existe separada, por que esse tipo |
| `02-carga.sql` | | Aula 03 | por que esse dado foi aceito e aquele recusado |
| `03-consultas.sql` | | Aula 05 | por que essa junção, que pergunta ela responde |

Preencham a coluna **Dono** na Aula 01, antes de escrever a primeira linha de
SQL. E cada um envia o próprio arquivo **pela própria conta do GitHub**: o
histórico é o que confirma quem fez o quê. Um integrante commitando os três
arquivos é o mesmo que os três chegarem sem saber explicar nada.

## Requisito do caso

Mínimo **4 tabelas** e pelo menos um **N:N com atributo próprio** na
associativa.

## Ordem

`01-ddl.sql` cria as tabelas vazias. `02-carga.sql` enche elas. `03-consultas.sql`
pergunta coisas para elas. Rodando os três na ordem, num banco em branco, tem
que funcionar do zero — é assim que vai ser corrigido:

```bash
python banco/montar.py            # so para o banco de apoio das aulas
python projeto/montar_projeto.py  # o banco de voces, do zero
```

Se o `02-carga.sql` só funciona porque você inseriu uma linha na mão pelo
programa gráfico, ele está quebrado e você ainda não sabe.

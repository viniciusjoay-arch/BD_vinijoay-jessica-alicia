"""Conferencia de entrega dos exercicios das aulas.

Roda sozinho no GitHub a cada push, e voce pode rodar na sua maquina:

    python conferir.py

O que ele faz: procura as pastas de cada integrante dentro de exercicios/,
abre os arquivos aulaNN.sql, separa os exercicios pelos marcadores (-- ex1,
-- ex2, ...) e executa cada bloco num banco novo em memoria.

O que ele NAO faz: dizer se a sua resposta esta certa. Exercicio de aula vale
por entrega. O que ele acusa e coisa que voce quer saber mesmo assim: bloco
vazio, marcador faltando e SQL que nao roda.
"""

import pathlib
import sqlite3
import sys

RAIZ = pathlib.Path(__file__).parent
EXERCICIOS = RAIZ / "exercicios"
CARGA = (RAIZ / "banco" / "escola.sql").read_text(encoding="utf-8")

# Contra o que cada aula roda. "escola" = o banco de apoio ja carregado.
# "vazio" = banco em branco, porque a propria resposta cria as tabelas.
AULAS = {
    "aula02": "vazio",    # DDL
    "aula03": "escola",   # DML
    "aula04": "escola",   # DQL I
    "aula05": "escola",   # DQL II
    "aula06": "escola",   # DQL III
    "aula07": "escola",   # DTL
    "aula09": "escola",   # indices
}

IGNORAR = {"enunciados"}


def blocos(texto):
    """Separa o arquivo em (rotulo, sql) usando os marcadores -- exN."""
    achados = []
    rotulo = None
    corpo = []
    for linha in texto.splitlines():
        nu = linha.strip().lower().replace("-", " ").replace("=", " ")
        partes = nu.split()
        if partes and partes[0].startswith("ex") and partes[0][2:].isdigit():
            if rotulo:
                achados.append((rotulo, "\n".join(corpo)))
            rotulo = partes[0]
            corpo = []
        elif rotulo:
            corpo.append(linha)
    if rotulo:
        achados.append((rotulo, "\n".join(corpo)))
    return achados


def limpo(sql):
    """Sobra alguma coisa alem de comentario e linha em branco?"""
    for linha in sql.splitlines():
        s = linha.strip()
        if s and not s.startswith("--"):
            return True
    return False


def rodar(sql, base):
    con = sqlite3.connect(":memory:")
    try:
        if base == "escola":
            con.executescript(CARGA)
        cur = con.executescript(sql) if ";" in sql.strip()[:-1] else con.execute(sql)
        try:
            n = len(cur.fetchall())
            return f"rodou, {n} linha(s)" if n else "rodou"
        except sqlite3.ProgrammingError:
            return "rodou"
    except sqlite3.Error as e:
        return f"ERRO: {e}"
    finally:
        con.close()


def main():
    if not EXERCICIOS.is_dir():
        print("Nao existe a pasta exercicios/. Nada para conferir.")
        return 0

    pastas = sorted(
        p for p in EXERCICIOS.iterdir() if p.is_dir() and p.name not in IGNORAR
    )
    if not pastas:
        print("Nenhuma pasta de integrante em exercicios/ ainda.")
        return 0

    houve_erro = False
    print("## Conferencia de entrega\n")

    for pasta in pastas:
        print(f"### {pasta.name}\n")
        if pasta.name.upper() == "SEU-NOME":
            print("Esta pasta ainda esta com o nome de modelo. "
                  "Renomeie para o seu primeiro nome.\n")

        arquivos = sorted(pasta.glob("aula*.sql"))
        if not arquivos:
            print("Nenhum arquivo aulaNN.sql entregue ainda.\n")
            continue

        for arq in arquivos:
            aula = arq.stem.lower()
            base = AULAS.get(aula, "escola")
            achados = blocos(arq.read_text(encoding="utf-8"))
            if not achados:
                print(f"- `{arq.name}`: nenhum marcador `-- ex1` encontrado.")
                continue
            partes = []
            for rotulo, sql in achados:
                if not limpo(sql):
                    partes.append(f"{rotulo}: vazio")
                    continue
                r = rodar(sql, base)
                if r.startswith("ERRO"):
                    houve_erro = True
                partes.append(f"{rotulo}: {r}")
            print(f"- `{arq.name}`")
            for p in partes:
                print(f"  - {p}")
        print()

    if houve_erro:
        print("\n**Vermelho.** Algum bloco nao roda. Vermelho aqui nao tira "
              "sua nota de entrega, mas quer dizer que aquele SQL nao "
              "executa: leia a mensagem, ela diz a palavra em que travou.")
        return 1

    print("\n**Verde.** Tudo que voce entregou executa. Isso nao quer dizer "
          "que a resposta esta certa: quer dizer que o banco entendeu.")
    return 0


if __name__ == "__main__":
    sys.exit(main())

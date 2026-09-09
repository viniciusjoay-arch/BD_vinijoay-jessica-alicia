"""Monta o banco do trio do zero, na ordem: DDL, carga, consultas.

    python projeto/montar_projeto.py

E assim que o professor vai rodar. Se travar aqui, travou na correcao.
"""

import pathlib
import sqlite3
import sys

AQUI = pathlib.Path(__file__).parent
BANCO = AQUI / "projeto.db"
ORDEM = ["01-ddl.sql", "02-carga.sql", "03-consultas.sql"]

if BANCO.exists():
    BANCO.unlink()

con = sqlite3.connect(BANCO)
con.execute("PRAGMA foreign_keys = ON")

for nome in ORDEM:
    arq = AQUI / nome
    if not arq.exists():
        print(f"{nome}: ainda nao entregue")
        continue
    try:
        con.executescript(arq.read_text(encoding="utf-8"))
        con.commit()
        print(f"{nome}: ok")
    except sqlite3.Error as e:
        print(f"{nome}: ERRO -> {e}")
        con.close()
        sys.exit(1)

tabelas = con.execute(
    "SELECT name FROM sqlite_master WHERE type='table' ORDER BY name"
).fetchall()
print(f"\nBanco em {BANCO}")
for (nome,) in tabelas:
    n = con.execute(f"SELECT COUNT(*) FROM {nome}").fetchone()[0]
    print(f"  {nome:<16} {n:>4} linhas")

if len(tabelas) < 4:
    print("\nAtencao: o caso precisa de no minimo 4 tabelas.")

con.close()

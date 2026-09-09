"""Monta o banco de apoio (banco/escola.db) a partir do escola.sql.

Use isto se voce nao tem o programa sqlite3 na linha de comando.

    python banco/montar.py

Pode rodar quantas vezes quiser: o script apaga as tabelas e refaz tudo.
Se voce baguncou o banco testando UPDATE sem WHERE, rode de novo.
"""

import pathlib
import sqlite3

AQUI = pathlib.Path(__file__).parent
SQL = AQUI / "escola.sql"
BANCO = AQUI / "escola.db"

con = sqlite3.connect(BANCO)
con.executescript(SQL.read_text(encoding="utf-8"))
con.commit()

tabelas = con.execute(
    "SELECT name FROM sqlite_master WHERE type='table' ORDER BY name"
).fetchall()

print(f"Banco montado em {BANCO}")
for (nome,) in tabelas:
    n = con.execute(f"SELECT COUNT(*) FROM {nome}").fetchone()[0]
    print(f"  {nome:<12} {n:>3} linhas")

con.close()

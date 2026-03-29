# development-template

Personal Python & SQL prototyping environment.

## Setup

```bash
make install   # create venv and install dependencies
make lab       # launch JupyterLab
```

## Structure

```text
data/          # local data files (gitignored)
notebooks/     # Jupyter notebooks — primary workspace
sql/           # SQL queries and schema definitions
```

## Tools

| Tool | Purpose |
| --- | --- |
| [DuckDB](https://duckdb.org) | In-process SQL database — reads CSV, Parquet, JSON directly |
| [Pandas](https://pandas.pydata.org) | DataFrames |
| [JupyterLab](https://jupyterlab.readthedocs.io) | Interactive notebooks |
| [ruff](https://docs.astral.sh/ruff) | Linting and formatting (`make format`) |
| [python-dotenv](https://saurabh-kumar.com/python-dotenv) | Load `.env` credentials and paths |

## Quick start — DuckDB in a notebook

```python
import duckdb
import pandas as pd
from dotenv import load_dotenv

load_dotenv()

con = duckdb.connect("../data/dev.db")  # persistent DB, or use ":memory:"

# Query a CSV directly
df = con.execute("SELECT * FROM read_csv_auto('../data/myfile.csv')").df()

# Register a DataFrame as a table
con.register("my_df", df)
con.execute("SELECT * FROM my_df WHERE value > 100").df()
```

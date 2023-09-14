rm -rf .mypy_cache .pytest_cache .ruff_cache src/python_template.egg_info venv .coverage pyvenv.cfg
set -e
python3 -m venv ./venv
./venv/bin/pip install -e '.[dev]'
./venv/bin/isort .
./venv/bin/black src
./venv/bin/black tests
./venv/bin/ruff check src
./venv/bin/ruff check tests
./venv/bin/mypy
./venv/bin/pytest
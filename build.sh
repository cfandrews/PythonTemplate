rm -rf ./build ./src/pythontemplate.egg-info
set -e
python3 -m venv ./build/venv
./build/venv/bin/pip install -e '.[build]'
./build/venv/bin/pre-commit install
./build/venv/bin/isort ./src
./build/venv/bin/isort ./tests
./build/venv/bin/ruff format ./src
./build/venv/bin/ruff format ./tests
./build/venv/bin/ruff check ./src
./build/venv/bin/ruff check ./tests
./build/venv/bin/mypy --cache-dir ./build/mypy
./build/venv/bin/pytest ./tests
./build/venv/bin/pdoc ./src/pythontemplate -o ./build/pdoc -t .
./build/venv/bin/python3 -m build --outdir ./build/build
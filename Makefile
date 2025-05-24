# Default target executed when no arguments are given to make.
all: help

lint:
	uv run --group lint ruff check .

format:
	uv run --group lint ruff format .

test:
	uv run --group test pytest

wheel:
	uv build

# 'make docs' is a make command, use 'doc' instead of 'docs' to avoid conflict
doc:
	uv run --group docs mkdocs build

clean:
	rm -rf .venv
	rm -rf dist
	rm -rf .pytest_cache
	rm -rf .mypy_cache
	rm -rf .ruff_cache
	rm -rf site

######################
# HELP
######################

help:
	@echo '----'
	@echo 'lint                         - run linters'
	@echo 'format                       - run code formatters'
	@echo 'test                         - run unit tests'
	@echo 'wheel                        - build wheel package'
	@echo 'doc                          - build documentation site'
	@echo 'clean                        - clean up (uv cache clean can be used for uv specific caches)'

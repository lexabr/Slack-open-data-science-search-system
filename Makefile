# commands
lint:
	@flake8 src
	@pydocstyle src

test:
	@pytest

install:
	@pip install -U -r requirements.dev.txt
	@pip install -U -r requirements.txt

localisation:
	@pybabel compile -D app -d src/locales/ -l ru
	@pybabel compile -D app -d src/locales/ -l en
	@export PYTHONPATH="${PYTHONPATH}:{pwd}/src"

doc:
	@cd doc
	@make html

build: lint install localisation doc

run:
	@streamlit run src/app/MainPage.py

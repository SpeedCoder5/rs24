# HELP
.PHONY: help
PROJECT_NAME=rs24

# First, install python version and associated venv
# sudo apt install python3.9
# sudo apt install python3.9-venv

# Set python version for make venv
PYTHON=/usr/bin/python3.9 

help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

clean: ## Removes build artifacts
	find . | grep -E "(__pycache__|\.pyc|\.pyo|\.egg-info|\dist|\.pytest_cache)" | xargs rm -rf;

clean-all: clean ## Remove the virtual environment and build artifacts
	rm -rf $(HOME)/.virtualenvs/$(PROJECT_NAME);

venv: ## Create/update project's virtual enviornment. To activate, run: source activate.sh
	$(PYTHON) -m venv $(HOME)/.virtualenvs/$(PROJECT_NAME); \
	. $(HOME)/.virtualenvs/$(PROJECT_NAME)/bin/activate; \
	python -m pip install --upgrade pip; \
	python -m pip install -r requirements-torch.txt -f https://download.pytorch.org/whl/torch_stable.html; \
	python -m pip install -v -r requirements.txt; \
	python -m ipykernel install --user --name=$(PROJECT_NAME); \
	chmod 775 activate; \
	echo "Virtual environment created at $(HOME)/.virtualenvs/$(PROJECT_NAME)."; \
	echo "To activate the virtual environment, run 'source activate'";

.DEFAULT_GOAL := help

.PHONY: install lab format clean help

install: ## Install dependencies
	uv sync

lab: ## Launch JupyterLab
	uv run jupyter lab

format: ## Format and fix Python code
	uv run ruff format .
	uv run ruff check --fix .

clean: ## Remove caches and notebook checkpoints
	find . -type d -name __pycache__ -exec rm -rf {} +
	find . -type d -name .ipynb_checkpoints -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete

help: ## Show available commands
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

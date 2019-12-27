.ONESHELL:
.SHELL := /bin/bash
.PHONY: ALL
.DEFAULT_GOAL := help

help:
	@echo "Available targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

init: ## Install required tools for local environment
	brew install tfenv || exit 0
	tfenv install || exit 0
	brew install terraform_landscape || exit 0

fmt: ## Formats the TF
	terraform fmt -recursive

config-plan: ## TF Plan the cloud-config directory
	make _plan dir=cloud-config

config-apply: ## TF Apply the cloud-config directory
	make _apply dir=cloud-config

project-local: ## Sets the `project` directory workspace to `local`
	cd project && \
	terraform workspace select local

project-remote: ## Sets the `project` directory workspace to `remote`
	cd project && \
	terraform workspace select remote

project-plan: ## TF Plan the project-local directory
	make _plan dir=project

project-apply: ## TF Apply the project directory
	make _apply dir=project

remote-data-plan: ## TF Plan the remote-data directory
	make _plan dir=remote-data

remote-data-apply: ## TF Apply the remote-data directory
	make _apply dir=remote-data

_plan:
	cd $$dir && \
	terraform init && \
	terraform plan

_apply:
	cd $$dir && \
	terraform apply -auto-approve

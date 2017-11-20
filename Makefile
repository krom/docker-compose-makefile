default: help

include .makefile-lib/common.mk
include .makerc

.PHONY: help dependencies

help: ##@other Show this help.
	@perl -e '$(HELP_FUN)' $(MAKEFILE_LIST)

dependencies: check-dependencies ## Check dependencies

start: ## Start all containers
	@${DOCKER_COMPOSE} up -d $(c)

stop: ## Stop all containers
	@${DOCKER_COMPOSE} stop $(c)

status: ## Show status of containers
	@${DOCKER_COMPOSE} ps

ps: status ## Alias of status

clean: ## Clean all data
	@${DOCKER_COMPOSE} down

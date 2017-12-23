include .makefile-lib/common.mk

.PHONY: help dependencies

dependencies: check-dependencies ## Check dependencies

start: ## Start all containers
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up -d $(c)

stop: ## Stop all containers
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) stop $(c)

status: ## Show status of containers
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) ps

restart: ## Restart of containers
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) stop $(c)
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up $(c) -d

ps: status ## Alias of status

clean: ## Clean all data
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down

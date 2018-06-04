include $(ROOT_DIR)/.mk-lib/variables.mk
-include $(ROOT_DIR)/.mk-lib/version.mk
-include $(ROOT_DIR)/.make.env
-include .make.env

f ?= $(DOCKER_COMPOSE_FILE)
DOCKER_COMPOSE_FILE := $(f)

.DEFAULT_GOAL := help

help: ##@other Show this help.
	@perl -e '$(HELP_FUN)' $(MAKEFILE_LIST)

mk-upgrade: ##@other Check for updates of mk-lib
	@MK_VERSION=$(MK_VERSION) MK_REPO=$(MK_REPO) $(ROOT_DIR)/.mk-lib/self-upgrade.sh

mk-version: ##@other Show current version of mk-lib
	@echo $(MK_VERSION)

check-dependencies:
	@echo Checking dependencies
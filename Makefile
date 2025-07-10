DASEL := $(shell which dasel)
PACKWIZ := $(shell which packwiz)
# SHELL := /bin/bash

PROFILE_MAIN := profiles/main/
PROFILE_LITE := profiles/lite/
PROFILE_ADMIN := profiles/admin/
CONFIG_MAIN := profiles/main/config/
CONFIG_LITE:= profiles/lite/config/
CONFIG_ADMIN:= profiles/admin/config/
MODS_MAIN := profiles/main/mods/
MODS_LITE:= profiles/lite/mods/
MODS_ADMIN:= profiles/admin/mods/

define main-configs
	@for item in ${CONFIG_MAIN}*; do \
		if [[ -d "$$item" ]]; then \
			echo "dir"; \
		else \
			echo "$$item"; \
		fi \
	done
endef

define main-mods
endef

define lite-configs
endef

define lite-mods
endef

define admin-configs
endef

define admin-mods
endef

.PHONY: help 

help:
	@printf "${DASEL}\n"

switch-main:
	@if [[ -z "${VERSION}" ]]; then \
		echo "Provide a version number" && exit 1; \
	fi
	$(main-configs)
	$(main-mods)
	@$(DASEL) put -t string -v "${VERSION}" -f pack.toml -w toml '.version' 

switch-lite:
	@if [[ -z "${VERSION}" ]]; then \
		echo "Provide a version number" && exit 1; \
	fi
	$(lite-configs)
	$(lite-mods)
	@$(DASEL) put -t string -v "${VERSION}l" -f pack.toml -w toml '.version' 

switch-admin:
	@if [[ -z "${VERSION}" ]]; then \
		echo "Provide a version number" && exit 1; \
	fi
	$(admin-configs)
	$(admin-mods)
	@$(DASEL) put -t string -v "${VERSION}a" -f pack.toml -w toml '.version' 

build-main: switch-main

build-lite: switch-lite

build-admin: switch-admin

build: build-main build-lite build-admin

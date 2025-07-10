DASEL := $(shell which dasel)
PACKWIZ := $(shell which packwiz)
MAKE := $(shell which make)
# SHELL := /bin/bash

PROFILE_MAIN := profiles/main/
PROFILE_LITE := profiles/lite/
PROFILE_ADMIN := profiles/admin/

define main-configs
	@cp ${PROFILE_MAIN}.packwizignore-main .packwizignore
	@for item in ${PROFILE_MAIN}config/*; do \
		if [[ ! -f "$$item" ]]; then \
			echo "No configs to copy"; \
		else \
			cp $$item config/$$(basename $${item/-main/}); \
		fi \
	done
	@for item in ${PROFILE_MAIN}kubejs/config/*; do \
		if [[ ! -f "$$item" ]]; then \
			echo "No configs to copy"; \
		else \
			cp $$item kubejs/config/$$(basename $${item/-main/}); \
		fi \
	done
endef

define main-mods
	@for item in ${PROFILE_MAIN}mods/*; do \
		if [[ ! -f "$$item" ]]; then \
			echo "No configs to copy"; \
		else \
			$(DASEL) put -t bool -v true -f mods/$$(basename $${item}) -r toml -s 'option.default'; \
		fi \
	done
endef

define lite-configs
	@for item in ${PROFILE_LITE}config/*; do \
		if [[ ! -f "$$item" ]]; then \
			echo "No configs to copy"; \
		else \
			cp $$item config/$$(basename $${item/-lite/}); \
		fi \
	done
	@for item in ${PROFILE_LITE}kubejs/config/*; do \
		if [[ ! -f "$$item" ]]; then \
			echo "No configs to copy"; \
		else \
			cp $$item kubejs/config/$$(basename $${item/-lite/}); \
		fi \
	done
endef

define lite-mods
	@for item in ${PROFILE_LITE}mods/*; do \
		if [[ ! -f "$$item" ]]; then \
			echo "No configs to copy"; \
		else \
			$(DASEL) put -t bool -v false -f mods/$$(basename $${item}) -r toml -s 'option.default'; \
		fi \
	done
endef

define admin-configs
	@cp ${PROFILE_ADMIN}.packwizignore-admin .packwizignore
	@for item in ${PROFILE_ADMIN}config/*; do \
		if [[ ! -f "$$item" ]]; then \
			echo "No configs to copy"; \
		else \
			cp $$item config/$$(basename $${item/-admin/}); \
		fi \
	done
	@for item in ${PROFILE_ADMIN}kubejs/config/*; do \
		if [[ ! -f "$$item" ]]; then \
			echo "No configs to copy"; \
		else \
			cp $$item kubejs/config/$$(basename $${item/-admin/}); \
		fi \
	done
endef

# define admin-mods
# 	@for item in ${PROFILE_ADMIN}mods/*; do \
# 		if [[ ! -f "$$item" ]]; then \
# 			echo "No configs to copy"; \
# 		else \
# 			$(DASEL) put -t bool -v true -f mods/$$(basename $${item}) -r toml -s 'option.default'; \
# 		fi \
# 	done
# endef

.PHONY: help 

help:
	@printf "${DASEL}\n"

build-dir:
	@if [[ ! -d "build" ]]; then \
		mkdir build; \
	fi

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
	$(main-mods)
	@$(DASEL) put -t string -v "${VERSION}a" -f pack.toml -w toml '.version' 

build-main: switch-main build-dir
	@$(PACKWIZ) mr export

build-lite: switch-lite build-dir
	@$(PACKWIZ) mr export

build-admin: switch-admin build-dir
	@$(PACKWIZ) mr export

build: build-main build-lite build-admin
	@$(MAKE) switch-main

clean:
	@rm -rf build/

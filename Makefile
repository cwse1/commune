DASEL := $(shell which dasel)
PACKWIZ := $(shell which packwiz)
MAKE := $(shell which make)

define switch-configs
	@cp profiles/$(1)/.packwizignore-$(1) .packwizignore
	@for item in profiles/$(1)/config/*; do \
		if [[ ! -f "$$item" ]]; then \
			echo "No configs to copy"; \
		else \
			cp $$item config/$$(basename $${item/-$(1)/}); \
		fi \
	done
	@for item in profiles/$(1)/kubejs/config/*; do \
		if [[ ! -f "$$item" ]]; then \
			echo "No configs to copy"; \
		else \
			cp $$item kubejs/config/$$(basename $${item/-$(1)/}); \
		fi \
	done
endef

define switch-profile
	@if [[ -z "${VERSION}" ]]; then \
		echo "Provide a version number" && exit 1; \
	fi
	$(call switch-configs,$(1))
	@if [[ ! $(1) == m* ]]; then \
		$(DASEL) put -t string -v "${VERSION}$(shell echo $(1) | head -c 1)" -f pack.toml -w toml '.version'; \
	else \
		$(DASEL) put -t string -v "${VERSION}" -f pack.toml -w toml '.version'; \
	fi
endef

# .PHONY: help 

# help:
# 	@printf "${DASEL}\n"

__build-dir:
	@if [[ ! -d "build" ]]; then \
		mkdir build; \
	fi

__switch-main:
	$(call switch-profile,main)
	@$(PACKWIZ) refresh

__switch-lite:
	$(call switch-profile,lite)
	@$(PACKWIZ) refresh

__switch-admin:
	$(call switch-profile,admin)
	@$(PACKWIZ) refresh

__build-main: __switch-main __build-dir
	@$(PACKWIZ) mr export

__build-lite: __switch-lite __build-dir
	@$(PACKWIZ) mr export

__build-admin: __switch-admin __build-dir
	@$(PACKWIZ) mr export

build: clean __build-main __build-lite __build-admin
	@$(MAKE) __switch-main

clean:
	@rm -rf build/

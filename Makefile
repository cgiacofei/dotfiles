DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES := $(wildcard .??*)
EXCLUSIONS := .git .gitignore .gitmodules
DOTFILES := $(filter-out $(EXCLUSIONS), $(CANDIDATES))
SCRIPTS := $(wildcard bin/??*) scripts/ghi/ghi scripts/gitwatch/gitwatch.sh
BINFILES := $(addprefix bin/,$(notdir $(SCRIPTS)))

.DEFAULT_GOAL := help

deploy: ## Create symlink to home directory
	@echo '==> Start to deploy dotfiles to home directory.'
	@echo ''
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
	@mkdir -p $(HOME)/bin
	@$(foreach val, $(SCRIPTS), ln -sfnv $(abspath $(val)) $(HOME)/bin/$(notdir $(val));)

update: ## Fetch changes for this repo
	git pull origin master
	git submodule init
	git submodule update --recursive

install: update deploy ## Run make update, deploy, init

clean: ## Remove the dot files and this repo
	@echo 'Remove dot files in your home directory...'
	@-$(foreach val, $(DOTFILES), rm -vrf $(HOME)/$(val);)
	-rm -rf $(DOTPATH)

list: ## Show dot files in this repo
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)
	@$(foreach val, $(SCRIPTS), /bin/ls -dF $(val);)

help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

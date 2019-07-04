default: build ## build

help: ## Prints help for targets with comments.
	@grep -E '^[a-zA-Z._-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

build: ## Runs `hugo`.
	@hugo

clean: ## Remove build directory.
	@if [ -d public ]; then rm -rf public; fi && mkdir public

sync: ## Push built site to the server.
	@rsync -a -e ssh --delete --omit-dir-times --no-perms --progress public/ waitstaff_deploy:/usr/local/www/patricialhorvath.com

web: clean build sync ## Build and sync to the server.

serve: ## Start development server in the background.
	@hugo serve --buildDrafts > hugo.log 2>&1 &

stop: ## Kill background hugo process.
	@pgrep hugo | xargs kill

restart: stop serve ## Restart the hugo server.

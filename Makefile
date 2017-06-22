build:
	@./scripts/build

serve:
	@hugo serve --buildDrafts > hugo.log 2>&1 &

stop:
	@pgrep hugo | xargs kill

deploy:
	@./deploy.sh

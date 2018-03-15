build:
	@hugo

web:
	@git push origin master && git push deploy master

serve:
	@hugo serve --buildDrafts > hugo.log 2>&1 &

stop:
	@pgrep hugo | xargs kill

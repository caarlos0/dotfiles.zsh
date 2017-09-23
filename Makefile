fmt:
	@shfmt --version
	@find . -maxdepth 3 -name '*.sh' | while read -r src; do shfmt -w -p "$$src"; done
	@find . -maxdepth 3 -name '*.zsh' | while read -r src; do shfmt -w "$$src"; done;

check:
	@curl -sL https://git.io/shcheck | bash -f -s -- \
		--ignore 'script/test' \
		--ignore 'vim/vim.symlink/**/*' \
		--ignore 'zsh/config.zsh' \
		--ignore 'zsh/completion.zsh' \
		--ignore 'zsh/prompt.zsh' \
		--ignore 'zsh/fpath.zsh' \
		--ignore 'atom.symlink/packages/**/*' \
		--ignore 'vim/vim.symlink/bundle/**/*' \
		--ignore 'docker/completion.zsh'

ci: check
	./script/test

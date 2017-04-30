.PHONY: all

. := $(HOME)/.dotfiles

all: zsh-precheck editorconfig git neovim tmux vim zsh
editorconfig:
	ln -sf $(.)/.editorconfig $(HOME)
git:
	ln -sf $(.)/.gitconfig $(.)/.gitignore $(.)/.tigrc $(HOME)
neovim:
	mkdir -p $(HOME)/.config/nvim
	ln -sf $(.)/.vimrc $(HOME)/.config/nvim/init.vim
	ln -sf $(.)/dein.toml $(.)/dein_lazy.toml $(HOME)/.config/nvim/
shell:
	ln -sf $(.)/.profile $(.)/.profile.alias $(.)/.profile.post $(HOME)
tmux:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	ln -sf $(.)/.tmux.conf $(HOME)
vim:
	ln -sf $(.)/.vimrc $(.)/dein.toml $(.)/dein_lazy.toml $(HOME)
zsh: zsh-precheck zprezto zplug shell
zsh-precheck:
	if ! type awk > /dev/null 2>&1 ; then \
    echo 'awk is required.' ; \
    exit 0 ; \
  fi && \
	if ! type git > /dev/null 2>&1 ; then \
    echo 'git is required.' ; \
    exit 0 ; \
  fi && \
	if ! type zsh > /dev/null 2>&1 ; then \
    echo 'zsh is required.' ; \
    exit 0 ; \
  fi
zplug:
	rm -rf $(HOME)/.zplug
	git clone https://github.com/zplug/zplug $(HOME)/.zplug
zprezto:
	rm -rf $(HOME)/.zprezto
	git clone --recursive https://github.com/sorin-ionescu/prezto.git $(HOME)/.zprezto
	ln -sf $(.)/.profile $(HOME)/.zprofile
	ln -sf $(.)/.zprezto/zlogin $(HOME)/.zlogin
	ln -sf $(.)/.zprezto/zlogout $(HOME)/.zlogout
	ln -sf $(.)/.zshrc $(.)/.zpreztorc $(HOME)


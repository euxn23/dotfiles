.PHONY: all

. := $(PWD)
XDG_CONFIG_HOME ?= $(HOME)/.config

all: dotfiles editorconfig git ideavim neovim tmux vim zsh
asdf:
	git -C $(HOME)/.asdf pull 2>/dev/null || git clone https://github.com/asdf-vm/asdf $(HOME)/.asdf
	/bin/sh bin/asdf-install.sh
	/bin/sh bin/cargo-install.sh
alacritty-unix:
	mkdir -p $(XDG_CONFIG_HOME)/alacritty
	ln -sf $(.)/alacritty.yml $(XDG_CONFIG_HOME)/alacritty/alacritty.yml
alacritty-wsl:
	$(eval CONFIG_DIR = /mnt/c/Users/$(shell powershell.exe '($$env:UserName)')/AppData/Roaming/alacritty)
	mkdir -p $(CONFIG_DIR)
	/bin/cp -f $(.)/alacritty.yml $(CONFIG_DIR)/alacritty.yml
dotfiles:
	[ -e $(HOME)/.dotfiles ] || ln -sf $(.) $(HOME)/.dotfiles
editorconfig:
	ln -sf $(.)/.editorconfig $(HOME)
git:
	ln -sf $(.)/.gitconfig $(.)/.gitignore $(.)/.tigrc $(HOME)
ideavim:
	ln -sf $(.)/.vimrc $(HOME)/.ideavimrc
neovim:
	mkdir -p $(XDG_CONFIG_HOME)/nvim
	ln -sf $(.)/.vimrc $(XDG_CONFIG_HOME)/nvim/init.vim
	ln -sf $(.)/dein.toml $(.)/dein_lazy.toml $(XDG_CONFIG_HOME)/nvim/
shell:
	ln -sf $(.)/.profile $(.)/.bashrc $(.)/.bashrc.extra $(.)/.bashrc.alias $(.)/.bashrc.post $(HOME)
	git -C $(HOME)/.skim pull 2>/dev/null || git clone --depth 1 git@github.com:lotabout/skim.git $(HOME)/.skim
tmux:
	git -C $(HOME)/.tmux/plugins/tpm pull 2>/dev/null || git clone https://github.com/tmux-plugins/tpm $(HOME)/.tmux/plugins/tpm
	ln -sf $(.)/.tmux.conf $(HOME)
vim:
	ln -sf $(.)/.vimrc $(.)/dein.toml $(.)/dein_lazy.toml $(HOME)
zsh: shell
	/bin/sh bin/zsh-precheck.sh 1>/dev/null
	git -C $(HOME)/.zprezto pull 2>/dev/null || git clone --recursive https://github.com/sorin-ionescu/prezto.git $(HOME)/.zprezto
	ln -sf $(.)/.profile $(HOME)/.zprofile
	ln -sf $(.)/.zprezto/zlogin $(HOME)/.zlogin
	ln -sf $(.)/.zprezto/zlogout $(HOME)/.zlogout
	ln -sf $(.)/.zshrc $(.)/.zpreztorc $(HOME)
	ln -sf $(.)/starship.toml $(XDG_CONFIG_HOME)/starship.toml

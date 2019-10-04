.PHONY: all

. := $(PWD)
XDG_CONFIG_HOME := $(XDG_CONFIG_HOME)

all: zsh-precheck alacritty dotfiles editorconfig git ideavim karabiner neovim tmux vim zsh
alacritty:
	/bin/sh bin/xdg-config-home.sh
	mkdir $(XDG_CONFIG_HOME)/alacritty
	ln -sf $(.)/alacritty.yml $(XDG_CONFIG_HOME)/alacritty/alacritty.yml
dotfiles:
	[ -e $(HOME)/.dotfiles ] || ln -sf $(.) $(HOME)/.dotfiles
editorconfig:
	ln -sf $(.)/.editorconfig $(HOME)
git:
	ln -sf $(.)/.gitconfig $(.)/.gitignore $(.)/.tigrc $(HOME)
ideavim:
	ln -sf $(.)/.vimrc $(HOME)/.ideavimrc
karabiner:
	/bin/sh bin/xdg-config-home.sh
	ln -sf $(.)/karabiner $(XDG_CONFIG_HOME)/karabiner
neovim:
	/bin/sh bin/xdg-config-home.sh
	mkdir -p $(XDG_CONFIG_HOME)/nvim
	ln -sf $(.)/.vimrc $(XDG_CONFIG_HOME)/nvim/init.vim
	ln -sf $(.)/dein.toml $(.)/dein_lazy.toml $(XDG_CONFIG_HOME)/nvim/
shell:
	ln -sf $(.)/.profile $(.)/.bashrc $(.)/.bashrc.extra $(.)/.bashrc.alias $(.)/.bashrc.post $(HOME)
tmux:
	git -C $(HOME)/.tmux/plugins/tpm pull || git clone https://github.com/tmux-plugins/tpm $(HOME)/.tmux/plugins/tpm
	ln -sf $(.)/.tmux.conf $(HOME)
vim:
	ln -sf $(.)/.vimrc $(.)/dein.toml $(.)/dein_lazy.toml $(HOME)
zsh: zsh-precheck zprezto zplug shell
zsh-precheck:
	/bin/sh bin/zsh-precheck.sh 1>/dev/null
zplug:
	git -C $(HOME)/.zplug pull || git clone https://github.com/zplug/zplug $(HOME)/.zplug
zprezto:
	git -C $(HOME)/.zprezto pull || git clone --recursive https://github.com/sorin-ionescu/prezto.git $(HOME)/.zprezto
	ln -sf $(.)/.profile $(HOME)/.zprofile
	ln -sf $(.)/.zprezto/zlogin $(HOME)/.zlogin
	ln -sf $(.)/.zprezto/zlogout $(HOME)/.zlogout
	ln -sf $(.)/.zshrc $(.)/.zpreztorc $(HOME)
go-tools:
	/bin/sh bin/install-go-tools.sh
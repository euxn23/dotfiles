. := $(PWD)
XDG_CONFIG_HOME ?= $(HOME)/.config
SHELL=/bin/zsh

.PHONY: lang
lang: node python rust cargo

.PHONY: asdf
asdf: ~/.asdf
~/.asdf:
	git clone https://github.com/asdf-vm/asdf $(HOME)/.asdf

.PHONY: node
node: ~/.asdf
	asdf plugin add nodejs
	asdf install nodejs latest
	asdf global nodejs `asdf latest nodejs`

.PHONY: python
python: ~/.asdf
	asdf plugin add python
	asdf install python latest
	pip3 install pipx
	pipx install pynvim

.PHONY: rust
rust: ~/.asdf
	asdf plugin-add rust
	asdf install rust latest
	asdf global rust `asdf latest rust`

.PHONY: cargo
cargo:
	cargo install starship
	cargo install skim
	cargo install exa
	cargo install ripgrep

.PHONY: dotfiles
dotfiles: ~/.dotfiles
~/.dotfiles:
	[ -e $(HOME)/.dotfiles ] || ln -sf $(.) $(HOME)/.dotfiles

.PHONY: wezterm
wezterm:
	mkdir -p $(XDG_CONFIG_HOME)/wezterm
	ln -sf $(.)/wezterm.lua $(XDG_CONFIG_HOME)/wezterm/wezterm.lua

editorconfig:
	ln -sf $(.)/.editorconfig $(HOME)

.PHONY: git
git:
	ln -sf $(.)/git $(XDG_CONFIG_HOME)

.PHONY: ideavim
ideavim:
	ln -sf $(.)/.ideavimrc $(HOME)/.ideavimrc

.PHONY: neovim
neovim:
	ln -sf $(.)/nvim $(XDG_CONFIG_HOME)

tmux:
	git -C $(HOME)/.tmux/plugins/tpm pull 2>/dev/null || git clone https://github.com/tmux-plugins/tpm $(HOME)/.tmux/plugins/tpm
	ln -sf $(.)/.tmux.conf $(HOME)

bash:
	ln -sf $(.)/.profile $(.)/.bashrc $(.)/.bashrc.extra $(.)/.bashrc.alias $(.)/.bashrc.post $(HOME)

zsh: bash
	git -C $(HOME)/.zprezto pull 2>/dev/null || git clone --recursive https://github.com/sorin-ionescu/prezto.git $(HOME)/.zprezto
	ln -sf $(.)/.profile $(HOME)/.zprofile
	ln -sf $(.)/.zprezto/zlogin $(HOME)/.zlogin
	ln -sf $(.)/.zprezto/zlogout $(HOME)/.zlogout
	ln -sf $(.)/.zshrc $(.)/.zpreztorc $(HOME)
	ln -sf $(.)/starship.toml $(XDG_CONFIG_HOME)/starship.toml

.PHONY: windows
windows:
	make -f Makefile.windows

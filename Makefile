. := $(PWD)
XDG_CONFIG_HOME ?= $(HOME)/.config
SHELL=/bin/zsh

.PHONY: default
default: cargo dotfiles editorconfig git ideavim neovim wezterm zsh

.PHONY: cargo
cargo:
	mise use -g cargo:starship
	mise use -g cargo:skim

.PHONY: dotfiles
dotfiles: ~/.dotfiles
~/.dotfiles:
	[ -e $(HOME)/.dotfiles ] || ln -sf $(.) $(HOME)/.dotfiles

.PHONY: wezterm
wezterm:
	mkdir -p $(XDG_CONFIG_HOME)/wezterm
	ln -sf $(.)/wezterm.lua $(XDG_CONFIG_HOME)/wezterm/wezterm.lua

.PHONY: editorconfig
editorconfig:
	ln -sf $(.)/.editorconfig $(HOME)

.PHONY: git
git:
	ln -sf $(.)/git $(XDG_CONFIG_HOME)

.PHONY: ideavim
ideavim:
	ln -sf $(.)/.ideavimrc $(HOME)/.ideavimrc

.PHONY: mise
mise:
	ln -sf $(.)/mise $(XDG_CONFIG_HOME)

.PHONY: neovim
neovim:
	ln -sf $(.)/nvim $(XDG_CONFIG_HOME)

.PHONY: bash
bash:
	ln -sf $(.)/.profile $(.)/.bashrc $(HOME)

.PHONY: zsh
zsh:
	git -C $(HOME)/.zsh/zsh-autosuggestions pull 2>/dev/null || git clone https://github.com/zsh-users/zsh-autosuggestions.git $(HOME)/.zsh/zsh-autosuggestions
	git -C $(HOME)/.zsh/zsh-completions pull 2>/dev/null || git clone https://github.com/zsh-users/zsh-completions.git $(HOME)/.zsh/zsh-completions
	git -C $(HOME)/.zsh/zsh-syntax-highlighting pull 2>/dev/null || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $(HOME)/.zsh/zsh-syntax-highlighting
	git -C $(HOME)/.zsh/zsh-history-substring-search pull 2>/dev/null || git clone https://github.com/zsh-users/zsh-history-substring-search.git $(HOME)/.zsh/zsh-history-substring-search
	git -C $(HOME)/.zsh/skim pull 2>/dev/null || git clone https://github.com/lotabout/skim.git $(HOME)/.zsh/skim
	ln -sf $(.)/.profile $(HOME)/.zprofile
	ln -sf $(.)/.zprezto/zlogin $(HOME)/.zlogin
	ln -sf $(.)/.zprezto/zlogout $(HOME)/.zlogout
	ln -sf $(.)/.zshrc $(.)/.zshrc.extra $(.)/.zshrc.alias $(.)/.zshrc.env $(.)/.zpreztorc $(HOME)
	ln -sf $(.)/starship.toml $(XDG_CONFIG_HOME)/starship.toml

.PHONY: windows
windows:
	make -f Makefile.windows

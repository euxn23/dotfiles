autoload -Uz compinit

# history
HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=100000

setopt extended_history
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_verify
setopt hist_reduce_blanks
setopt hist_no_store
setopt inc_append_history

# fs
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_silent
setopt pushd_to_home
setopt cdable_vars
setopt multios
setopt extended_glob
setopt glob_dots
setopt auto_param_slash
setopt no_nomatch
setopt no_beep
setopt rm_star_wait

# env
export LSCOLORS=ExfxcxdxbxGxDxabagacad
export TERM='xterm-256color'
export GREP_OPTIONS='--color=auto'

# Activate zsh pluins
if [[ -s $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=black,bg=blue'
  source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
if [[ -s $HOME/.zsh/zsh-completions/src ]]; then
  fpath+=$HOME/.zsh/zsh-completions/src
  zstyle ':completion:*' list-colors ${LSCOLORS}
  zstyle ':completion:*:default' menu select=2
  zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
fi
if [[ -s $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
if [[ -s $HOME/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh ]]; then
  source $HOME/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
fi

# Activate mise
if type mise &>/dev/null; then
  eval "$(mise activate zsh)"
  PATH=$HOME/.local/share/mise/shims:$PATH
fi

# Activate rust
PATH=$HOME/.cargo/bin:$PATH

# Activate orbstack
if [[ -s ~/.orbstack/shell/init.zsh ]]; then
  source ~/.orbstack/shell/init.zsh
fi

# Activate starship
if which starship &>/dev/null; then
  eval "$(starship init zsh)"
fi

# Activate skim
if type sk &>/dev/null; then
  source $HOME/.zsh/skim/shell/completion.zsh
  source $HOME/.zsh/skim/shell/key-bindings.zsh

  export SKIM_DEFAULT_OPTIONS="--color=bg+:12 --exit-0 --inline-info --multi --reverse --select-1 --exact"

  function skim-history() {
    BUFFER=$(history -n 1 | sk --tac --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
  }

  zle -N skim-history
  bindkey '^r' skim-history
fi

compinit -u
bindkey -e

if [[ -s $HOME/.zshrc.alias ]]; then
  source $HOME/.zshrc.alias
fi
if [[ -s $HOME/.zshrc.env ]]; then
  source $HOME/.zshrc.env
fi

typeset -Ug PATH

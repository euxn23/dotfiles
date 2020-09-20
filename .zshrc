autoload -Uz compinit

HISTFILE=~/.zhistory
HISTSIZE=1000000
SAVEHIST=1000000

# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export LSCOLORS=ExfxcxdxbxGxDxabagacad
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=black,bg=blue'
zstyle ':completion:*' list-colors ${LSCOLORS}
zstyle ':completion:*:default' menu select=2

setopt inc_append_history
setopt share_history
setopt hist_ignore_all_dups

export TERM='xterm-256color'

# load skim completion
source $HOME/skim/shell/completion.zsh &>/dev/null
source $HOME/skim/shell/key-binding.zsh &>/dev/null

function skim-history() {
    BUFFER=$(history -n 1 | sk --tac --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}

function skim-ghq() {
  local selected_dir=$(ghq list -p | sk --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}

zle -N skim-history
bindkey '^r' skim-history
zle -N skim-ghq
bindkey '^]' skim-ghq

eval "$(starship init zsh)"

source $HOME/.bashrc.extra &>/dev/null


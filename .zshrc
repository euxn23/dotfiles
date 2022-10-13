autoload -Uz compinit

HISTFILE=~/.zhistory
HISTSIZE=1000000
SAVEHIST=1000000

# Activate utilities from prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Activate UI
eval "$(starship init zsh)"

export LSCOLORS=ExfxcxdxbxGxDxabagacad
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=black,bg=blue'
zstyle ':completion:*' list-colors ${LSCOLORS}
zstyle ':completion:*:default' menu select=2

setopt inc_append_history
setopt share_history
setopt hist_ignore_all_dups

export TERM=xterm-256color

source $HOME/skim/shell/completion.zsh &>/dev/null
source $HOME/skim/shell/key-binding.zsh &>/dev/null

function skim-history() {
    BUFFER=$(history -n 1 | sk --tac --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}

zle -N skim-history
bindkey '^r' skim-history

source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"

source $HOME/.bashrc.extra &>/dev/null


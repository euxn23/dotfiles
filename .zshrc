autoload -Uz compinit
export SHELL=/bin/zsh

# zplug
source $HOME/.zplug/init.zsh

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"

zplug "sorin-ionescu/prezto"

zplug "mollifier/cd-gitroot"
zplug "stedolan/jq", \
  from:gh-r, \
  as:command, \
  rename-to:jq
zplug "b4b4r07/emoji-cli", \
  on:"stedolan/jq"

zplug load


HISTFILE=~/.zhistory
HISTSIZE=1000000
SAVEHIST=1000000

export PYENV_VIRTUALENV_DISABLE_PROMPT=2

export LSCOLORS=ExfxcxdxbxGxDxabagacad
zstyle ':completion:*' list-colors ${LSCOLORS}
zstyle ':completion:*:default' menu select=2

setopt share_history
setopt hist_ignore_all_dups

export TERM='screen-256color'

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

function peco-select-historyfn() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}

zle -N peco-select-historyfn
bindkey '^r' peco-select-historyfn

function repofn () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N repofn
bindkey '^]' repofn
alias repo='cd $(ghq list -p | peco)'

if [[ -e "$HOME/.profile.post" ]]; then
  source $HOME/.profile.post
fi


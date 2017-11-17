autoload -Uz compinit
export SHELL="$(which zsh)"

# zplug
source $HOME/.zplug/init.zsh

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"

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

# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Source fzf
if type fzf &>/dev/null; then
  source $HOME/src/github.com/junegunn/fzf/shell/completion.zsh
  source $HOME/src/github.com/junegunn/fzf/shell/key-bindings.zsh

  function fzf-select-historyfn() {
      BUFFER=$(history -n 1 | fzf --tac --query "$LBUFFER")
      CURSOR=$#BUFFER
      zle clear-screen
  }

  zle -N fzf-select-historyfn
  bindkey '^r' fzf-select-historyfn

  function repofd () {
    local selected_dir=$(ghq list -p | fzf --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
      BUFFER="cd ${selected_dir}"
      zle accept-line
    fi
    zle clear-screen
  }
  zle -N repofd
  bindkey '^]' repofd
  alias repo='cd $(ghq list -p | fzf)'
fi

source $HOME/.bashrc.extra &>/dev/null

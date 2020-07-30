autoload -Uz compinit

HISTFILE=~/.zhistory
HISTSIZE=1000000
SAVEHIST=1000000

# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export LSCOLORS=ExfxcxdxbxGxDxabagacad
zstyle ':completion:*' list-colors ${LSCOLORS}
zstyle ':completion:*:default' menu select=2

# export PROMPT=$'%F{0}%K{12}$(node -v){}\uE0B0%k%f${(r:($COLUMNS-${#$(node -v)}-${#${_prompt_sorin_git}}):: :)}${_prompt_sorin_git}\n${SSH_TTY:+"%F{9}%n%f%F{7}@%f%F{3}%m%f "}%F{12}${_prompt_sorin_pwd}%(!. %B%F{1}#%f%b.)${editor_info[keymap]} '
# unset RPROMPT

setopt inc_append_history
setopt share_history
setopt hist_ignore_all_dups

export TERM='xterm-256color'

# Source fzf
if (type fzf &>/dev/null) && (type ghq &>/dev/null); then
  source $HOME/src/github.com/junegunn/fzf/shell/completion.zsh &>/dev/null
  source $HOME/src/github.com/junegunn/fzf/shell/key-bindings.zsh &>/dev/null

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


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yuta.suzuki/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/yuta.suzuki/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/yuta.suzuki/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/yuta.suzuki/google-cloud-sdk/completion.zsh.inc'; fi

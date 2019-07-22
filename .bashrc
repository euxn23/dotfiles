# Source fzf
if type fzf &>/dev/null; then
  source $HOME/src/github.com/junegunn/fzf/shell/completion.bash &>/dev/null
  source $HOME/src/github.com/junegunn/fzf/shell/key-bindings.zsh
fi

source .bashrc.extra &>/dev/null

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Source fzf
if type fzf &>/dev/null; then
  source $HOME/src/github.com/junegunn/fzf/shell/completion.bash &>/dev/null
  source $HOME/src/github.com/junegunn/fzf/shell/key-binding.bash &>/dev/null
fi

source .bashrc.extra &>/dev/null

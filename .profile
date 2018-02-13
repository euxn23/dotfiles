export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight
export PATH=$PATH:$HOME/src/github.com/junegunn/fzf/bin
export GHQ=$HOME/src
export FZF_DEFAULT_OPTS="--color=bg+:12 --exit-0 --inline-info --multi --reverse --select-1"

if [[ -e "$HOME/.nvm" ]]; then
  export NVM_DIR=~/.nvm
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use
fi

if [[ -e "$HOME/.pyenv" ]]; then
  export PYENV_ROOT=~/.pyenv
  export PATH=$PYENV_ROOT/bin:$PATH
  export PATH="$PYENV_ROOT/versions/$(cat "$PYENV_ROOT/version" | head -n 1)/bin":$PATH
fi

if [[ -e "$HOME/.rbenv" ]]; then
  export RBENV_ROOT=~/.rbenv
  export PATH=$RBENV_ROOT/bin:$PATH
  eval "$(rbenv init - --no-rehash)"
fi

if [[ -e "$HOME/.phpenv" ]]; then
  export PHPENV_ROOT=~/.phpenv
  export PATH=$PHPENV_ROOT/bin:$PATH
  eval "$(phpenv init - --no-rehash)"
fi

if [[ -e "$HOME/.gvm" ]]; then
  source ~/.gvm/scripts/gvm
  export GOPATH=$HOME
  export PATH=$PATH:$HOME/bin
fi


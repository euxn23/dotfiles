export PATH=/usr/local/share/git-core/contrib/diff-highlight:$PATH
export PATH=$HOME/src/github.com/junegunn/fzf/bin:$PATH
export GHQ=$HOME/src
export FZF_DEFAULT_OPTS="--color=bg+:12 --exit-0 --inline-info --multi --reverse --select-1"

# if [[ -e "$HOME/.nvm" ]]; then
  # export NVM_DIR=~/.nvm
  # [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use
  # export PATH=$NVM_DIR/versions/node/$(cat $NVM_DIR/alias/default)/bin:$PATH
# fi

if [[ -e "$HOME/.volta" ]]; then
  export VOLTA_HOME="$HOME/.volta"
  [ -s "$VOLTA_HOME/load.sh" ] && . "$VOLTA_HOME/load.sh"
  export PATH="$VOLTA_HOME/bin:$PATH"
fi

if [[ -e "$HOME/.pyenv" ]]; then
  export PYENV_ROOT=~/.pyenv
  export PATH=$PYENV_ROOT/bin:$PATH
  export PATH="$PYENV_ROOT/versions/$(cat "$PYENV_ROOT/version" | head -n 1)/bin":$PATH
fi

if [[ -e "$HOME/.rbenv" ]]; then
  export RBENV_ROOT=~/.rbenv
  export PATH=$RBENV_ROOT/bin:$PATH
  export PATH="$RBENV_ROOT/versions/$(cat $RBENV_ROOT/version)/bin":$PATH
  # eval "$(rbenv init - --no-rehash)"
fi

if [[ -e "$HOME/.phpenv" ]]; then
  export PHPENV_ROOT=~/.phpenv
  export PATH=$PHPENV_ROOT/bin:$PATH
  eval "$(phpenv init - --no-rehash)"
fi

if [[ -e "$HOME/.gvm" ]]; then
  source ~/.gvm/scripts/gvm
  export GOPATH=$HOME
  export PATH=$HOME/bin:$PATH
fi


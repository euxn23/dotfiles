export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight

if [[ -e "$HOME/.nvm" ]]; then
  NODE_VERSION=`cat $HOME/.nvm/alias/default`
  export PATH=$PATH:$HOME/.nvm/versions/node/$NODE_VERSION/bin:./node_modules/.bin
  nvm() {
    unset -f nvm
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
    nvm "$@"
  }
fi

if [[ -e "$HOME/.pyenv" ]]; then
  export PYENV_ROOT=~/.pyenv
  export PATH=$PYENV_ROOT/bin:$PATH
  export PATH=`echo -n "$(pyenv root)/versions/$(pyenv global | grep python2)/bin"`:$PATH
  export PATH=`echo -n "$(pyenv root)/versions/$(pyenv global | grep python3)/bin"`:$PATH
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
  export GHQ=$HOME/src
fi

if [[ -e "$HOME/.profile.alias" ]]; then
  source $HOME/.profile.alias
fi
if [[ -e "$HOME/.profile.env" ]]; then
  source $HOME/.profile.env
fi


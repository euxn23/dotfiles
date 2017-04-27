export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight

NODE_VERSION=`cat $HOME/.nvm/alias/default`
export PATH=$PATH:$HOME/.nvm/versions/node/$NODE_VERSION/bin:./node_modules/.bin
nvm() {
    unset -f nvm
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
    nvm "$@"
}

export PYENV_ROOT=~/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init - --no-rehash)"

export RBENV_ROOT=~/.rbenv
export PATH=$RBENV_ROOT/bin:$PATH
eval "$(rbenv init - --no-rehash)"
export RUBYGEMS_GEMDEPS=-

source ~/.gvm/scripts/gvm
export GOPATH=$HOME
export PATH=$PATH:$HOME/bin
export GHQ=$HOME/src

if [[ -e "$HOME/.profile.alias" ]]; then
  source $HOME/.profile.alias
fi
if [[ -e "$HOME/.profile.env" ]]; then
  source $HOME/.profile.env
fi


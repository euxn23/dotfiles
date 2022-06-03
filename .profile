export PATH=$HOME/bin:/opt/homebrew/bin:$PATH
export XDG_CONFIG_HOME=$HOME/.config
export SKIM_DEFAULT_OPTIONS="--color=bg+:12 --exit-0 --inline-info --multi --reverse --select-1"

if uname | grep -i 'darwin' &>/dev/null ; then
  export COPY='pbcopy'
  export PASTE='pbpaste'
elif uname -r | grep -i 'microsoft' &>/dev/null ; then
  export COPY='win32yank.exe -i'
  export PASTE='win32yank.exe -o'
else
  export COPY='xsel -bi'
  export PASTE='xsel -bo'
fi

. $HOME/.asdf/asdf.sh
export VOLTA_HOME=$HOME/.volta
export PATH=$PATH:$VOLTA_HOME/bin


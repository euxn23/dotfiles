export PATH=$HOME/bin:$PATH
export XDG_CONFIG_HOME=$HOME/.config

export COPY=`uname | grep -i 'darwin' &>/dev/null && echo -n 'pbcopy' || echo -n 'xsel -bi'`
export PASTE=`uname | grep -i 'darwin' &>/dev/null && echo -n 'pbpaste' || echo -n 'xsel -bo'`
export SKIM_DEFAULT_OPTIONS="--color=bg+:12 --exit-0 --inline-info --multi --reverse --select-1"

. $HOME/.asdf/asdf.sh

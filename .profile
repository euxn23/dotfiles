export PATH=$HOME/bin:$PATH
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache

if uname | grep -i 'darwin' &>/dev/null ; then
  export PATH=$HOME/bin:/opt/homebrew/bin:$PATH
  export PATH=/opt/homebrew/opt/openjdk@11/bin:$PATH
  export PATH=/Applications/WebStorm.app/Contents/MacOS:$PATH
  export COPY='pbcopy'
  export PASTE='pbpaste'
elif uname -r | grep -i 'microsoft' &>/dev/null ; then
  export COPY='win32yank.exe -i'
  export PASTE='win32yank.exe -o'
else
  export COPY='xsel -bi'
  export PASTE='xsel -bo'
fi

export SKIM_DEFAULT_OPTIONS="--color=bg+:12 --exit-0 --inline-info --multi --reverse --select-1"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

PATH=$HOME/bin:$PATH
PATH=$HOME/.local/bin:$PATH
XDG_CONFIG_HOME=$HOME/.config
XDG_CACHE_HOME=$HOME/.cache

if uname | grep -i 'darwin' &>/dev/null ; then
  PATH=$HOME/bin:/opt/homebrew/bin:$PATH
  PATH=/opt/homebrew/opt/openjdk@11/bin:$PATH
  export ANDROID_HOME=$HOME/Library/Android/sdk
  PATH=$PATH:$ANDROID_HOME/emulator
  PATH=$PATH:$ANDROID_HOME/platform-tools
elif uname -r | grep -i 'microsoft' &>/dev/null ; then
else
fi

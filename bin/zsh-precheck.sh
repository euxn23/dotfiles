if ! type awk &>/dev/null ; then
  echo 'awk is required.' ;
  exit 0 ;
fi
if ! type git &>/dev/null ; then
  echo 'git is required.' ;
  exit 0 ;
fi
if ! type zsh &>/dev/null ; then
  echo 'zsh is required.' ;
  exit 0 ;
fi
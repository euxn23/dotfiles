. $HOME/.asdf/asdf.sh
asdf plugin add nodejs
bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
asdf install nodejs latest
asdf global nodejs `asdf latest nodejs`
asdf plugin add python
asdf install python latest
asdf install python 2.7.18
asdf global python `asdf latest python` 2.7.18
asdf plugin-add rust
asdf install rust latest
asdf global rust `asdf latest rust`


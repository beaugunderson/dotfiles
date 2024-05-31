#!/bin/sh

topgrade \
  --disable git_repos \
  --disable pnpm \
  --disable vim

# remove old brew files
shell_is_osx && brew cleanup

# upgrade vim plugins
nvim +PlugUpgrade +qa
nvim +PlugUpdate +qa

# upgrade global python modules
pip3 install --upgrade neovim
pip3 install --upgrade virtualenvwrapper

gem install homesick
gem install neovim
gem install tmuxinator

. /opt/homebrew/bin/virtualenvwrapper.sh

allvirtualenv pip install --upgrade pip neovim setuptools pyls

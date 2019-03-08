#!/bin/sh

# update all installed brew apps
shell_is_osx && brew update

# upgrade installed formulae
shell_is_osx && brew upgrade

# upgrade neovim
shell_is_osx && brew uninstall neovim
shell_is_osx && brew install --HEAD neovim

# upgrade casks
shell_is_osx && upgrade-casks.sh

# remove old brew files
shell_is_osx && brew cleanup

# upgrade vim plugins
/usr/local/bin/nvim +PlugUpgrade +qa
/usr/local/bin/nvim +PlugUpdate +qa

# upgrade App Store apps (requires `brew install mas` first)
shell_is_osx && mas upgrade

# reset permissions on global node_modules
shell_is_osx && sudo chown -R beau:admin /usr/local/lib/node_modules

# upgrade npm
npm install -g npm

# upgrade npm global modules
npm install -g ava
npm install -g babel-cli
npm install -g babel-eslint
npm install -g browserify
npm install -g budo
npm install -g collaborator
npm install -g credits-cli
npm install -g dockerlint
npm install -g electron
npm install -g eslint
npm install -g eslint_d
npm install -g flow-bin
npm install -g gulp
npm install -g json
npm install -g jsonlint
npm install -g jsonmap
npm install -g markdownlint
npm install -g mocha
npm install -g node-gyp
npm install -g node-gyp-install
npm install -g npm-check-updates
npm install -g npmbrew
npm install -g pmm
npm install -g prettier
npm install -g standard
npm install -g supervisor
npm install -g stylelint
npm install -g ttystudio
npm install -g vsce

# upgrade global python modules
sudo -H pip3 install --upgrade neovim
sudo -H pip3 install --upgrade virtualenvwrapper

# upgrade global ruby modules
shell_is_osx && gem install lolcommits

gem install foreman
gem install homesick
gem install neovim
gem install tmuxinator

. /usr/local/bin/virtualenvwrapper.sh

allvirtualenv pip install --upgrade pip neovim setuptools

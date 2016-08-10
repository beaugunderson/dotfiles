#!/bin/sh

# update all installed brew apps
brew update
brew cask update

# upgrade installed formulae
brew upgrade

# upgrade neovim
brew reinstall --HEAD neovim

# upgrade casks
upgrade-casks.sh

# remove old brew files
brew cleanup
brew cask cleanup

# upgrade vim plugins
/usr/local/bin/nvim +PlugUpgrade +qa
/usr/local/bin/nvim +PlugUpdate +qa

# upgrade App Store apps (`brew install mas` first)
mas upgrade

# reset permissions on global node_modules
sudo chown -R beau:admin /usr/local/lib/node_modules

# upgrade npm
# TODO: use npmbrew for this
# npm install -g npm

# upgrade npm global modules
npm install -g ava
npm install -g browserify
npm install -g budo
npm install -g eslint
npm install -g gulp
npm install -g jscs
npm install -g npm-check-updates
npm install -g npmbrew
npm install -g pmm
npm install -g standard
npm install -g supervisor

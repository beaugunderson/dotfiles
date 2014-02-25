#!/bin/sh

pushd ~/.homesick/repos/dotfiles/home/.vim/bundle/YouCompleteMe
./install.sh
popd

pushd ~/.homesick/repos/dotfiles/home/.vim/bundle/tern_for_vim
npm update
popd

pushd ~/.homesick/repos/dotfiles/home/.vim/bundle/vimproc
make
popd

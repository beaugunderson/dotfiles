#!/bin/bash

pushd ~/.homesick/repos/dotfiles/home/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.sh
popd

pushd ~/.homesick/repos/dotfiles/home/.vim/bundle/vimproc
make
popd

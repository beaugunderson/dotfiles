#!/bin/bash

source /usr/local/bin/virtualenvwrapper_lazy.sh

deactivate

rmvirtualenv canvas-web
rmvirtualenv home
rmvirtualenv messaging
rmvirtualenv ontologies
rmvirtualenv open-humans
rmvirtualenv pharmacy
rmvirtualenv science
rmvirtualenv sdk

mkvirtualenv canvas-web
pushd ~/p/canvas-web || exit
install-requirements.sh
popd || exit
deactivate

mkvirtualenv home
pushd ~/p/canvas/home-app || exit
install-requirements.sh
popd || exit
deactivate

mkvirtualenv messaging
pushd ~/p/canvas/messaging || exit
install-requirements.sh
popd || exit
deactivate

mkvirtualenv ontologies
pushd ~/p/canvas/ontologies || exit
install-requirements.sh
popd || exit
deactivate

mkvirtualenv open-humans
pushd ~/p/open-humans || exit
install-requirements.sh
popd || exit
deactivate

mkvirtualenv pharmacy
pushd ~/p/canvas/pharmacy || exit
install-requirements.sh
popd || exit
deactivate

mkvirtualenv science
pushd ~/p/canvas/science || exit
install-requirements.sh
popd || exit
deactivate

mkvirtualenv sdk
pushd ~/p/science-sdk || exit
install-requirements.sh
popd || exit
deactivate

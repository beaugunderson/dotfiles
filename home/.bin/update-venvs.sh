#!/bin/bash

source /usr/local/bin/virtualenvwrapper_lazy.sh

deactivate

rmvirtualenv home
rmvirtualenv messaging
rmvirtualenv ontologies
rmvirtualenv pharmacy
rmvirtualenv science

mkvirtualenv home
pushd ~/p/canvas/home-app || exit
poetry install
popd || exit
deactivate

mkvirtualenv messaging
pushd ~/p/canvas/messaging || exit
poetry install
popd || exit
deactivate

mkvirtualenv ontologies
pushd ~/p/canvas/ontologies || exit
poetry install
popd || exit
deactivate

mkvirtualenv pharmacy
pushd ~/p/canvas/pharmacy || exit
poetry install
popd || exit
deactivate

mkvirtualenv science
pushd ~/p/canvas/science || exit
poetry install
popd || exit
deactivate

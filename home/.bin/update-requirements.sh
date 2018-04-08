#!/usr/bin/env bash

export LIBMEMCACHED="/usr/local"
export LDFLAGS="-I/usr/local/opt/openssl/include -L/usr/local/opt/openssl/lib"

pip install --upgrade pip pip-tools setuptools

pip-compile -r requirements.in > requirements.txt
pip-compile -r dev-requirements.in > dev-requirements.txt

pip install -r dev-requirements.txt
pip install -r requirements.txt

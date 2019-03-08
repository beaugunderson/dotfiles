#!/usr/bin/env bash

set -e

export LIBMEMCACHED="/usr/local"
export LDFLAGS="-I/usr/local/opt/openssl/include -L/usr/local/opt/openssl/lib"

# pip install --upgrade pip pip-tools setuptools

echo "compiling requirements.in"
pip-compile -r requirements.in > requirements.txt

echo "compiling dev-requirements.in"
pip-compile -r dev-requirements.in > dev-requirements.txt

echo "installing requirements.in"
pip install -r requirements.txt

echo "installing dev-requirements.in"
pip install -r dev-requirements.txt

pip check

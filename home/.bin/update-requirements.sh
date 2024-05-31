#!/usr/bin/env bash

set -e

export LIBMEMCACHED="/usr/local"
export LDFLAGS="-I/usr/local/opt/openssl/include -L/usr/local/opt/openssl/lib"

# pip install --upgrade pip pip-tools setuptools

echo "compiling requirements.in"
[ -f requirements.in ] && pip-compile --generate-hashes requirements.in --output-file requirements.txt

echo "compiling requirements-test.in"
[ -f requirements-test.in ] && pip-compile --generate-hashes requirements-test.in --output-file requirements-test.txt

echo "compiling requirements-dev.in"
[ -f requirements-dev.in ] && pip-compile --generate-hashes requirements-dev.in --output-file requirements-dev.txt

echo "compiling dev-requirements.in"
[ -f dev-requirements.in ] && pip-compile --generate-hashes dev-requirements.in --output-file dev-requirements.txt

echo "installing requirements.in"
[ -f requirements.txt ] && pip install -r requirements.txt

echo "installing dev-requirements.in"
[ -f dev-requirements.txt ] && pip install -r dev-requirements.txt

echo "installing requirements-dev.in"
[ -f requirements-dev.txt ] && pip install -r requirements-dev.txt

echo "installing requirements-test.in"
[ -f requirements-test.txt ] && pip install -r requirements-test.txt

pip check

#!/usr/bin/env bash

pip install --upgrade pip pip-tools setuptools

pip-compile requirements.in > requirements.txt
pip-compile dev-requirements.in > dev-requirements.txt

pip install -r dev-requirements.txt
pip install -r requirements.txt

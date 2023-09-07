#!/bin/sh -eux

python3 setup.py build

export PYTHONPATH=$(dirname $(find ./build -iname "*.so")):${PYTHONPATH:-}

python3 -c 'import log'

#!/bin/sh -eux

git clone https://github.com/python/cpython --depth 1 --branch v3.11.5

(
  cd cpython
  ./configure
  make -j$(nproc)
  make test -j$(nproc)
)

#!/bin/sh -eux

git clone https://github.com/python/cpython || true

(
  cd cpython
  git checkout 2731913dd5234ff5ab630a3b7f1c98ad79d4d9df
  ./configure --disable-gil
  make -j$(nproc)
  make test -j$(nproc)
)

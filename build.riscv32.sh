#!/bin/sh -eux

git clone https://github.com/python/cpython --depth 1 --branch v3.11.5

(
  cd cpython

  export CONFIG_SITE=./config.site
  export PATH="$HOME/riscv/rv32/bin:${PATH}"
  export CC="$HOME/riscv/rv32/bin/riscv32-unknown-linux-gnu-gcc"
  export CXX="$HOME/riscv/rv32/bin/riscv32-unknown-linux-gnu-g++"
  export LD="$HOME/riscv/rv32/bin/riscv32-unknown-linux-gnu-ld"
  export AR="$HOME/riscv/rv32/bin/riscv32-unknown-linux-gnu-ar"
  export STRIP="$HOME/riscv/rv32/bin/riscv32-unknown-linux-gnu-strip"
  export RANLIB="$HOME/riscv/rv32/bin/riscv32-unknown-linux-gnu-ranlib"
  export OBJDUMP="$HOME/riscv/rv32/bin/riscv32-unknown-linux-gnu-objdump"
  export CFLAGS="-I$HOME/work/zlib/install/include -I$HOME/work/libffi/install/include -I$HOME/work/xz/install/include"
  export CPPFLAGS="-I$HOME/work/zlib/install/include -I$HOME/work/libffi/install/include -I$HOME/work/xz/install/include"
  export LDFLAGS="-static -L$HOME/work/zlib/install/lib -L$HOME/work/libffi/install/lib -L$HOME/work/xz/install/lib"

  ./configure --host=riscv32-unknown-linux-gnu --build=x86_64 --with-build-python=$(which python3.11) --disable-ipv6 --disable-shared

  make -j$(nproc)
  make test -j$(nproc)
)

#!/usr/bin/env bash

set -o xtrace -o pipefail -o errexit

stack --version

stack --help

stack new helloworld new-template

STACK_OPTS="--verbose"
if [[ $target_platform =~ linux.* ]]; then
  STACK_OPTS="${STACK_OPTS} \
    --extra-include-dirs ${PREFIX}/include \
    --extra-lib-dirs ${PREFIX}/lib"
  # required for gmp etc. to be found
  export LIBRARY_PATH=${LIBRARY_PATH}:${PREFIX}/lib
  echo "#!/bin/bash" > $CC-shim
  echo "set -e -o pipefail -x " >> $CC-shim
  echo "$CC -I$PREFIX/include -L$PREFIX/lib -fPIC -O2 \"\$@\"" >> $CC-shim
  chmod u+x $CC-shim
  export CC=$CC-shim
fi

pushd helloworld

stack ${STACK_OPTS} setup

stack ${STACK_OPTS} build --ghc-options \
  "-optlo-Os -optl-L${PREFIX}/lib -optl-Wl,-rpath,${PREFIX}/lib"

popd

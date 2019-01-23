#!/bin/bash

set -eu -o pipefail -x

stack new helloworld new-template
cd helloworld

STACK_OPTS="-v --local-bin-path ${PREFIX}/bin --extra-include-dirs ${PREFIX}/include --extra-lib-dirs ${PREFIX}/lib --with-gcc $CC"
stack ${STACK_OPTS} build --ghc-options "-optl-L${PREFIX}/lib -optl-Wl,-rpath,${PREFIX}/lib"

stack ${STACK_OPTS} exec helloworld-exe | grep someFunc
stack ${STACK_OPTS} test

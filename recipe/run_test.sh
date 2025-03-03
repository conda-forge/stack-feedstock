#!/bin/bash

set -o xtrace -o pipefail -o errexit

stack --version

stack --help

stack new helloworld new-template

cd helloworld

stack --verbose setup

stack --verbose build --ghc-options \
  "-optlo-Os -optl-L${PREFIX}/lib -optl-Wl,-rpath,${PREFIX}/lib"

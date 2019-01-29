#!/bin/bash

set -eu -o pipefail -x

stack --help
stack new helloworld new-template
cd helloworld
STACK_OPTS=" --resolver lts-8.24 "
stack $STACK_OPTS setup
stack $STACK_OPTS build
stack $STACK_OPTS exec helloworld-exe

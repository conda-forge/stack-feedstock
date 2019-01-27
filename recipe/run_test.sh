#!/bin/bash

set -eu -o pipefail -x

stack --help
stack new helloworld new-template
cd helloworld
STACK_OPTS=" --resolver 1.9.3 "
stack $STACK_OPTS setup
stack $STACK_OPTS build
stack $STACK_OPTS exec helloworld-exe



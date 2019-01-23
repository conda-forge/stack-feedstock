#!/bin/bash

set -eu -o pipefail -x

stack new helloworld new-template
cd helloworld
stack build

stack exec helloworld-exe | grep someFunc

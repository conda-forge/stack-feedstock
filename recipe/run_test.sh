#!/usr/bin/env bash

set -o xtrace -o pipefail -o errexit

stack --version

stack --help

stack new helloworld new-template

pushd helloworld

stack setup

stack build

popd

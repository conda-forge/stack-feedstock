#!/bin/bash

set -e -o pipefail -x

mkdir -p ${PREFIX}/bin
mv stack ${PREFIX}/bin

chmod u+x ${PREFIX}/bin/stack


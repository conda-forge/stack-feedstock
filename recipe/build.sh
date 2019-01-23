#!/bin/bash

set -eu -o pipefail

mkdir -p ${PREFIX}/bin
mv stack ${PREFIX}/bin

chmod +x ${PREFIX}/bin/stack

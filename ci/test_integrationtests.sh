#!/usr/bin/env bash

# This script is executed inside the builder image

set -e

source ./ci/matrix.sh

if [ "$RUN_TESTS" != "true" ]; then
  echo "Skipping integration tests"
  exit 0
fi

export LD_LIBRARY_PATH=$BUILD_DIR/depends/$HOST/lib

cd build-ci/axecore-$BUILD_TARGET

#./qa/pull-tester/rpc-tests.py --coverage
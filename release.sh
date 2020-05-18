#!/bin/bash

set -e

for V in "v0.10.0-beta"; do
  if [ "$1" == "--push" ]; then
    docker push "heathmont/lnd:$V"
  else
    docker build . --build-arg checkout="$V" -t "heathmont/lnd:$V"
  fi
done

#!/bin/sh

set -e

COMMIT="$(git rev-parse --verify HEAD --short)"

for V in "v0.10.0-beta"; do
  TAG="heathmont/lnd:$V-$COMMIT"
  if [ "$1" = "--push" ]; then
    docker push "$TAG"
  else
    docker build . --build-arg checkout="$V" -t "$TAG"
  fi
done

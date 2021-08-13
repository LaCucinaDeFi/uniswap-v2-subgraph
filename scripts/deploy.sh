#!/usr/bin/env bash

# Exit script as soon as a command fails.
set -o errexit

GRAPH_ACCESS_TOKEN=$1

if [ -z "$GRAPH_ACCESS_TOKEN" ]
then
  echo "USAGE of 'GRAPH_ACCESS_TOKEN': must be the access token obtained from thegraph.com."
  exit 1
fi

yarn codegen
yarn build
npx graph auth https://api.thegraph.com/deploy/ $GRAPH_ACCESS_TOKEN
yarn deploy
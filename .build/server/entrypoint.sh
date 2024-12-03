#!/bin/bash
set -e

if [ "$1" = 'web' ]; then
  export IPFS_CID=`ipfs --api $KUBO_URL add -qr --only-hash _site | tail -n 1`
  bundle exec rackup -o 0.0.0.0 -p $PORT
fi


exec "$@"

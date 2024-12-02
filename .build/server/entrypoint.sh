#!/bin/bash
set -e

if [ "$1" = 'web' ]; then
  bundle exec rackup -o 0.0.0.0 -p 9292
fi


exec "$@"

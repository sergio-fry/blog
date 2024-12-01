#!/bin/bash
set -e

ls -l 

if [ "$1" = 'web' ]; then
  bundle exec rackup
fi


exec "$@"

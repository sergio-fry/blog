#!/bin/bash
set -e

if [ "$1" = 'web' ]; then
  bundle exec rackup -o 0.0.0.0 -p ${PORT:=9292}

  exit 1
fi

exec "$@"

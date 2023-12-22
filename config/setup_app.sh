#!/bin/bash

set -e 

bundle check || bundle install --jobs 5 --retry 5

if [-f tmp/pids/server.pid]; then
  rm tmp/pids/server.pid
fi

if [ "$RAILS_ENV" = "development" ]; then
  bundle exec foreman start -f Procfile.dev "$@"
else
  # bundle exec foreman start -f Procfile "$@"
  echo "Initialize"
fi

exec "$@" # command from docker-compose.yml

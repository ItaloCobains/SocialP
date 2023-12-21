#!/bin/bash
set -e

# Function to wait for the database
wait_for_db() {
  echo "Waiting for postgres..."

  while ! nc -z db 5432; do
    sleep 0.1
  done

  echo "Postgres is up and running!"
}

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# Wait for the database
wait_for_db

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
#!/bin/sh

set -e

if [ -f /app/tmp/pids/server.pid ]; then
  rm /app/tmp/pids/server.pid
fi
#RAILS_ENV=development rails server -b 0.0.0.0 -p 3000
#bundle exec foreman start
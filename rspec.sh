#!/bin/sh

set -e

docker-compose -f docker-compose-test.yml build
docker-compose -f docker-compose-test.yml run --service-ports --rm -e "RAILS_ENV=test" app-test bin/rails db:create db:migrate
docker-compose -f docker-compose-test.yml run --service-ports --rm -e "RAILS_ENV=test" app-test bundle exec rspec

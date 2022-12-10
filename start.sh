#!/bin/sh

set -e


docker-compose -f docker-compose-development.yml build
docker-compose -f docker-compose-development.yml run --service-ports --rm app foreman start
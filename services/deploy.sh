#!/bin/sh
# Puts the current code live: builds the image, runs migrations, collects static files into
# ./staticfiles and recreates the containers. Also sets up a new server. If a step fails, the
# containers already running are left as they are.
set -eu
cd "$(dirname "$0")/.."

compose="docker compose -f prod.docker-compose.yaml"

$compose build
$compose run --rm --no-deps attendee-app python manage.py migrate
$compose run --rm --no-deps attendee-app python manage.py collectstatic --noinput
$compose up -d --force-recreate

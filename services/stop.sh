#!/bin/sh
# Stops and removes the production containers. Running bots (attendee-bot-<id>) aren't part of
# the stack, so they keep going until they end. Pass service names to stop only those.
set -eu
cd "$(dirname "$0")/.."

if [ "$#" -gt 0 ]; then
    exec docker compose -f prod.docker-compose.yaml rm -f -s "$@"
fi
exec docker compose -f prod.docker-compose.yaml down

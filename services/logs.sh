#!/bin/sh
# Follows the production containers' logs. Pass service names to see only those, e.g. attendee-app.
# Running bots (bot-<id>-<object_id>) aren't part of the stack; use docker logs for those.
set -eu
cd "$(dirname "$0")/.."

exec docker compose -f prod.docker-compose.yaml logs -f --tail=100 "$@"

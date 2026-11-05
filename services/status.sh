#!/bin/sh
# Shows the production containers, then follows their logs. Pass service names to see only those,
# e.g. attendee-app.
set -eu
cd "$(dirname "$0")/.."

compose="docker compose -f prod.docker-compose.yaml"

$compose ps "$@"
exec $compose logs -f --tail=100 "$@"

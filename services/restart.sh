#!/bin/sh
# Recreates the production containers, so changes to .env and a newly built image take effect.
# Pass service names to restart only those.
set -eu
cd "$(dirname "$0")/.."

exec docker compose -f prod.docker-compose.yaml up -d --force-recreate "$@"

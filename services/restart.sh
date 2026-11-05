#!/bin/sh
# Restarts the host redis-server, then recreates the production containers, so changes to .env and a newly built image take effect.
# Pass service names to restart only those.
set -eu
cd "$(dirname "$0")/.."

sudo systemctl restart redis-server

exec docker compose -f prod.docker-compose.yaml up -d --force-recreate "$@"

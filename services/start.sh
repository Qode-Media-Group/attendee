#!/bin/sh
# Restarts the host redis-server, then starts the production stack, building the image first if it's missing.
# Pass service names to start only those.
set -eu
cd "$(dirname "$0")/.."

sudo systemctl restart redis-server

exec docker compose -f prod.docker-compose.yaml up -d "$@"

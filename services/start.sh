#!/bin/sh
# Starts the production stack, building the image first if it's missing.
# Pass service names to start only those.
set -eu
cd "$(dirname "$0")/.."

exec docker compose -f prod.docker-compose.yaml up -d "$@"

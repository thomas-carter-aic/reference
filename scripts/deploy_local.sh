#!/usr/bin/env bash
# Local deploy simulation for staging
set -e

ENV=${1:-staging}
echo "Simulating deploy to ${ENV} (local containers)..."

docker compose -f infra/env/${ENV}/compose/compose.yaml pull || true
docker compose -f infra/env/${ENV}/compose/compose.yaml up -d --remove-orphans
echo "Deployed local ${ENV} stack. Run make logs ENV=${ENV} to follow logs."

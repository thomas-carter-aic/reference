#!/usr/bin/env bash
# Quick health checks for the environment
set -e

ENV=${1:-dev}
echo "Validating merged config for env=${ENV}..."
python3 tools/config_merge.py --env ${ENV} > /dev/null
echo "Config OK."

echo "Checking docker compose config..."
docker compose -f infra/env/${ENV}/compose/compose.yaml config > /dev/null
echo "Compose config OK."

echo "Listing containers..."
docker compose -f infra/env/${ENV}/compose/compose.yaml ps

#!/usr/bin/env bash
set -e

echo "Bootstrapping dev environment..."
make bootstrap

if [ ! -f infra/secrets/.env.local ]; then
  cp infra/secrets/.env.local.example infra/secrets/.env.local
  echo "Created infra/secrets/.env.local from example. Edit as required."
fi

echo "Starting dev environment..."
make up ENV=dev
echo "Done. Use 'make logs ENV=dev' to follow logs."


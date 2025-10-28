# Backup & Restore Playbook

## Scope
- Postgres event-store data
- Object storage (if used)
- Configuration and IaC state (Terraform state)

## Backup frequency
- Postgres WAL + full snapshot daily
- Object storage: versioning enabled

## Restore steps (Postgres example)
1. Stop incoming writes (quiesce services).
2. Restore latest snapshot to a new instance.
3. Replay WAL if needed.
4. Smoke test critical reads/actions.
5. Switch traffic to restored instance.

## Test restores
- Schedule periodic restore drills in staging (quarterly).

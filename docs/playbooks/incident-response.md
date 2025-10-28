# Incident Response Runbook

## Objectives
- Restore service quickly and safely.
- Communicate status to stakeholders.
- Capture remediation and postmortem artifacts.

## Roles
- Incident Commander (IC)
- Scribe
- Engineers (platform, service owners)
- Communications

## Play — when alert fires:
1. Acknowledge alert and assign IC.
2. Triage severity:
   - P0: service down / data loss / security breach
   - P1: degraded but functional
3. IC: gather context (logs, recent deploys, metrics).
   ```bash
   make logs ENV=prod
   ./tools/config_merge.py --env prod
````

4. If deploy-related, consider rollback to last-known-good.
5. If secret/leak suspected -> rotate secrets (see `security.md`) and revoke keys.
6. Keep stakeholders informed on an incident channel (Slack/Teams).

## Post-incident

* Produce a postmortem within 72 hours.
* Capture timeline, root cause, remediation, and action items.
* Create ADR if the incident implies an architectural change.

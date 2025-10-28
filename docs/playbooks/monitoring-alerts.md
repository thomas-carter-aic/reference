# Monitoring & Alerts Playbook

## Objectives
- Reliable detection of failures
- Meaningful, actionable alerts
- Avoid alert fatigue

## Minimum Signals (per service)
- Health check failures (HTTP 2xx / custom checks)
- Error rate > X% over Y minutes
- Latency > SLO thresholds
- Resource exhaustion (CPU, memory)
- Queue/backlog growth (for event-driven parts)

## Alerting policy
- Page for P0/P1 only.
- P2/P3 via ticketing.

## On-call flow
1. Alert -> on-call engineer investigates
2. If no resolution in T minutes, escalate to IC
3. Log findings in incident runbook.

## Tooling ideas
- Use OpenTelemetry for traces/metrics.
- Centralized logs (ELK, Loki, or managed cloud).
- PagerDuty or Opsgenie for escalation.

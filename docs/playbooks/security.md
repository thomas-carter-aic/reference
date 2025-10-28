# Security & Secrets Playbook

## Principles
- Least privilege for every service and human
- No secrets in git
- Rotate credentials regularly
- Audit and monitoring enabled

## Local dev
- Use `infra/secrets/.env.local` (never committed)
- Use mock secrets for tests

## Production
- Use Vault / cloud secret manager
- Use short-lived credentials where possible
- Audit secret access & key rotations

## Compromise procedure
1. Revoke affected keys immediately.
2. Rotate secrets in secret store.
3. Rebuild and redeploy artifacts if needed.
4. Run incident process and legal/compliance notification if required.

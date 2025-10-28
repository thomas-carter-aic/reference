# Deployment Playbook

## Purpose
Standardized deployment process for staging/prod, with safe rollback.

## Assumptions
- Build artifacts are stored in an artifact registry (container registry, package repo)
- IaC (Terraform/Pulumi) will provision infra; ADRs will capture chosen vendor.

## Steps — Production (example)
1. Prepare release branch:
   ```bash
   git checkout -b release/vX.Y.Z
   git tag -a vX.Y.Z -m "Release vX.Y.Z"
````

2. Build artifacts in CI (images, packages).
3. Run pre-deploy checks:

   * Integration tests
   * Security scans
   * Migration dry-run
4. Deploy to staging, run smoke tests.
5. If smoke tests pass, deploy to prod during a defined window:

   * Use blue/green or canary strategy where supported.
6. Post-deploy verification:

   * Health checks, key transactions, metrics baselines.

## Rollback

* If critical failure: rollback to previous image tag `vX.Y.(Z-1)`.
* For DB migrations, always include reversible migrations or a rollback plan in DB ADR.

## Emergency rollback steps

1. Mark release as failed in runbook tracker.
2. Re-deploy previous artifact tag:

   ```bash
   kubectl set image deployment/api api=yourorg/api:vX.Y.(Z-1)
   ```
3. Open incident and follow `incident-response.md`.

## Automation tips

* Keep deployment steps in CI pipeline as code.
* Use feature flags to decouple code release from feature rollout.

# Tenant Onboarding & Provisioning

## Steps
1. Create tenant record in control plane (DB + metadata).
2. Provision tenant-specific resources (schemas, buckets, quotas).
3. Create tenant-specific config under `infra/config/tenant/<tenant-id>/`.
4. Generate tenant secrets into secret manager and store references.
5. Run smoke tests for tenant flows.
6. Provide tenant admin credentials and onboarding docs.

## Multi-tenant considerations
- Strong tenant isolation (logical or physical)
- Billing and quota enforcement
- Monitoring per-tenant metrics

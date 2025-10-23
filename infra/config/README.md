# Configuration Hierarchy

Configuration is layered and composable to support multi-env and multi-tenant deployments.

## Structure
- **global/** — global, cross-service settings (organization-level)
- **env/** — environment-specific configurations (dev, staging, prod)
- **tenant/** — tenant-level overrides for multi-tenant architecture

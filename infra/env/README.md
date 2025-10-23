# Environment Orchestration

Each environment is self-contained and declarative.

## Layout
- **dev/** — local developer environment
- **staging/** — integration testing and pre-prod
- **prod/** — production environment
- **shared/** — reusable base compose definitions, common networks, and volumes

## Principles
- Environment configs extend from shared definitions.
- Configuration is merged with the global/env/tenant system.
- Each environment can be brought up with a single command:

make up ENV=dev

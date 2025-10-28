# Developer Onboarding Checklist

## Goal
Get a new developer from zero → productive (local dev + run tests) in under 60 minutes.

## Prereqs
- Docker & Docker Compose
- Git
- Node 22, Go toolchain, Python 3.12, Rust toolchain, JDK 21 (dev container will provide this)
- Access to repo and basic permissions

## Steps
1. Fork/clone the repo:
   ```bash
   git clone git@github.com:yourorg/ai-monorepo.git
   cd ai-monorepo
````

2. Run bootstrap:

   ```bash
   make bootstrap
   ```
3. Create local env:

   ```bash
   cp infra/secrets/.env.local.example infra/secrets/.env.local
   ```
4. Start dev environment:

   ```bash
   make up ENV=dev
   ```
5. Reopen in devcontainer (optional): Open VS Code and choose "Reopen in Container".
6. Run quick checks:

   ```bash
   make ps ENV=dev
   ./tools/config_merge.py --env dev
   ```
7. Run unit tests for an example workspace (if present):

   ```bash
   npm run test --workspaces
   # Later: go test ./... in go modules, pytest for python, cargo test for rust
   ```
8. Read ADRs in `docs/adr/` and architecture overview.

## Tips

* Use the `Makefile` as the canonical dev CLI.
* Use `./tools/adr-new.sh "Title"` to add ADRs for decisions you make.

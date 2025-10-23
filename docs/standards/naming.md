# Naming and Organization Standards

## General
- Use lowercase, hyphen-separated folder names: `auth-service`, `billing-service`
- Keep services in `services/<domain>-service/`
- Shared libraries in `packages/<language>/<library-name>`
- Infrastructure components in `infra/<tool>/<purpose>`

## Language conventions
- **TypeScript:** Use `@org/service-name` package scope.
- **Go:** Use module paths like `github.com/org/service-name`.
- **Python:** Follow PEP 8, module names lowercase with underscores.
- **Rust:** Use kebab-case for crates.
- **Java:** Use reverse-domain notation (`com.org.service`).

## Testing
- Test directories live alongside code (`src/` + `tests/`).
- Prefer TDD/BDD naming: `should_<behavior>` for test names.

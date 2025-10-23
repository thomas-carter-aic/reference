# Secrets Management

This directory contains secret management interfaces and adapters.

## Strategy
- **Local:** Use `.env` files for local development only.
- **Cloud / CI:** Use secret stores (Vault, AWS/GCP Secret Manager, or Doppler).
- **Access:** Never commit secrets to git. Use references (`${SECRET_KEY}`) that are resolved at runtime.

## Future Adapters
- `vault_adapter.py` / `vault_adapter.go`: for fetching secrets dynamically
- `mock_adapter`: for testing with fake secrets

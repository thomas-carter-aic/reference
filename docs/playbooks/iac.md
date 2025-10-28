# IaC Playbook

## Purpose
Define and manage cloud resources declaratively.

## Supported tools
- Terraform (default)
- Pulumi or Crossplane (future)
- Backend agnostic — can target AWS, GCP, Azure, or on-prem

## Directory layout

infra/iac/
├── env/ # Environment overlays (dev, staging, prod)
├── modules/ # Reusable IaC modules
├── providers/ # Provider configurations

## Commands
```bash
make iac-init ENV=dev
make iac-plan ENV=dev
make iac-apply ENV=staging
make iac-destroy ENV=dev
```



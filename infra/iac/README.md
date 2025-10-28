# Infrastructure as Code (IaC)

This directory will contain environment provisioning code.

## Terraform
`infra/iac/terraform/` — for declarative infrastructure (multi-cloud support).

## Pulumi
`infra/iac/pulumi/` — for programmatic IaC using Python/Go/TS.


# Infrastructure-as-Code (IaC)

This directory contains declarative infrastructure definitions and automation scripts.

## Goals
- Cloud-agnostic, composable IaC framework
- Support for Terraform, Pulumi, or Crossplane backends
- Environment-based overlays: `dev`, `staging`, `prod`
- Modular resource definitions under `modules/`

## Layout

infra/iac/
├── env/ # Environment overlays (dev, staging, prod)
├── modules/ # Shared Terraform/Pulumi modules
├── providers/ # Provider definitions (aws, gcp, azure, k8s)
└── README.md

## Usage
- `make iac-init` → initialize IaC backend
- `make iac-plan ENV=dev` → dry-run plan
- `make iac-apply ENV=staging` → apply to environment


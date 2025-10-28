# --- Setup ---
bootstrap:
	pnpm install -w
	go work sync
	cargo fetch

# --- Code Quality ---
format:
	pnpm run format

lint:
	pnpm run lint

# --- Tests ---
test:
	pnpm run test
	@echo "TODO: add Go, Python, Rust, Java test runners"

# --- Dev Experience ---
clean:
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type d -name "node_modules" -exec rm -rf {} +


# --- Environment orchestration ---

ENV ?= dev

up:
	@echo "Starting environment: $(ENV)"
	docker compose -f infra/env/$(ENV)/compose/compose.yaml up -d

down:
	@echo "Stopping environment: $(ENV)"
	docker compose -f infra/env/$(ENV)/compose/compose.yaml down

logs:
	docker compose -f infra/env/$(ENV)/compose/compose.yaml logs -f

ps:
	docker compose -f infra/env/$(ENV)/compose/compose.yaml ps


# Operational helpers
setup-dev:
   ./scripts/setup_dev_env.sh

check-env:
   ./scripts/check_env.sh

deploy-local:
   ./scripts/deploy_local.sh


# --- Infrastructure as Code ---

IAC_DIR ?= infra/iac/env
ENV ?= dev

iac-init:
	cd $(IAC_DIR)/$(ENV) && terraform init

iac-plan:
	cd $(IAC_DIR)/$(ENV) && terraform plan -var "environment=$(ENV)"

iac-apply:
	cd $(IAC_DIR)/$(ENV) && terraform apply -auto-approve -var "environment=$(ENV)"

iac-destroy:
	cd $(IAC_DIR)/$(ENV) && terraform destroy -auto-approve -var "environment=$(ENV)"

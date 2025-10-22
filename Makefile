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

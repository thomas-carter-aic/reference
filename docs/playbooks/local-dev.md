# Local Development Playbook

## Purpose
How to develop, test and iterate locally across polyglot services.

## Start environment
```bash
# Bring up databases and dev container
make up ENV=dev
# Enter the dev container (optional)
docker exec -it dev /bin/bash
````

## Common tasks

* Install language deps inside container:

  * Node: `npm ci` or `npm install`
  * Go: `go work sync && go test ./...`
  * Python: `poetry install` or `pip install -r requirements.txt`
  * Rust: `cargo build`

* Run one service locally:

  ```bash
  cd services/auth/ts
  npm run dev
  ```

* Logs:

  ```bash
  make logs ENV=dev
  ```

## Configuration

* Use `infra/config/*` and local `infra/secrets/.env.local` for envs.
* Validate merged config:

  ```bash
  ./tools/config_merge.py --env dev
  ```

## Debugging tips

* Check `docker compose ps` status for dependent infra.
* Use port-forwarding if you need to connect external debuggers.

#!/usr/bin/env python3
"""
Merge and validate layered configuration files.
Usage:
  ./tools/config_merge.py --env dev --tenant default
"""
import os, yaml, argparse

def load_yaml(path):
    if os.path.exists(path):
        with open(path) as f:
            return yaml.safe_load(f) or {}
    return {}

def merge(a, b):
    if isinstance(a, dict) and isinstance(b, dict):
        result = a.copy()
        for k, v in b.items():
            result[k] = merge(result[k], v) if k in result else v
        return result
    return b

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--env", default="dev")
    parser.add_argument("--tenant", default="default")
    args = parser.parse_args()

    base = load_yaml("infra/config/global/config.yaml")
    env_cfg = load_yaml(f"infra/config/env/{args.env}/config.yaml")
    tenant_cfg = load_yaml(f"infra/config/tenant/{args.tenant}/config.yaml")

    final_cfg = merge(merge(base, env_cfg), tenant_cfg)
    print(yaml.dump(final_cfg, sort_keys=False))

if __name__ == "__main__":
    main()

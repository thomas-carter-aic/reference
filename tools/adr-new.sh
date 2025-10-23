#!/usr/bin/env bash
# Usage: ./tools/adr-new.sh "Decision title"
set -e

TITLE="$1"
if [ -z "$TITLE" ]; then
  echo "Usage: $0 \"Decision title\""
  exit 1
fi

NEXT_ID=$(printf "%04d" $(($(ls docs/adr | grep -E '^[0-9]{4}' | sort | tail -n1 | cut -d'-' -f1 | sed 's/^0*//') + 1)))
FILENAME="docs/adr/${NEXT_ID}-$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd 'a-z0-9-').md"

cp docs/adr/_template.md "$FILENAME"
sed -i "s/XXXX/${NEXT_ID}/" "$FILENAME"
sed -i "s/YYYY-MM-DD/$(date +%F)/" "$FILENAME"
echo "Created $FILENAME"

#!/usr/bin/env bash
set -euo pipefail

usage() {
    echo "Usage: $0 <module_name> <database_name>"
    echo "Example: $0 example_custom odoo"
    exit 1
}

if [ $# -lt 2 ]; then
    usage
fi

MODULE_NAME="$1"
DATABASE_NAME="$2"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

cd "$ROOT_DIR"

if ! docker compose ps --status running 2>/dev/null | grep -q odoo18-starter-app; then
    echo "Error: Odoo container is not running. Start with: docker compose up -d"
    exit 1
fi

echo "Upgrading module '$MODULE_NAME' on database '$DATABASE_NAME'..."
docker compose exec odoo odoo -u "$MODULE_NAME" -d "$DATABASE_NAME" --stop-after-init
docker compose restart odoo
echo "Done."

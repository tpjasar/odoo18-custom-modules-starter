#!/usr/bin/env bash
set -euo pipefail

usage() {
    echo "Usage: $0 <module_name>"
    echo "Example: $0 sales_custom"
    echo ""
    echo "Creates a new Odoo module from addons/_template_module/"
    exit 1
}

if [ $# -lt 1 ]; then
    usage
fi

MODULE_NAME="$1"

if ! echo "$MODULE_NAME" | grep -qE '^[a-z][a-z0-9_]*$'; then
    echo "Error: module name must be lowercase snake_case (e.g. sales_custom)"
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
TEMPLATE="$ROOT_DIR/addons/_template_module"
TARGET="$ROOT_DIR/addons/$MODULE_NAME"

if [ ! -d "$TEMPLATE" ]; then
    echo "Error: template not found at $TEMPLATE"
    exit 1
fi

if [ -d "$TARGET" ]; then
    echo "Error: module already exists: addons/$MODULE_NAME"
    exit 1
fi

TITLE_CASE="$(echo "$MODULE_NAME" | sed 's/_/ /g' | awk '{for (i = 1; i <= NF; i++) $i = toupper(substr($i, 1, 1)) tolower(substr($i, 2))} 1')"

cp -r "$TEMPLATE" "$TARGET"

find "$TARGET" -type f \( -name "*.py" -o -name "*.xml" -o -name "*.csv" \) -print0 | while IFS= read -r -d '' file; do
    sed -i \
        -e "s/_template_module/${MODULE_NAME}/g" \
        -e "s/template_module/${MODULE_NAME}/g" \
        -e "s/Template Module/${TITLE_CASE}/g" \
        -e "s/template_reference/${MODULE_NAME}_reference/g" \
        -e "s/TemplateReference/$(echo "$MODULE_NAME" | sed -r 's/(^|_)([a-z])/\U\2/g')/g" \
        "$file"
done

# Enable the new module for installation
sed -i "s/'installable': False/'installable': True/" "$TARGET/__manifest__.py"
sed -i "s/Template — do not install. Copy with scripts\/new-module.sh/Custom module: ${MODULE_NAME}/" "$TARGET/__manifest__.py"

echo "Created module: addons/$MODULE_NAME"
echo ""
echo "Next steps:"
echo "  1. Edit addons/$MODULE_NAME/__manifest__.py (depends, summary)"
echo "  2. Add models in addons/$MODULE_NAME/models/"
echo "  3. Add views in addons/$MODULE_NAME/views/"
echo "  4. In Odoo: Apps → Update Apps List → Install \"$TITLE_CASE\""

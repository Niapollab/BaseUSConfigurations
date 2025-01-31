#!/bin/bash
set -eo pipefail

LOCALE="${1:-${LOCALE:-ru_RU.UTF-8}}"
LOCALE_FILES=(
    '/etc/locale.conf'
    '/etc/default/locale'
)

for file in "${LOCALE_FILES[@]}"; do
    if ! grep -q "LANG=\"$LOCALE\"" "$file"; then
        echo "[*] Change locale to \"$LOCALE\" in \"$file\" file"
        sudo sed -i "s/.*\(LANG\s*=\s*\).*/\1\"$LOCALE\"/" "$file"
    fi
done

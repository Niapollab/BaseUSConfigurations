#!/bin/bash
set -eo pipefail

LOCALE="${1:-${LOCALE:-ru_RU.UTF-8}}"

if ! grep -q "LANG=\"$LOCALE\"" '/etc/default/locale'; then
    echo "[*] Change locale to \"$LOCALE\""
    sudo sed -i "s/.*\(LANG\s*=\s*\).*/\1\"$LOCALE\"/" '/etc/default/locale'
fi

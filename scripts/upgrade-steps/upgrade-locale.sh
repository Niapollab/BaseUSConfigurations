#!/bin/bash
set -eo pipefail

LOCALE="ru_RU.UTF-8"

if ! grep -q "LANG=\"$LOCALE\"" '/etc/default/locale'; then
    echo "[*] Change locale to \"$LOCALE\""
    sudo sed -i 's/.*\(LANG\s*=\s*\).*/\1"ru_RU.UTF-8"/' '/etc/default/locale'
fi

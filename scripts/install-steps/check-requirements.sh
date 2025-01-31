#!/bin/bash
set -eo pipefail

echo '[*] Check for required packages are installed for install stage'
REQUIRED_APPS=(
    'sudo'
    'curl'
    'zsh'
)

for app in "${REQUIRED_APPS[@]}"; do
    if ! command -v "$app" &> /dev/null; then
        echo "[!] Unable to find required \"$app\" package"
        exit 1
    fi
done

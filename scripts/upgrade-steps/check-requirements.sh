#!/bin/bash
set -eo pipefail

echo '[*] Check for required packages are installed'
REQUIRED_APPS=(
    'sudo'
    'curl'
    'add-apt-repository'
    'git'
    'zsh'
)

for app in "${REQUIRED_APPS[@]}"; do
    if ! command -v "$app" &> /dev/null; then
        echo "[!] Unable to find required \"$app\" package"
        exit 1
    fi
done

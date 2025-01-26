#!/bin/bash
set -eo pipefail

echo '[*] Register missing repositories'
APT_REPOS=(
    'zhangsongcui3371/fastfetch'
)

for repo in "${APT_REPOS[@]}"; do
    if ! sudo apt-cache policy | grep -q "$repo"; then
        echo "[*] Register \"$repo\" repository"
        sudo add-apt-repository "ppa:$repo"
    fi
done

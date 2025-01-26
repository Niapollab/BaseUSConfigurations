#!/bin/bash
set -eo pipefail

echo '[*] Install packages from apt'
PACKAGES=(
    'bat'
    'btop'
    'eza'
    'fastfetch'
    'fzf'
    'language-pack-ru'
    'micro'
    'zoxide'
)

sudo apt install -y "${PACKAGES[@]}"

#!/bin/bash
set -eo pipefail

USER_TO_CHANGE="${1:-root}"
OLD_SHELL="$(getent passwd "$USER_TO_CHANGE" | awk -F: '{print $NF}')"
NEW_SHELL='/bin/zsh'

if [ "$NEW_SHELL" != "$OLD_SHELL" ]; then
    echo "[*] Set \"$NEW_SHELL\" shell as default for \"$USER_TO_CHANGE\" user"
    sudo chsh -s "$NEW_SHELL" "$USER_TO_CHANGE"
fi

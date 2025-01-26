#!/bin/bash
set -eo pipefail

USER_TO_CHANGE="${1:-root}"
NEW_SHELL='/bin/zsh'

if [ "$SHELL" != "$NEW_SHELL" ]; then
    echo "[*] Set \"$NEW_SHELL\" shell as default for \"$USER_TO_CHANGE\" user"
    sudo chsh -s "$NEW_SHELL" "$USER_TO_CHANGE"
fi

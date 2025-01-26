#!/bin/bash
set -eo pipefail

export ZSH="${ZSH:-/usr/share/oh-my-zsh}"

if [ -d "$ZSH" ]; then
    echo '[*] Update Oh-my-zsh'
    sudo git -C "$ZSH" pull
else
    echo '[*] Install Oh-my-zsh'
    sudo -HE sh -c "$(curl -fsSL 'https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh')"

    if [ ! -f "$HOME/.zshrc" ]; then
        echo "[*] Copy root zsh config to $(whoami)"
        sudo cp '/root/.zshrc' "$HOME/.zshrc"
        sudo chown "$(whoami):" "$HOME/.zshrc"
    fi
fi

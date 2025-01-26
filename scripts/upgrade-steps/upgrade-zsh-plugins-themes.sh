#!/bin/bash
set -eo pipefail

ZSH="${ZSH:-/usr/share/oh-my-zsh}"
ZSH_CUSTOM="${ZSH_CUSTOM:-$ZSH/custom}"

upgrade() {
    local type
    local repo_url
    local item_name
    local item_path

    type="$1"
    repo_url="$2"

    item_name="$3"
    item_path="$ZSH_CUSTOM/${type}s/$item_name"

    if [ ! -d "$item_path" ]; then
        echo "[*] Install \"$item_name\" $type"
        sudo git clone --recurse-submodules -j8 "$repo_url" "$item_path"
    else
        echo "[*] Update \"$item_name\" $type"
        sudo git -C "$item_path" pull
    fi
}

upgrade plugin 'https://github.com/zsh-users/zsh-syntax-highlighting.git' 'zsh-syntax-highlighting'
upgrade plugin 'https://github.com/zsh-users/zsh-autosuggestions.git' 'zsh-autosuggestions'
upgrade plugin 'https://github.com/joshskidmore/zsh-fzf-history-search.git' 'zsh-fzf-history-search'

upgrade theme 'https://github.com/spaceship-prompt/spaceship-prompt.git' 'spaceship-prompt'

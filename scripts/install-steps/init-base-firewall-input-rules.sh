#!/usr/bin/env bash
set -eo pipefail

SSH_PORT="${1:-$SSH_PORT}"

if [ -z "$SSH_PORT" ]; then
    SSH_PORT="$(awk '$1 == "Port" { print $2; exit }' '/etc/ssh/sshd_config' 2>/dev/null || true)"
fi

SSH_PORT="${SSH_PORT:-22}"

echo '[*] Create INPUT_BASE_RULES chain if it does not exist'
sudo iptables -N INPUT_BASE_RULES 2>/dev/null

echo '[*] Ensure jump is first'
sudo iptables -I INPUT 1 -j INPUT_BASE_RULES

echo '[*] Add rules to INPUT_BASE_RULES chain if them do not exist'
sudo iptables -C INPUT_BASE_RULES -i lo -j ACCEPT 2>/dev/null || \
sudo iptables -A INPUT_BASE_RULES -i lo -j ACCEPT

sudo iptables -C INPUT_BASE_RULES -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT 2>/dev/null || \
sudo iptables -A INPUT_BASE_RULES -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

sudo iptables -C INPUT_BASE_RULES -p tcp --dport "$SSH_PORT" -j ACCEPT 2>/dev/null || \
sudo iptables -A INPUT_BASE_RULES -p tcp --dport "$SSH_PORT" -j ACCEPT

sudo netfilter-persistent save

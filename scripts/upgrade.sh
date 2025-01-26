#!/bin/bash
set -eo pipefail

SCRIPT_DIR="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"
UPGRADE_STEPS="$SCRIPT_DIR/upgrade-steps"

"$UPGRADE_STEPS/check-requirements.sh"
"$UPGRADE_STEPS/upgrade-timezone.sh"
"$UPGRADE_STEPS/register-apt-missing-repos.sh"
"$UPGRADE_STEPS/apt-update-upgrade.sh"
"$UPGRADE_STEPS/install-apt-packages.sh"
"$UPGRADE_STEPS/upgrade-locale.sh"
"$UPGRADE_STEPS/upgrade-oh-my-zsh.sh"
"$UPGRADE_STEPS/upgrade-zsh-plugins-themes.sh"
"$UPGRADE_STEPS/change-user-shell-to-zsh.sh" 'root'
"$UPGRADE_STEPS/change-user-shell-to-zsh.sh" "$(whoami)"

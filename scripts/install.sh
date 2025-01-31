#!/bin/bash
set -eo pipefail

SCRIPT_DIR="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"
INSTALL_STEPS="$SCRIPT_DIR/install-steps"

"$INSTALL_STEPS/check-requirements.sh"
"$SCRIPT_DIR/upgrade.sh"
"$INSTALL_STEPS/set-locale.sh"
"$INSTALL_STEPS/set-timezone.sh"
"$INSTALL_STEPS/change-user-shell-to-zsh.sh" 'root'
"$INSTALL_STEPS/change-user-shell-to-zsh.sh" "$(whoami)"

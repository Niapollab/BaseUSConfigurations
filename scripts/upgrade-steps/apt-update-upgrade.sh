#!/bin/bash
set -eo pipefail

echo '[*] Update apt repositories'
sudo apt update -y

echo '[*] Upgrade system packages'
sudo apt upgrade -y

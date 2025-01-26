#!/bin/bash
set -eo pipefail

TIMEZONE="${1:-$TIMEZONE}"

if [ -z "$TIMEZONE" ]; then
    echo '[*] Fetch current timezone from a geoip server'
    TIMEZONE="$(curl -sL 'http://geoip.ubuntu.com/lookup' | sed -n 's/.*<TimeZone>\(.*\)<\/TimeZone>.*/\1/p')"
fi

if ! grep -q "$TIMEZONE" '/etc/timezone'; then
    echo "[*] Change timezone to \"$TIMEZONE\""
    sudo echo "$TIMEZONE" | sudo tee '/etc/timezone' &> /dev/null
    sudo ln -fs "/usr/share/zoneinfo/$TIMEZONE" '/etc/localtime'
fi

#!/usr/bin/env bash

set -euo pipefail

REAL_USER=${SUDO_USER:-$(whoami)}
REAL_HOME=$(eval echo "~$REAL_USER")
REAL_HOST=$(/bin/hostname -s)

while getopts "d:" opt; do
  case $opt in
    d) FLAKE_PATH="$OPTARG" ;;
    *) exit 1 ;;
  esac
done

if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

for f in /etc/bashrc /etc/zshrc; do
  if [ -f "$f" ] && ! grep -q "darwin-rebuild" "$f"; then
    sudo mv "$f" "$f.before-nix-darwin"
  fi
done

sudo USER="$REAL_USER" \
     HOME="$REAL_HOME" \
     HOST="$REAL_HOST" \
     nix run --extra-experimental-features 'nix-command flakes' nix-darwin -- switch \
     --impure \
     --flake "$FLAKE_PATH#$REAL_HOST"

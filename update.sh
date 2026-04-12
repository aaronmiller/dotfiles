#!/bin/bash
set -e

REAL_USER=${SUDO_USER:-$(whoami)}
REAL_HOME=$(eval echo "~$REAL_USER")
FLAKE_PATH="$REAL_HOME/dotfiles"

while getopts "d:" opt; do
  case $opt in
    d) FLAKE_PATH="$OPTARG" ;;
    *) exit 1 ;;
  esac
done

if [ -d "$FLAKE_PATH" ]; then
    cd "$FLAKE_PATH"
    
    if grep -q "base-config" flake.nix; then
        nix flake update base-config --extra-experimental-features 'nix-command flakes'
    else
        nix flake update --extra-experimental-features 'nix-command flakes'
    fi
else
    echo "Error: $FLAKE_PATH not found."
    exit 1
fi

#!/usr/bin/env bash

set -euo pipefail

sudo rm -rf /etc/nix /etc/*.{backup-before-nix,before-nix-darwin}

curl -L https://nixos.org/nix/install | sh -s -- --daemon

#!/usr/bin/env bash

set -euo pipefail

sudo rm -rf /etc/nix /etc/*.{backup-before-nix,before-nix-darwin}

export VERSION=2.34.6
curl -L https://releases.nixos.org/nix/nix-$VERSION/install | sh -s -- --daemon --yes

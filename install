#!/usr/bin/env bash

set -euo pipefail

if ! command -v /nix/var/nix/profiles/default/bin/nix &>/dev/null; then
  /usr/bin/sudo /bin/rm -rf /etc/nix /etc/*.{backup-before-nix,before-nix-darwin}

  export VERSION=2.34.6
  /usr/bin/curl -L https://releases.nixos.org/nix/nix-$VERSION/install | /bin/sh -s -- --daemon --yes
else
  echo "Nix is already installed. For a fresh install, please run teardown.sh. Exiting..."
fi

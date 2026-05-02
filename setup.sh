#!/usr/bin/env bash

set -euo pipefail

/usr/bin/sudo /bin/rm -rf /etc/nix /etc/*.{backup-before-nix,before-nix-darwin}

export VERSION=2.34.6
/usr/bin/curl -L https://releases.nixos.org/nix/nix-$VERSION/install | /bin/sh -s -- --daemon --yes

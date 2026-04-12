#!/bin/bash
set -e

sudo /bin/rm -rf /etc/nix /etc/*.{backup-before-nix,before-nix-darwin}

/usr/bin/curl -L https://nixos.org/nix/install | /bin/sh -s -- --daemon --yes

#!/usr/bin/env bash

set -euo pipefail

curl -L https://nixos.org/nix/install | sh -s -- --daemon

#!/usr/bin/env bash

export DEVTOOLS_DIR="${HOME}/devtools"
export DOTFILES_DIR="${HOME}/dotfiles"

if [[ $(uname -s) == "Darwin" ]]; then
  export CODE_DIR="${HOME}/code"
  export ZSH_TMUX_AUTOSTART="true"
fi

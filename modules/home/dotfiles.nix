{ pkgs, lib, config, ... }:

{
  home.file.".doom.d" = {
    source = lib.mkDefault ./dotfiles/doom.d;
    recursive = true;
  };

  home.file = {
    ".screenrc".source = ./dotfiles/screenrc;
    ".vimrc".source    = ./dotfiles/vimrc;
    ".flake8".source   = ./dotfiles/flake8;
    ".hammerspoon"     = { source = ./dotfiles/hammerspoon; recursive = true; };
  };
}

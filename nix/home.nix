{ lib, user, ... }:

{
  home.username = user;
  home.homeDirectory = lib.mkForce "/Users/${user}";
  home.stateVersion = "23.11";

  imports = [
    ./modules/core/env.nix
    ./modules/alacritty
    ./modules/emacs
    ./modules/tmux
    ./modules/zsh
  ];

  programs.home-manager.enable = true;
}

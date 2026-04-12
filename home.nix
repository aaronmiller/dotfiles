{ lib, user, enabledModules, ... }:

{
  home.username = user;
  home.homeDirectory = lib.mkForce "/Users/${user}";
  home.stateVersion = "23.11";

  imports = [
    ./modules/home/dotfiles.nix
    ./modules/home/git.nix
    ./modules/home/ssh.nix
    ./modules/home/packages.nix
    ./modules/home/direnv.nix
    ./modules/core/env.nix
    ./modules/alacritty
    ./modules/tmux
    ./modules/zsh
  ] ++ (map (name: ./modules/${name}) enabledModules);

  programs.home-manager.enable = true;
}

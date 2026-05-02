{ pkgs, lib, config, user, enabledModules, ... }:

{
  home.username = user;
  home.homeDirectory = lib.mkForce "/Users/${user}";
  home.stateVersion = lib.mkDefault "25.11";

  imports = [
    ./modules/home/env.nix
    ./modules/home/dotfiles.nix
    ./modules/home/git.nix
    ./modules/home/ssh.nix
    ./modules/home/packages.nix
    ./modules/home/direnv.nix

    ./modules/alacritty
    ./modules/tmux
    ./modules/zsh
  ] ++ (map (name: ./modules/${name})
       (builtins.filter (name:
         name != "brew" &&
         name != "macos" &&
         name != "emacs"
       ) enabledModules));

  programs.home-manager.enable = true;
}

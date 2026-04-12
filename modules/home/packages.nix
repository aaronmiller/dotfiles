{ pkgs, lib, config, ... }:

{
  home.packages = [
    pkgs.direnv
    pkgs.nix-direnv
  ];
}

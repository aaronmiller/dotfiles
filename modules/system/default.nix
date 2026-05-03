{ pkgs, lib, config, self, ... }:

{
  nix.settings.experimental-features = "nix-command flakes";
  system.configurationRevision = self.rev or self.dirtyRev or null;
  system.stateVersion = 6;
  nixpkgs.hostPlatform = "x86_64-darwin";

  imports = [
    ./env.nix
    ./packages.nix
  ];
}

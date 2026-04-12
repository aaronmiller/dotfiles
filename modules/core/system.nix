{ pkgs, lib, config, user, ... }:

{
  nix.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  services.nix-daemon.enable = true;

  users.users.${user} = {
    home = "/Users/${user}";
    shell = pkgs.zsh;
  };

  environment.shells = [ pkgs.zsh ];
  programs.bash.enable = true;
  system.stateVersion = 5;
}

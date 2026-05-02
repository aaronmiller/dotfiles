{ pkgs, lib, config, user, ... }:

{
  nix.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users.${user} = {
    home = "/Users/${user}";
    shell = pkgs.zsh;
  };

  environment.shells = [ pkgs.zsh ];
  programs.bash.enable = true;
  system.stateVersion = 25.11;
}

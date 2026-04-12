{ pkgs, lib, config, user, ... }:

{
  system.stateVersion = 5;

  nix.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.nix-daemon.enable = true;

  environment.shells = [ pkgs.zsh ];
  programs.zsh.enable = true;
  programs.bash.enable = true;

  users.users.${user} = {
    home = "/Users/${user}";
    shell = pkgs.zsh;
  };

  environment.systemPackages = [
    pkgs.mkalias
  ];

  system.activationScripts.applications.text = let
    env = pkgs.buildEnv {
      name = "system-applications";
      paths = config.environment.systemPackages;
      pathsToLink = "/Applications";
    };
  in
    pkgs.lib.mkForce ''
      echo "Setting up /Applications/Nix Apps..." >&2
      rm -rf /Applications/Nix\ Apps
      mkdir -p /Applications/Nix\ Apps

      search_paths=("${env}/Applications")

      if [ -d "/etc/profiles/per-user/${user}/Applications" ]; then
        search_paths+=("/etc/profiles/per-user/${user}/Applications")
      fi

      if [ -d "${config.users.users.${user}.home}/.nix-profile/Applications" ]; then
        search_paths+=("${config.users.users.${user}.home}/.nix-profile/Applications")
      fi

      find -L "''${search_paths[@]}" -maxdepth 2 -name "*.app" -exec readlink -f '{}' + |
      while read -r src; do
        app_name=$(basename "$src")
        echo "Exposing $app_name..." >&2
        ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
      done
    '';
}

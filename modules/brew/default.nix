{ pkgs, lib, config, enabledModules, user, ... }:

let
  brewEnabled = builtins.elem "brew" enabledModules;
  isIntel = pkgs.stdenv.hostPlatform.isx86_64;
  brewPrefix = if isIntel then "/usr/local" else "/opt/homebrew";

  baseCasks = [
    "alacritty"
    "google-chrome"
    "hammerspoon"
    "logi-options+"
    "monitorcontrol"
    "rectangle"
    "stats"
  ];
in
{
  imports = [
    ./casks.nix
  ];

  options = {
    modules.brew.extraCasks = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [];
    };
  };

  config = lib.mkIf brewEnabled {
    homebrew = {
      enable = true;
      onActivation.cleanup = "zap";
      onActivation.autoUpdate = true;
      onActivation.upgrade = true;

      casks = baseCasks ++ config.modules.brew.extraCasks;
    };

    home-manager.users.${user} = {
      home.sessionVariables = {
        HOMEBREW_NO_ANALYTICS = "1";
        HOMEBREW_PREFIX = brewPrefix;
      };

      home.sessionPath = [
        "${brewPrefix}/bin"
        "${brewPrefix}/sbin"
      ];
    };
  };
}

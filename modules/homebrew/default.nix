{ pkgs, lib, config, user, ... }:

let
  isIntel = pkgs.stdenv.hostPlatform.isx86_64;
  brewPrefix = if isIntel then "/usr/local" else "/opt/homebrew";

  baseCasks = [
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

  config = {
    homebrew = {
      enable = true;
      onActivation.cleanup = "zap";
      onActivation.autoUpdate = true;
      onActivation.upgrade = true;

      casks = baseCasks ++ extraCasks;
    };

    environment.variables = {
      HOMEBREW_NO_ANALYTICS = "1";
      HOMEBREW_PREFIX = brewPrefix;
    };
  };
}

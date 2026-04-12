{ pkgs, lib, config, ... }:

{
  modules.brew.extraCasks = [
    "android-file-transfer"
    "anki"
    "discord"
    "fontforge-app"
    "skim"
    "slack"
    "vlc"
  ];
}

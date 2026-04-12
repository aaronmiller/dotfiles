{ pkgs, lib, config, ... }: {

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";

    taps = [
      "homebrew/autoupdate"
    ];

    casks = [
      "alacritty"
      "anki"
      "discord"
      "google-chrome"
      "hammerspoon"
      "logi-options+"
      "monitorcontrol"
      "rectangle"
      "skim"
      "slack"
      "stats"
      "vlc"
    ];
  };
}

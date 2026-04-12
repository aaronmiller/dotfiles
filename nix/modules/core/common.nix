{ pkgs, lib, user, hostname, ... }: {

  environment.systemPackages = with pkgs; [
    aspell
    btop
    curl
    fd
    ffmpeg
    gh
    git
    gnupg
    ipcalc
    jq
    mise
    mkalias
    nmap
    pandoc
    pwgen
    ripgrep
    shellcheck
    speedtest-cli
    subnetcalc
    tldr
    tmux
    tree
    vim
    yq
    yt-dlp
  ];

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

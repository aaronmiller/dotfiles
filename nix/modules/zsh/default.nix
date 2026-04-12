{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;

      plugins = [
        "alias-finder"
        "aliases"
        "brew"
        "emacs"
        "gh"
        "git"
        "tmux"
      ];

      extraConfig = ''
        DISABLE_AUTO_UPDATE="true"
        DISABLE_UPDATE_PROMPT="true"
        COMPLETION_WAITING_DOTS="true"
        zstyle ':omz:update' mode auto
        zstyle ':omz:update' frequency 14
      '';
    };

    sessionVariables = {
      ZSH_TMUX_AUTOSTART = "true";
    };

    initExtraFirst = ''
      if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${USER}.zsh" ]]; then
        source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${USER}.zsh"
      fi
    '';

    profileExtra = ''
      if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
        . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
      fi

      if [[ -z "$TMUX" && -z "$EAT_SHELL" && -z "$INSIDE_EMACS" && -t 0 ]]; then
        exec tmux
      fi
    '';

    initExtra = ''
      source ${./p10k.zsh}

      if [[ -d "$HOME/devtools" ]]; then
        export DEVTOOLS_DIR="$HOME/devtools"
        source "$DEVTOOLS_DIR/scripts/index.sh"
      fi

      if [[ -z "$INSIDE_EMACS" && -z "$EAT_SHELL" ]]; then
        if command -v doom >/dev/null 2>&1; then
          doom env > /dev/null 2>&1
        fi
      fi
    '';

    shellAliases = {
      apply = "HOST=$(hostname) USER=$(whoami) darwin-rebuild switch --flake $DOTFILES_DIR/nix#$(hostname) --impure";
      update = "nix flake update --flake $DOTFILES_DIR/nix";
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
  };

  home.packages = with pkgs; [
    meslo-lgs-nf
    fzf
  ];
}

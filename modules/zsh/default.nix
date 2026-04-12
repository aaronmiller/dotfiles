{ pkgs, lib, config, ... }:

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
        "git"
        "tmux"
      ];
      extraConfig = ''
        ZSH_TMUX_AUTOSTART="true"
        DISABLE_AUTO_UPDATE="true"
        DISABLE_UPDATE_PROMPT="true"
        COMPLETION_WAITING_DOTS="true"
      '';
    };

    initExtraFirst = ''
      if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${USER}.zsh" ]]; then
        source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${USER}.zsh"
      fi
    '';

    profileExtra = ''
      if [[ -z "$TMUX" && -z "$EAT_SHELL" && -z "$INSIDE_EMACS" && -t 0 ]]; then
        exec tmux
      fi
    '';

    initExtra = ''
      source ${./p10k.zsh}

      ${builtins.readFile ./functions.zsh}
      ${builtins.readFile ./hooks.zsh}

      if [[ -d "$DEVTOOLS_DIR" ]]; then
        source "$DEVTOOLS_DIR/scripts/index.sh"
      fi
    '';

    sessionVariables = {
      PATH = "$HOME/.config/emacs/bin:$PATH";
    };

    shellAliases = {
      devtools = "cd $BASE_DEVTOOLS_DIR";
      dotfiles = "cd $BASE_DOTFILES_DIR";
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
  };
}

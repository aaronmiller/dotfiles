{ pkgs, lib, config, ... }:

let
  brewBin = if pkgs.stdenv.hostPlatform.isAarch64
            then "/opt/homebrew/bin/brew"
            else "/usr/local/bin/brew";
in
{
  environment.systemPackages = [
    pkgs.oh-my-zsh
    pkgs.zsh-powerlevel10k
  ];

  environment.shellAliases = {
    devtools = "cd $BASE_DEVTOOLS_DIR";
    dotfiles = "cd $BASE_DOTFILES_DIR";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;

    shellInit = ''
      if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${USER}.zsh" ]]; then
        source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${USER}.zsh"
      fi

      if [[ -f "${brewBin}" ]]; then
        eval "$(${brewBin} shellenv)"
      fi
    '';

    loginShellInit = ''
      if [[ -z "$TMUX" && -z "$EAT_SHELL" && -z "$INSIDE_EMACS" && -t 0 ]]; then
        exec tmux
      fi
    '';

    interactiveShellInit = ''
      export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh

      ZSH_TMUX_AUTOSTART="true"
      DISABLE_AUTO_UPDATE="true"
      DISABLE_UPDATE_PROMPT="true"
      COMPLETION_WAITING_DOTS="true"

      plugins=(alias-finder aliases git tmux)

      source $ZSH/oh-my-zsh.sh
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      [[ ! -f ${./p10k.zsh} ]] || source ${./p10k.zsh}

      ${builtins.readFile ./functions.zsh}
      ${builtins.readFile ./hooks.zsh}

      if [[ -d "$DEVTOOLS_DIR" ]]; then
        source "$DEVTOOLS_DIR/scripts/index.sh"
      fi
    '';
  };
}

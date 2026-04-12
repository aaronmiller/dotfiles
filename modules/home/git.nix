{ pkgs, lib, config, ... }:

{
  programs.git = {
    enable = true;
    extraConfig = {
      core.editor = "vim";
      pull.rebase = true;
      fetch.prune = true;
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      diff.colorMoved = "zebra";
      advice.addIgnoredFile = false;
      remote.origin.prune = true;
      include.path = "~/.gitconfig_user";
    };
    ignores = [
      ".DS_Store"
      "*.swp"
    ];
  };
}

{ config, lib, ... }:

{
  home.sessionVariables = {
    CODE_DIR = "${config.home.homeDirectory}/code";
    DEVTOOLS_DIR = "${config.home.homeDirectory}/devtools";
    DOTFILES_DIR = "${config.home.homeDirectory}/dotfiles";
    EDITOR = lib.mkDefault "vim";
    VISUAL = lib.mkDefault "vim";
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
  };
}

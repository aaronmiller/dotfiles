{ pkgs, lib, config, user, ... }:

{
  home.sessionVariables = {
    BASE_DEVTOOLS_DIR = "/Users/${user}/devtools";
    BASE_DOTFILES_DIR = "/Users/${user}/dotfiles";
    DEVTOOLS_DIR = lib.mkDefault "/Users/${user}/devtools";
    DOTFILES_DIR = lib.mkDefault "/Users/${user}/dotfiles";
    CODE_DIR = "/Users/${user}/code";

    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
  };

  home.sessionPath = [
    "/Users/${user}/.local/bin"
  ];
}

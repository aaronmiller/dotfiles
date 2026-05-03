{ pkgs, lib, config, ... }:

{
  environment.variables = {
    BASE_DEVTOOLS_DIR = "$HOME/devtools";
    BASE_DOTFILES_DIR = "$HOME/dotfiles";
    DEVTOOLS_DIR = lib.mkDefault "$HOME/devtools";
    DOTFILES_DIR = lib.mkDefault "$HOME/dotfiles";
  };
}

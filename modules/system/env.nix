{ pkgs, lib, config, ... }:

{
  environment.variables = {
    BASE_DOTFILES_DIR = "$HOME/dotfiles";
    DOTFILES_DIR = lib.mkDefault "$HOME/dotfiles";
  };
}

{ pkgs, lib, config, user, ... }:

let
  manualDotfilesDir = "/Users/${user}/dotfiles";
in
{
  home.file = {
    ".doom.d".source = config.lib.file.mkOutOfStoreSymlink "${manualDotfilesDir}/modules/home/dotfiles/doom.d";
    
    ".screenrc".source = config.lib.file.mkOutOfStoreSymlink "${manualDotfilesDir}/modules/home/dotfiles/screenrc";

    ".vimrc".source = config.lib.file.mkOutOfStoreSymlink "${manualDotfilesDir}/modules/home/dotfiles/vimrc";

    ".flake8".source = config.lib.file.mkOutOfStoreSymlink "${manualDotfilesDir}/modules/home/dotfiles/flake8";

    ".hammerspoon".source = config.lib.file.mkOutOfStoreSymlink "${manualDotfilesDir}/modules/home/dotfiles/hammerspoon";
  };
}

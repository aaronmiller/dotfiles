{ pkgs, lib, config, ... }:

{
  home.sessionVariables = {
    SSL_CERT_FILE = lib.mkForce "/etc/ssl/cert.pem";
    NIX_SSL_CERT_FILE = lib.mkForce "/etc/ssl/cert.pem";
    GIT_SSL_CAINFO = lib.mkForce "/etc/ssl/cert.pem";

    CODE_DIR = "${config.home.homeDirectory}/code";
    BASE_DEVTOOLS_DIR = "${config.home.homeDirectory}/devtools";
    BASE_DOTFILES_DIR = "${config.home.homeDirectory}/dotfiles";
    DEVTOOLS_DIR = lib.mkDefault "${config.home.homeDirectory}/devtools";
    DOTFILES_DIR = lib.mkDefault "${config.home.homeDirectory}/dotfiles";

    EDITOR = lib.mkDefault "vim";
    VISUAL = lib.mkDefault "vim";

    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
  };
}

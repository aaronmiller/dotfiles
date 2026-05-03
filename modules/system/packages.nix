{ pkgs, lib, config, ... }: {

  environment.systemPackages = [
    pkgs.btop
    pkgs.fd
    pkgs.gnupg
    pkgs.ipcalc
    pkgs.jq
    pkgs.keychain
    pkgs.nmap
    pkgs.pwgen
    pkgs.ripgrep
    pkgs.stow
    pkgs.subnetcalc
    pkgs.tmux
    pkgs.tree
    pkgs.vim
    pkgs.yq
  ];
}

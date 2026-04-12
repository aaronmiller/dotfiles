{ pkgs, lib, config, enabledModules, ... }: {

  environment.systemPackages = [
    pkgs.aspell
    pkgs.btop
    pkgs.cacert
    pkgs.curl
    pkgs.fd
    pkgs.gh
    pkgs.git
    pkgs.gnupg
    pkgs.ipcalc
    pkgs.jq
    pkgs.keychain
    pkgs.mise
    pkgs.mkalias
    pkgs.nmap
    pkgs.pandoc
    pkgs.pwgen
    pkgs.ripgrep
    pkgs.shellcheck
    pkgs.speedtest-cli
    pkgs.subnetcalc
    pkgs.tldr
    pkgs.tmux
    pkgs.tree
    pkgs.vim
    pkgs.yq
  ] ++ (if builtins.elem "emacs" enabledModules then [ pkgs.emacsPkg ] else []);
}

{ pkgs, lib, config, ... }:

{
  environment.etc."gitconfig".text = ''
    [core]
      editor = vim
    [pull]
      rebase = true
    [fetch]
      prune = true
    [init]
      defaultBranch = main
    [push]
      autoSetupRemote = true
    [diff]
      colorMoved = zebra
    [advice]
      addIgnoredFile = false
    [remote "origin"]
      prune = true
    [include]
      path = ~/.gitconfig_user
    [core]
      excludesfile = /etc/gitignore
  '';

  environment.etc."gitignore".text = ''
    .DS_Store
    *.swp
  '';
}

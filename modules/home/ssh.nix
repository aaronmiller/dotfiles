{ pkgs, ... }:

{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    
    matchBlocks = {
      "*" = {
        identityFile = "~/.ssh/id_ed25519";
        extraOptions = {
          "StrictHostKeyChecking" = "no";
          "UseKeychain" = "yes";
        };
        setEnv = {
          "TERM" = "xterm";
        };
      };
    };
  };
}

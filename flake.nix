{
  description = "Base nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:

  {
    darwinConfigurations."simple" = nix-darwin.lib.darwinSystem {
      modules = [
        ./modules/system
      ];

      specialArgs = { inherit self inputs; };
    };
  };
}

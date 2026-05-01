{
  description = "Nix configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin/nix-darwin-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    emacs-overlay.url = "github:nix-community/emacs-overlay";
    emacs-src = {
      url = "github:aaronmiller/emacs/amiller/emacs-30.2";
      flake = false;
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nixpkgs-unstable, home-manager, ... }:
  let
    system = builtins.currentSystem;
    user = builtins.getEnv "USER";
    hostname = builtins.getEnv "HOST";
    emacsVersion = "30.2";
    enabledModules = let
      raw = builtins.getEnv "EXTRA_MODULES";
    in if raw == "" then [] else (builtins.fromJSON raw);

    baseOverlays = [
      (final: prev: {
        unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
      })
    ];
  in {
    overlays = baseOverlays;
    inheritedInputs = inputs;

    darwinModules.base = {
      nixpkgs.overlays = baseOverlays;
      nixpkgs.config.allowUnfree = true;
      imports = [
        ./modules/core/system.nix
        ./modules/core/env.nix
        ./modules/core/packages.nix
        ./modules/macos
        ./modules/brew
        ./modules/emacs
      ];
    };

    homeModules.base = import ./home.nix;

    darwinConfigurations."${hostname}" = nix-darwin.lib.darwinSystem {
      inherit system;
      specialArgs = { inherit inputs user hostname enabledModules emacsVersion; };
      modules = [
        self.darwinModules.base
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit inputs user hostname enabledModules emacsVersion; };
          home-manager.users.${user} = self.homeModules.base;
        }
      ];
    };
  };
}

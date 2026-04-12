{
  description = "Nix configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin/nix-darwin-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    emacs-overlay.url = "github:nix-community/emacs-overlay";
    emacs-src = {
      url = "github:aaronmiller/emacs/amiller/emacs-30.2";
      flake = false;
    };
  };

  outputs = { self, nix-darwin, nixpkgs, nixpkgs-unstable, home-manager, emacs-overlay, ... }@inputs:
  let
    system = builtins.currentSystem;
    user = builtins.getEnv "USER";
    hostname = builtins.getEnv "HOST";
    emacsVersion = "30.2";

    enabledModules = let
      raw = builtins.getEnv "EXTRA_MODULES";
    in if raw == "" then [] else (builtins.fromJSON raw);

    sharedModule = { pkgs, lib, ... }: {
      nixpkgs.overlays = [
        emacs-overlay.overlay
        (final: prev: {
          unstable = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };
          emacsPkg = (prev.emacs-git.override {
            withNativeCompilation = false;
          }).overrideAttrs (old: {
            src = inputs.emacs-src;
            version = emacsVersion;
            patches = [];
          });
        })
      ];

      nixpkgs.config.allowUnfree = true;

      services.emacs = {
        enable = builtins.elem "emacs" enabledModules;
        package = pkgs.emacsPkg;
      };

      imports = [ ./modules/core/system.nix ./modules/core/packages.nix ];
    };

    mkDarwinConfig = { s, u, h }: nix-darwin.lib.darwinSystem {
      inherit system;
      specialArgs = { inherit inputs user hostname enabledModules; extractedVersion = emacsVersion; };
      modules = [
        sharedModule
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit inputs user hostname enabledModules; extractedVersion = emacsVersion; };
          home-manager.users.${u} = import ./home.nix;
        }
      ];
    };
  in {
    darwinConfigurations."${hostname}" = mkDarwinConfig {
      s = system; u = user; h = hostname;
    };
  };
}

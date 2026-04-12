{
  description = "Nix configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

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

  outputs = { self, nix-darwin, nixpkgs, home-manager, emacs-overlay, emacs-src }@inputs:
  let
    system = builtins.currentSystem;
    user = builtins.getEnv "USER";
    hostname = builtins.getEnv "HOST";

    mkDarwinConfig = { s, u, h }: nix-darwin.lib.darwinSystem {
      inherit system;
      specialArgs = { inherit inputs; user = u; hostname = h; };

      modules = [
        {
          nixpkgs.overlays = [ emacs-overlay.overlay ];
          nixpkgs.config.allowUnfree = true;
        }

        ./modules/core/system.nix
        ./modules/core/common.nix

        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit inputs; user = u; hostname = h; };
          home-manager.users.${u} = import ./home.nix;
        }
      ];
    };
  in {
    darwinConfigurations."${hostname}" = mkDarwinConfig {
      s = system;
      u = user;
      h = hostname;
    };
  };
}

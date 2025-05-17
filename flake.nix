{
  description = "BugMachine";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixvim, flake-parts, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      # Deine Konfiguration für nixvim hier, ohne home-manager
      nixvimModules.default = { pkgs, ... }: {
        imports = [ ./config ];
      };

      packages.${system}.default = nixvim.legacyPackages.${system}.makeNixvimWithModule {
        inherit pkgs;
        module = self.nixvimModules.default;
      };

      homeManagerModules.default = { config, pkgs, ... }: {
        imports = [ nixvim.homeManagerModules.nixvim ];
        programs.nixvim = {
          enable = true;
          imports = [ ./config ];
        };
      };
    };
}

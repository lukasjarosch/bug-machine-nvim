{
  description = "BugMachine";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixvim,
      flake-parts,
      pre-commit-hooks,
      treefmt-nix,
      home-manager,
      ...
    }@inputs:
    let
      forAllSystems = nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
      ];

      treefmtFor =
        system:
        treefmt-nix.lib.evalModule nixpkgs.legacyPackages.${system} {
          projectRootFile = "flake.nix";
          programs.nixfmt.enable = true;
        };

      # Build the neovide GUI wrapper for a given pkgs + already-built nvim
      # derivation. Used both by `packages.${system}.neovide` (for direct
      # `nix run`/`nix profile install`) and by the home-manager module
      # (where `nvimPkg` is `config.programs.nixvim.finalPackage`, so the
      # GUI and the CLI share the same nvim build).
      mkNeovide =
        pkgs: nvimPkg:
        let
          fontConf = pkgs.makeFontsConf {
            fontDirectories = [ pkgs.nerd-fonts.fira-code ];
          };
          launcher = pkgs.writeShellApplication {
            name = "neovide";
            runtimeInputs = [ pkgs.neovide ];
            text = ''
              export FONTCONFIG_FILE=${fontConf}
              exec neovide --neovim-bin ${nvimPkg}/bin/nvim "$@"
            '';
          };
          desktopItem = pkgs.makeDesktopItem {
            name = "bug-machine-nvim";
            desktopName = "BugMachine";
            genericName = "Where bugs come to meet their maker";
            comment = "Bundled nixvim config running under neovide";
            exec = "${launcher}/bin/neovide %F";
            icon = "${pkgs.neovide}/share/icons/hicolor/scalable/apps/neovide.svg";
            terminal = false;
            categories = [
              "Development"
              "TextEditor"
            ];
            startupWMClass = "neovide";
            mimeTypes = [
              "text/plain"
              "text/x-shellscript"
              "text/x-c"
              "text/x-c++"
              "text/x-go"
              "text/x-nix"
            ];
          };
        in
        pkgs.symlinkJoin {
          name = "neovide-bug-machine";
          paths = [
            launcher
            desktopItem
          ];
          # Without mainProgram, `nix run .#neovide` would look for
          # bin/neovide-bug-machine (the derivation name) and fail.
          meta.mainProgram = "neovide";
        };
    in
    {
      nixvimModules.default =
        { pkgs, ... }:
        {
          imports = [ ./config ];
        };

      packages = forAllSystems (
        system:
        let
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
          nvim = nixvim.legacyPackages.${system}.makeNixvimWithModule {
            inherit pkgs;
            module = self.nixvimModules.default;
          };
        in
        {
          default = nvim;
          neovide = mkNeovide pkgs nvim;
        }
      );

      checks = forAllSystems (system: {
        pre-commit-check = pre-commit-hooks.lib.${system}.run {
          src = ./.;
          hooks = {
            treefmt = {
              enable = true;
              package = (treefmtFor system).config.build.wrapper;
            };
            statix = {
              enable = true;
              settings.ignore = [ "**/hardware-configuration.nix" ];
            };
            trim-trailing-whitespace.enable = true;
            end-of-file-fixer = {
              enable = true;
              excludes = [ "CLAUDE.md" ];
            };
            check-merge-conflicts.enable = true;
          };
        };
      });

      devShells = forAllSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          default = pkgs.mkShell {
            inherit (self.checks.${system}.pre-commit-check) shellHook;
            buildInputs = self.checks.${system}.pre-commit-check.enabledPackages ++ [
              pkgs.statix
              (treefmtFor system).config.build.wrapper
            ];
          };
        }
      );

      formatter = forAllSystems (system: (treefmtFor system).config.build.wrapper);

      homeManagerModules.default =
        { config, pkgs, ... }:
        {
          imports = [ nixvim.homeManagerModules.nixvim ];
          programs.nixvim = {
            enable = true;
            imports = [ ./config ];
          };
          # Ships the neovide wrapper + .desktop entry into home-manager's
          # XDG paths so rofi/fuzzel/wofi pick it up automatically.
          home.packages = [ (mkNeovide pkgs config.programs.nixvim.finalPackage) ];
        };
    };
}

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
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };

      # Build the neovide GUI wrapper for a given pkgs + already-built nvim
      # derivation. Used both by `packages.${system}.neovide` (for direct
      # `nix run`/`nix profile install`) and by the home-manager module
      # (where `nvimPkg` is `config.programs.nixvim.finalPackage`, so the
      # GUI and the CLI share the same nvim build).
      mkNeovide = pkgs: nvimPkg:
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
            comment = "Bundled nixvim config running under neovide";
            exec = "${launcher}/bin/neovide %F";
            icon =
              "${pkgs.neovide}/share/icons/hicolor/scalable/apps/neovide.svg";
            terminal = false;
            categories = [ "Development" "TextEditor" ];
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
        in pkgs.symlinkJoin {
          name = "neovide-bug-machine";
          paths = [ launcher desktopItem ];
          # Without mainProgram, `nix run .#neovide` would look for
          # bin/neovide-bug-machine (the derivation name) and fail.
          meta.mainProgram = "neovide";
        };
    in {
      nixvimModules.default = { pkgs, ... }: { imports = [ ./config ]; };

      packages.${system} = {
        default = nixvim.legacyPackages.${system}.makeNixvimWithModule {
          inherit pkgs;
          module = self.nixvimModules.default;
        };

        neovide = mkNeovide pkgs self.packages.${system}.default;
      };

      homeManagerModules.default = { config, pkgs, ... }: {
        imports = [ nixvim.homeManagerModules.nixvim ];
        programs.nixvim = {
          enable = true;
          imports = [ ./config ];
        };
        # Ships the neovide wrapper + .desktop entry into home-manager's
        # XDG paths so rofi/fuzzel/wofi pick it up automatically.
        home.packages =
          [ (mkNeovide pkgs config.programs.nixvim.finalPackage) ];
      };
    };
}

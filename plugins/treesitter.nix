{
  pkgs,
  config,
  lib,
  ...
}: {
  plugins = {
    treesitter = {
      enable = true;
      nixGrammars = true;
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        bash
        json
        lua
        make
        markdown
        nix
        regex
        toml
        vim
        vimdoc
        xml
        yaml
        go
        rust
        comment
      ];
      settings = {
        highlight.enable = true;
        indent.enable = true;
      };
    };

    treesitter-context = {
      enable = true;
      settings = { max_lines = 2; };
    };

    treesitter-refactor = {
      enable = true;
      highlightDefinitions.enable = true;
      highlightCurrentScope.enable = true;
      smartRename.enable = true;
      navigation = {
        enable = true;
        keymaps = {
          gotoDefinition = "gd";
        };
      };
    };

    rainbow-delimiters.enable = true;
  };
}

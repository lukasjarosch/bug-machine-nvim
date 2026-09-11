{
  pkgs,
  config,
  lib,
  ...
}:
{
  opts = {
    foldmethod = "expr";
    foldexpr = "v:lua.vim.treesitter.foldexpr()";
    # Without these, every fold starts closed on open - forces new buffers
    # to open fully unfolded instead.
    foldlevel = 99;
    foldlevelstart = 99;
  };

  plugins = {
    treesitter = {
      enable = true;
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter-parsers; [
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
        gomod
        typescript
      ];
      settings = {
        highlight.enable = true;
        indent.enable = true;
      };
    };

    treesitter-context = {
      enable = true;
      settings = {
        max_lines = 2;
      };
    };

    rainbow-delimiters.enable = true;
  };
}

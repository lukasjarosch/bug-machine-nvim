{
  imports = [ ./keymap.nix ./options.nix ../plugins];


  colorschemes.onedark.enable = true;
  colorschemes.onedark.settings.style = "cool";

  diagnostics = {
    virtual_text = {
      spacing = 4;  # Number of spaces between virtual text and the line
      source = "always";  # Show source of diagnostic
      prefix = "●";  # Prefix for virtual text
    };
    signs = {
      severity_sort = true;  # Sort by severity
      enable = true;        # Make sure signs are enabled
    };
  };

  extraConfigLua = ''
    -- Set diagnostic signs to icons
    vim.diagnostic.config({
      signs = {
        text = {
          -- Klammern sind normaler Lua-Code
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN]  = "",
          [vim.diagnostic.severity.INFO]  = "",
          [vim.diagnostic.severity.HINT]  = "",
        },
      },
    })
  '';

  plugins.lsp = {
    enable = true;
    servers = {
      gopls.enable = true;
      yamlls.enable = true;
      jsonls.enable = true;
      lua_ls.enable = true;
    };
  };


  plugins.neo-tree = {
    enable = true;
  };
}

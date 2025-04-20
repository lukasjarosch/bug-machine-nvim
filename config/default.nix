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

  # Set diagnostic signs to icons
  extraConfigLua = ''
    local signs = {
      { name = "DiagnosticSignError", text = "" },
      { name = "DiagnosticSignWarn", text = "" },
      { name = "DiagnosticSignHint", text = "" },
      { name = "DiagnosticSignInfo", text = "" },
    }
    for _, sign in ipairs(signs) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end
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

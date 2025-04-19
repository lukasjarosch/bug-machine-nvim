{
  imports = [ ./keymap.nix ./options.nix ../plugins];


  colorschemes.onedark.enable = true;
  colorschemes.onedark.settings.style = "cool";

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

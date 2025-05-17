{
  plugins.lsp = {
    enable = true;
    servers = {
      gopls = {
        enable = true;
      };

      yamlls.enable = true;
      jsonls.enable = true;
      lua_ls.enable = true;
      nil_ls.enable = true;
    };
  };
}

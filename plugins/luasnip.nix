{
  plugins = {
    luasnip = {
      enable = true;
      fromVscode = [
        { paths = ./../snippets; }
      ];
      settings.enable_autosnippets = true;
    };
    friendly-snippets = {
      enable = true;
    };
  };
}

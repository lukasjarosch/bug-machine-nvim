{
  plugins = {
    luasnip = {
      enable = true;
      fromVscode = [
        { paths = ./../snippets; }
      ];
      fromLua = [
        { paths = ./../lua-snippets; }
      ];
      settings.enable_autosnippets = true;
    };
    friendly-snippets = {
      enable = true;
    };
  };
}

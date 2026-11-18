{
  plugins.neoscroll = {
    enable = true;
    luaConfig.pre = "if not vim.g.neovide then";
    luaConfig.post = "end";
    settings = {
      easing_function = "quadratic";
      hide_cursor = true;
      stop_eof = true;
      respect_scrolloff = false;
    };
  };
}

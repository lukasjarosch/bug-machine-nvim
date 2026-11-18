{
  plugins.smear-cursor = {
    enable = true;
    luaConfig.pre = "if not vim.g.neovide then";
    luaConfig.post = "end";
    settings = {
      stiffness = 0.8;
      trailing_stiffness = 0.5;
      distance_stop_animating = 0.5;
    };
  };
}

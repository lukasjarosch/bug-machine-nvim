{
  plugins.avante = {
    enable = true;
    settings = {
      provider = "claude";
      auto_suggestions = false;
      claude = {
        endpoint = "https://api.anthropic.com";
        model = "claude-sonnet-4-20250514";
        temperature = 0;
        max_tokens = 4096;
      };
      behaviour = {
        auto_suggestions = false;
        auto_set_highlight_group = true;
        auto_set_keymaps = true;
        auto_apply_diff_after_generation = false;
        support_paste_from_clipboard = false;
      };
      mappings = {
        ask = "<leader>aa";
        edit = "<leader>ae";
        refresh = "<leader>ar";
      };
      hints = { enabled = true; };
      windows = {
        position = "right";
        wrap = true;
        width = 30;
      };
    };
  };
}

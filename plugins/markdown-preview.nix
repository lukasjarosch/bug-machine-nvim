{
  plugins.markdown-preview = {
    enable = true;
    settings = {
      auto_start = 1;
      browser = "";
      theme = "dark";
      sync_scroll_type = "middle";
      auto_close = 1;
      relative_line_numbers = false;
      disable_hover = false;

      mappings = {
        close = "<Esc>";
        refresh = "r";
        toggle = "<CR>";
      };
    };
  };

  keymaps = [
    {
      key = "<leader>mp";
      action = "<cmd>MarkdownPreviewToggle<CR>";
      mode = [ "n" ];
      options.desc = "Toggle Markdown Preview";
    }
  ];
}

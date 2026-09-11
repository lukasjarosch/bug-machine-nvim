{
  plugins.telescope = {
    enable = true;

    extensions.ui-select = {
      enable = true;
      settings = {
        __raw = "require('telescope.themes').get_dropdown({})";
      };
    };
  };

  # Mute the telescope borders by linking them to the colorscheme's own
  # window-separator group, so they blend with regular split lines instead
  # of using telescope's loud accent default.
  highlight = {
    TelescopeBorder.link = "WinSeparator";
    TelescopePromptBorder.link = "WinSeparator";
    TelescopeResultsBorder.link = "WinSeparator";
    TelescopePreviewBorder.link = "WinSeparator";
  };
}

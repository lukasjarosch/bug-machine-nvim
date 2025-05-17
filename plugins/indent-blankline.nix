{
  plugins.indent-blankline = {
    enable = true;

    settings = {
      scope = {
        enabled = true;
        show_end = true;
        show_start = true;
      };

      indent = {
        char = "│";
      };

      # Exclude specific filetypes, including dashboard
      exclude = {
        filetypes = [
          "dashboard"
          "help"
          "terminal"
          "lazy"
          "mason"
          "notify"
          "NvimTree"
          "neo-tree"
          "alpha"
          "startify"
        ];
        buftypes = [
          "terminal"
          "nofile"
          "quickfix"
          "prompt"
        ];
      };
    };
  };
}

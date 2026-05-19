{
  plugins.neo-tree = {
    enable = true;

    settings = {
      close_if_last_window = true;

      window.mappings = {
        "v" = "split_with_window_picker";
        "s" = "vsplit_with_window_picker";
        "w" = "open_with_window_picker";
      };

      filesystem = {
        bind_to_cwd = true;
        follow_current_file.enabled = true;
        window.mappings = {
          "v" = "split_with_window_picker";
          "s" = "vsplit_with_window_picker";
          "w" = "open_with_window_picker";
        };
      };

      buffers.window.mappings = {
        "v" = "split_with_window_picker";
        "s" = "vsplit_with_window_picker";
        "w" = "open_with_window_picker";
      };

      git_status.window.mappings = {
        "v" = "split_with_window_picker";
        "s" = "vsplit_with_window_picker";
        "w" = "open_with_window_picker";
      };
    };
  };
}

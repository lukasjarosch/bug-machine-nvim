{
  plugins.neo-tree = {
    enable = true;
    closeIfLastWindow = true;

    filesystem = {
      followCurrentFile = { enabled = true; };

      window.mappings = {
        "v" = "split_with_window_picker";
        "s" = "vsplit_with_window_picker";
        "w" = "open_with_window_picker";
      };
    };

    window.mappings = {
      "v" = "split_with_window_picker";
      "s" = "vsplit_with_window_picker";
      "w" = "open_with_window_picker";
    };

    buffers.window.mappings = {
      "v" = "split_with_window_picker";
      "s" = "vsplit_with_window_picker";
      "w" = "open_with_window_picker";
    };

    gitStatus.window.mappings = {
      "v" = "split_with_window_picker";
      "s" = "vsplit_with_window_picker";
      "w" = "open_with_window_picker";
    };
  };
}

{
  plugins.neo-tree = {
    enable = true;
    
    # Anstelle von "settings" verwenden wir die direkten Optionen
    window.mappings = {
      "s" = "split_with_window_picker";
      "v" = "vsplit_with_window_picker";
      "w" = "open_with_window_picker";
    };
    
    filesystem.window.mappings = {
      "s" = "split_with_window_picker";
      "v" = "vsplit_with_window_picker";
      "w" = "open_with_window_picker";
    };
    
    buffers.window.mappings = {
      "s" = "split_with_window_picker";
      "v" = "vsplit_with_window_picker";
      "w" = "open_with_window_picker";
    };
    
    gitStatus.window.mappings = {
      "s" = "split_with_window_picker";
      "v" = "vsplit_with_window_picker";
      "w" = "open_with_window_picker";
    };
  };
}

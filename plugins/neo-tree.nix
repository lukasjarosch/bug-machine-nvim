{
  plugins.neo-tree = {
    enable = true;
    
    # Anstelle von "settings" verwenden wir die direkten Optionen
    window.mappings = {
      "v" = "split_with_window_picker";
      "s" = "vsplit_with_window_picker";
      "w" = "open_with_window_picker";
    };
    
    filesystem.window.mappings = {
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

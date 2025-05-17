{
  plugins.neo-tree = {
    enable = true;
    
    # Window-picker Integration hinzufügen
    settings = {
      window = {
        mappings = {
          # Tastenkombination für "open in split"
          "s" = "split_with_window_picker";
          # Tastenkombination für "open in vsplit"
          "v" = "vsplit_with_window_picker";
        };
      };
      
      # Hier kommt die window-picker Konfiguration für neo-tree
      filesystem = {
        window = {
          mappings = {
            "s" = "split_with_window_picker";
            "v" = "vsplit_with_window_picker";
          };
        };
        
        # Optional: Weitere Einstellungen für das Dateisystem
      };
      
      # Gleiche Mappings für Buffers und Git
      buffers = {
        window = {
          mappings = {
            "s" = "split_with_window_picker";
            "v" = "vsplit_with_window_picker";
          };
        };
      };
      
      git_status = {
        window = {
          mappings = {
            "s" = "split_with_window_picker";
            "v" = "vsplit_with_window_picker";
          };
        };
      };
    };
  };
}

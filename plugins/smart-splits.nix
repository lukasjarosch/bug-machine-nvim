{
  # Easy window resizing with smart-splits.nvim
  plugins.smart-splits = {
    enable = true;
    settings = {
      # The default resize amount when resizing panes
      resize_step_percentage = 5;
      # Whether to ignore buffer-local keymaps for the resize commands
      ignore_buftypes = [
        "nofile"
        "quickfix"
        "prompt"
      ];
      # Resize mode options
      resize_mode = {
        # Key to exit resize mode
        quit_key = "<ESC>";
        # Keys to use for moving in resize mode
        # resize_keys accepts a list with the keys for resizing in each direction
        resize_keys = [ "h" "j" "k" "l" ];
        # Set to true to silence the notifications
        silent = false;
      };
    };
  };
}

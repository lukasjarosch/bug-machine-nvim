{
  # Import all .nix files in the plugins directory
  imports =
    let
      # Get all files in the current directory
      files = builtins.readDir ./.;
      # Filter for .nix files that aren't default.nix
      nixFiles = builtins.filter
        (filename:
          builtins.match ".*\\.nix" filename != null &&
          filename != "default.nix"
        )
        (builtins.attrNames files);
      # Convert filenames to import paths
      imports = map
        (filename: ./${filename})
        nixFiles;
    in
    imports;

  plugins = {
    # nerdfont support
    web-devicons.enable = true;

    copilot-lua = {
      enable = true;
      settings = {
        panel = {
          layout = {
            position = "right";
          };
        };
        suggestion = {
          enabled = false;
          auto_trigger = false;
        };
      };
    };

    avante = {
      enable = true;
      settings = {
        provider = "copilot";
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


    # custom plugins
    windowPicker.enable = true;
    sonokai.enable = false; # disable `colorscheme` if enabled
    nix.enable = true;
    vimGo.enable = true;
  };


}

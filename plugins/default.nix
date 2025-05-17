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

    # custom plugins
    windowPicker.enable = true;
    sonokai.enable = false; # disable `colorscheme` if enabled
    nix.enable = true;
    vimGo.enable = true;
  };


}

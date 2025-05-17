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

  # nerdfont support
  plugins.web-devicons.enable = true;

  # custom plugins
  plugins.windowPicker.enable = true;
  # plugins.sonokai.enable = true;
  plugins.nix.enable = true;
}

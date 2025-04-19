{
  # Import all your configuration modules here
  imports = [ ./bufferline.nix ./treesitter.nix  ./git.nix ./bufferline.nix];

  colorschemes.rose-pine.enable = true;
  colorschemes.rose-pine.settings.dark_variant = "moon";

  plugins.trouble.enable = true;
  plugins.neo-tree = {
    enable = true;
  };
}

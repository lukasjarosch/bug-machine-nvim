{
  imports = [ 
    ./git.nix 
    ./treesitter.nix
    ./which-key.nix
    ./telescope.nix
    ./cmp.nix
    ./luasnip.nix
    ./git.nix
    ./bufferline.nix
  ];

  # nerdfont support
  plugins.web-devicons.enable = true;

  plugins.trouble.enable = true;
  plugins.lualine.enable = true;
}

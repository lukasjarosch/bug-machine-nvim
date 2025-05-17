{ pkgs, ... }:

{
  plugins.nix = {
    enable = true;
  };

  # plugins.conform-nvim = {
  #   # Falls du conform-nvim für Formatierung verwendest
  #   formatters.nix = {
  #     command = "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt";
  #   };
  # };

  # Nix-Linting
  # plugins.lint = {
  #   # Falls du nvim-lint verwendest
  #   linters.nix = {
  #     cmd = "${pkgs.statix}/bin/statix";
  #   };
  # };

  extraConfigLua = ''
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "nix",
      callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.expandtab = true
        vim.opt_local.autoindent = true
        vim.opt_local.smartindent = true
      end
    })
  '';
}

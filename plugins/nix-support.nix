{ pkgs, ... }:

{
  plugins.nix = {
    enable = true;
  };

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

{ pkgs, config, lib, ... }:

with lib;
let cfg = config.plugins.windowPicker;  # Ändere window-picker zu windowPicker
in {
  options.plugins.windowPicker = {      # Ändere window-picker zu windowPicker
    enable = mkEnableOption "Enable window-picker plugin";
  };

  config = mkIf cfg.enable {
    extraPlugins = [
      pkgs.vimPlugins.nvim-window-picker
    ];

    extraConfigLua = ''
      require('window-picker').setup({
        autoselect_one = true,
        include_current = false,
        filter_rules = {
          bo = {
            filetype = { 'NvimTree', 'neo-tree', 'notify', 'quickfix' },
            buftype = { 'terminal', 'quickfix' }
          }
        },
        other_win_hl_color = '#e35e4f'
      })
    '';
  };
}

{ pkgs, config, lib, ... }:

with lib;
let cfg = config.colorschemes.sonokai;
in {
  options.plugins.sonokai = {
    enable = mkEnableOption "Enable sonokai colorscheme";
    
    settings = {
      style = mkOption {
        type = types.enum [ "default" "atlantis" "andromeda" "shusia" "maia" "espresso" ];
        default = "default";
        description = "The style of sonokai";
      };
      
      transparent_background = mkOption {
        type = types.bool;
        default = false;
        description = "Make the background transparent";
      };
      
      diagnostics = {
        undercurl = mkOption {
          type = types.bool;
          default = true;
          description = "Use undercurl for diagnostics";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    extraPlugins = [ 
      pkgs.vimPlugins.sonokai
    ];
    
    extraConfigVim = ''
      let g:sonokai_style = '${cfg.settings.style}'
      let g:sonokai_enable_italic = 1
      let g:sonokai_better_performance = 1
      let g:sonokai_transparent_background = ${if cfg.settings.transparent_background then "1" else "0"}
      let g:sonokai_diagnostic_text_highlight = 1
      let g:sonokai_diagnostic_line_highlight = 1
      let g:sonokai_diagnostic_virtual_text = 1
      let g:sonokai_diagnostic_undercurl = ${if cfg.settings.diagnostics.undercurl then "1" else "0"}
      
      colorscheme sonokai
    '';
  };
}

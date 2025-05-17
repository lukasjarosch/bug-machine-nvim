{ pkgs, config, lib, ... }:

with lib;
let cfg = config.plugins.vimGo;
in {
  options.plugins.vimGo = {
    enable = mkEnableOption "Enable vim-go plugin";
  };

  config = mkIf cfg.enable {
    extraPlugins = [
      pkgs.vimPlugins.vim-go
    ];

    extraConfigVim = ''
      "
      " vim-go settings with enhanced Go navigation
      "
      " These features are disabled because we're using LSP (gopls) for them.
      " Enabling them would create conflicts between vim-go and LSP.
      let g:go_code_completion_enabled = 0  " Let LSP handle code completion
      let g:go_def_mapping_enabled = 0      " Let LSP handle 'go to definition'
      let g:go_doc_keywordprg_enabled = 0   " Let LSP handle documentation lookups
      let g:go_gopls_enabled = 0            " Prevent vim-go from starting its own gopls instance
      
      " These features are kept because they're not provided by LSP or are better in vim-go
      let g:go_fmt_command = 'goimports'    " Use goimports for automatic import management
      let g:go_imports_autosave = 1         " Run goimports on file save
      
      " Syntax highlighting options - these enhance the visual experience
      " and don't conflict with LSP functionality
      let g:go_highlight_types = 1
      let g:go_highlight_fields = 1
      let g:go_highlight_functions = 1
      let g:go_highlight_function_calls = 1
      let g:go_highlight_operators = 1
      let g:go_highlight_extra_types = 1
      let g:go_highlight_build_constraints = 1
      let g:go_highlight_generate_tags = 1
      
      " Keep vim-go's test commands available
      let g:go_test_show_name = 1
    '';
  };
}

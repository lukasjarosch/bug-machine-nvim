{
  plugins.blink-cmp = {
    enable = true;
    # Wires blink-cmp's LSP capabilities into every configured LSP server,
    # otherwise gopls (& co) don't know the client can do snippet-style
    # completion and completion falls back to plain buffer-text matches.
    setupLspCapabilities = true;

    settings = {
      keymap = {
        "<C-b>" = [ "scroll_documentation_up" "fallback" ];
        "<C-f>" = [ "scroll_documentation_down" "fallback" ];
        "<C-space>" = [ "show" "show_documentation" "hide_documentation" ];
        "<C-e>" = [ "hide" "fallback" ];
        "<CR>" = [ "accept" "fallback" ];
        "<C-j>" = [ "select_next" "snippet_forward" "fallback" ];
        "<C-k>" = [ "select_prev" "snippet_backward" "fallback" ];
      };

      completion = {
        documentation.auto_show = true;
      };

      sources.default = [ "lsp" "path" "snippets" "buffer" ];

      snippets = {
        expand = {
          __raw = ''function(snippet) require("luasnip").lsp_expand(snippet) end'';
        };
        active = {
          __raw = ''function(filter) return require("luasnip").in_snippet() end'';
        };
        jump = {
          __raw = ''function(direction) require("luasnip").jump(direction) end'';
        };
      };

      # blink-cmp nix package ships the rust fuzzy matcher lib
      fuzzy.implementation = "rust";
    };
  };
}

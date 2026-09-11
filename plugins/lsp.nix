{
  plugins.lsp = {
    enable = true;
    servers = {
      gopls = {
        enable = true;
        # NOTE: must be nested under `gopls`, matching gopls's own settings
        # section name. gopls fetches its config via `workspace/configuration`
        # with section "gopls" - without this nesting, Neovim's core handler
        # (vim/lsp/handlers.lua, RSC['workspace/configuration']) does a
        # `vim.tbl_get(client.settings, "gopls")` lookup that resolves to nil,
        # so gopls silently gets no settings at all and falls back to its
        # defaults (verified by tracing the actual LSP requests).
        settings = {
          gopls = {
            # Enhanced gopls settings to improve "go to definition" and other features
            usePlaceholders = true;
            completeUnimported = true;
            staticcheck = true;
            # Without this, gopls never computes semantic tokens, which is how it
            # highlights/links `[Type]` doc-comment references (Go 1.19+ doc comment
            # syntax) - it defaults to off.
            semanticTokens = true;
            matcher = "fuzzy";
            symbolMatcher = "fuzzy";
            buildFlags = [ "-tags=integration,e2e" ];
            analyses = {
              unusedparams = true;
              unusedvariable = true;
              nilness = true;
              shadow = true;
            };
            # Enabling codelenses for test and generate
            codelenses = {
              generate = true;
              regenerate_cgo = false;
              test = true;
              tidy = false;
              vendor = false;
              upgrade_dependency = false;
            };
            # Improve symbol matching for standard library and dependencies
            directoryFilters = [
              "-node_modules"
              "-vendor"
            ];
            # Allow gopls to work with the standard library
            expandWorkspaceToModule = true;
            # Show inlay hints for type information
            hints = {
              constantValues = true;
              parameterNames = true;
              assignVariableTypes = true;
              rangeVariableTypes = true;
              compositeLiteralTypes = true;
              compositeLiteralFields = true;
              functionTypeParameters = true;
            };
          };
        };
      };

      rust_analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
        # rustfmt is already provided via conform.nix
        installRustfmt = false;
      };

      yamlls.enable = true;
      terraformls.enable = true;
      jsonls.enable = true;
      lua_ls.enable = true;
      nil_ls.enable = true;
      bashls.enable = true;

      harper_ls = {
        enable = true;
        settings = {
          # nested under harper-ls like gopls above, same reason
          "harper-ls" = {
            diagnosticSeverity = "hint";
            linters = {
              SpellCheck = true;
              SentenceCapitalization = true;
              RepeatedWords = true;
            };
          };
        };
      };
    };
  };
}

{
  plugins.lsp = {
    enable = true;
    servers = {
      gopls = {
        enable = true;
        settings = {
          # Enhanced gopls settings to improve "go to definition" and other features
          usePlaceholders = true;
          completeUnimported = true;
          staticcheck = true;
          matcher = "fuzzy";
          symbolMatcher = "fuzzy";
          buildFlags = [ "-tags=integration,e2e" ];
          analyses = {
            unusedparams = true;
            unusedvariable = true;
            fieldalignment = true;
            nilness = true;
            shadow = true;
          };
          # Enabling codelenses for references, test, generate, gc_details
          codelenses = {
            generate = true;
            gc_details = false;
            regenerate_cgo = false;
            test = true;
            tidy = false;
            vendor = false;
            references = false;
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

      yamlls.enable = true;
      terraformls.enable = true;
      jsonls.enable = true;
      lua_ls.enable = true;
      nil_ls = {
        enable = true;
        settings.formatting.command = [ "nixpkgs-fmt" ];
      };
      bashls.enable = true;
    };
  };
}

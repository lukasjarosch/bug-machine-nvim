{
  plugins.none-ls = {
    enable = true;
    sources = {
      # Formatierung
      formatting = {
        # Go
        gofmt.enable = true;
        goimports.enable = true;
        # YAML
        yamlfmt.enable = true;
        # Bash
        shfmt = {
          enable = true;
          settings.extra_args = [ "-i" "2" "-ci" ];
        };
        # Nix
        nixpkgs_fmt.enable = true;
      };

      diagnostics = {
        # Go
        golangci_lint.enable = true;
        # YAML
        yamllint.enable = true;
        # Nix
        statix.enable = true;
      };

      code_actions = {
        # Go
        gomodifytags.enable = true;
        impl.enable = true;
        # Nix
        statix.enable = true;
      };
    };
  };
}

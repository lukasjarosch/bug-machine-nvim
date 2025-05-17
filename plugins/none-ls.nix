{
  plugins.none-ls = {
    enable = true;
    sources = {
      # Formatierung
      formatting = {
        # Go
        gofmt.enable = true;
        goimports.enable = true;
        # Rust
        rustfmt.enable = true;
        # YAML
        yamlfmt.enable = true;
        # Bash
        shfmt = {
          enable = true;
          options = [ "-i" "2" "-ci" ];
        };
        # Nix
        nixpkgs_fmt.enable = true;
      };

      diagnostics = {
        # Go
        golangci_lint.enable = true;
        # Bash
        shellcheck.enable = true;
        # YAML
        yamllint.enable = true;
        # Nix
        statix.enable = true;
      };

      code_actions = {
        # Go
        gomodifytags.enable = true;
        impl.enable = true;
        # Bash
        shellcheck.enable = true;
        # Nix
        statix.enable = true;
      };
    };
  };
}

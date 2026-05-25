{ pkgs, ... }:
{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft = {
        nix = [ "nixfmt" ];
        go = [
          "goimports"
          "gofmt"
        ];
        rust = [ "rustfmt" ];
        sh = [ "shfmt" ];
        bash = [ "shfmt" ];
        json = [ "jq" ];
        yaml = [ "yamlfmt" ];
        toml = [ "taplo" ];
        terraform = [ "tofu_fmt" ];
      };

      formatters.shfmt.prepend_args = [
        "-i"
        "2"
        "-ci"
      ];

      format_on_save = {
        timeout_ms = 2000;
        lsp_format = "fallback";
        stop_after_first = true;
      };
    };
  };

  # Bundle the formatter binaries into the nvim wrapper so they're on PATH
  # regardless of the host shell.
  extraPackages = with pkgs; [
    nixfmt
    gotools
    shfmt
    yamlfmt
    rustfmt
    jq
    taplo
    opentofu
  ];
}

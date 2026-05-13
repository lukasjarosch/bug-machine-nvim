# :snowflake: Bug Machine Nvim

My personal Neovim flake, built with [nixvim](https://github.com/nix-community/nixvim).

![dashboard](dashboard.png)

## Quickstart

```sh
nix run github:lukasjarosch/bug-machine-nvim                  # nixvim
nix run github:lukasjarosch/bug-machine-nvim#neovide          # nixvim within neovide
```

For home-manager, import `homeManagerModules.default` — it wires up the nvim config and ships the neovide wrapper plus its `.desktop` entry so rofi/fuzzel/wofi find it:

```nix
imports = [ inputs.bug-machine-nvim.homeManagerModules.default ];
```

## Layout

- `config/` — core options, keymaps, and the lua glue (`extraConfigLua`)
- `plugins/` — one file per plugin, auto-imported by `plugins/default.nix`
- `snippets/` — VS Code-format snippets (JSON)
- `lua-snippets/` — native luasnip snippets in Lua

## License

MIT. Personal config — no support, but feel free to lift bits.

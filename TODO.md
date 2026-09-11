# TODO

## Bug
- [x] ~~`nvim-dap-ui` fails to load: requires `nvim-nio`...~~ False alarm: `nvim-nio` is already pulled in automatically by nixvim's `dap-ui` module (verified via `git stash` diff of the built pack dir). The `E5113`/"requires nvim-nio" error only reproduces in a sandboxed test shell that can't write to `~/.local/state/nvim/` (nio's logger throws on init, which `dapui`'s pcall then misreports as "not installed") — not a real bug in a normal user environment.
- [ ] `nix fmt` reports `window-picker.nix` as unformatted, which fails `nix flake check`'s `pre-commit-check`. Run `nix fmt` repo-wide and commit.

## Open Questions
- [ ] Rust debugging (DAP) not set up — only `dap-go` exists in `plugins/dap.nix`. Add `codelldb` + keymaps analogous to the Go debug setup if Rust debugging is needed.
- [ ] `<leader>r` ("refactoring") which-key group (`plugins/which-key.nix`) has no keymaps bound under it yet — placeholder for a future plugin (e.g. refactoring.nvim).

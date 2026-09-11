{
  plugins.comment = {
    enable = true;
  };

  keymaps =
    let
      toggleLine = ''
        function() require('Comment.api').toggle.linewise.current() end
      '';
      toggleSelection = ''
        function()
          local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
          vim.api.nvim_feedkeys(esc, 'nx', false)
          require('Comment.api').toggle.linewise(vim.fn.visualmode())
        end
      '';
    in
    [
      {
        key = "<C-_>";
        mode = [ "n" ];
        action.__raw = toggleLine;
        options.desc = "Toggle comment (line)";
      }
      {
        key = "<C-/>";
        mode = [ "n" ];
        action.__raw = toggleLine;
        options.desc = "Toggle comment (line)";
      }
      {
        key = "<C-_>";
        mode = [ "x" ];
        action.__raw = toggleSelection;
        options.desc = "Toggle comment (selection)";
      }
      {
        key = "<C-/>";
        mode = [ "x" ];
        action.__raw = toggleSelection;
        options.desc = "Toggle comment (selection)";
      }
    ];
}

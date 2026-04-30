{ pkgs, ... }:

{
  extraPackages = [ pkgs.delve ];

  plugins = {
    dap.enable = true;
    dap-ui.enable = true;
    dap-virtual-text.enable = true;
    dap-go.enable = true;
  };

  extraConfigLua = ''
    vim.api.nvim_set_hl(0, "DapBreakpoint",          { fg = "#FF5370" })
    vim.api.nvim_set_hl(0, "DapBreakpointCondition", { fg = "#F78C6C" })
    vim.api.nvim_set_hl(0, "DapLogPoint",            { fg = "#82AAFF" })
    vim.api.nvim_set_hl(0, "DapStopped",             { fg = "#C3E88D" })
    vim.api.nvim_set_hl(0, "DapStoppedLine",         { bg = "#2D3A4A" })
    vim.api.nvim_set_hl(0, "DapBreakpointRejected",  { fg = "#FF5370" })

    vim.fn.sign_define("DapBreakpoint",          { text = "●", texthl = "DapBreakpoint",          linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
    vim.fn.sign_define("DapLogPoint",            { text = "◉", texthl = "DapLogPoint",            linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped",             { text = "▶", texthl = "DapStopped",             linehl = "DapStoppedLine", numhl = "" })
    vim.fn.sign_define("DapBreakpointRejected",  { text = "✘", texthl = "DapBreakpointRejected",  linehl = "", numhl = "" })
  '';

  keymaps = [
    {
      key = "<leader>db";
      action = "<cmd>DapToggleBreakpoint<CR>";
      mode = [ "n" ];
      options.desc = "Toggle breakpoint";
    }
    {
      key = "<leader>dc";
      action = "<cmd>DapContinue<CR>";
      mode = [ "n" ];
      options.desc = "Continue / start";
    }
    {
      key = "<leader>dn";
      action = "<cmd>DapStepOver<CR>";
      mode = [ "n" ];
      options.desc = "Next / step over";
    }
    {
      key = "<leader>ds";
      action = "<cmd>DapStepInto<CR>";
      mode = [ "n" ];
      options.desc = "Step into";
    }
    {
      key = "<leader>dS";
      action = "<cmd>DapStepOut<CR>";
      mode = [ "n" ];
      options.desc = "Step out";
    }
    {
      key = "<leader>dr";
      action = "<cmd>lua require'dap'.run_last()<CR>";
      mode = [ "n" ];
      options.desc = "Restart / run last";
    }
    {
      key = "<leader>dq";
      action = "<cmd>DapTerminate<CR>";
      mode = [ "n" ];
      options.desc = "Quit / terminate";
    }
    {
      key = "<leader>dp";
      action = "<cmd>DapToggleRepl<CR>";
      mode = [ "n" ];
      options.desc = "Print / REPL";
    }
    {
      key = "<leader>du";
      action = "<cmd>lua require'dapui'.toggle()<CR>";
      mode = [ "n" ];
      options.desc = "Toggle dap-ui";
    }
    {
      key = "<leader>dt";
      action = "<cmd>lua require'dap-go'.debug_test()<CR>";
      mode = [ "n" ];
      options.desc = "Debug nearest Go test";
    }
    {
      key = "<leader>dT";
      action = "<cmd>lua require'dap-go'.debug_last_test()<CR>";
      mode = [ "n" ];
      options.desc = "Debug last Go test";
    }
  ];
}

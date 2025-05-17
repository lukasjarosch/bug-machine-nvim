{
  keymaps = [
    # TELESCOPE ========================================
    {
      key = "<leader>ff";
      action = "<cmd>Telescope find_files<CR>";
      mode = ["n" "v"];
    }
    {
      key = "<leader>fb";
      action = "<cmd>Telescope buffers<CR>";
      mode = ["n" "v"];
    }
    {
      key = "<leader>fw";
      action = "<cmd>Telescope live_grep<CR>";
      mode = ["n" "v"];
    }
    {
      key = "<leader>fk";
      action = "<cmd>Telescope keymaps<CR>";
      mode = ["n" "v"];
    }

    # ========================================
    {
      key = "gd";
      action = "<cmd>Telescope lsp_definitions<CR>";
      mode = ["n" "v"];
    }
    {
      key = "gr";
      action = "<cmd>Telescope lsp_references<CR>";
      mode = ["n" "v"];
    }

    # ========================================
    {
      key = "<leader>c";
      action = "<cmd>bd<CR>";
      mode = ["n" "v"];
    }
    {
      key = "L";
      action = "<cmd>BufferLineCycleNext<CR>";
      mode = ["n" "v"];
    }
    {
      key = "H";
      action = "<cmd>BufferLineCyclePrev<CR>";
      mode = ["n" "v"];
    }

    # ========================================

    {
      key = "<C-h>";
      action = "<cmd>lua vim.cmd('wincmd h')<CR>";
      mode = ["n" "v"];
    }
    {
      key = "<C-l>";
      action = "<cmd>lua vim.cmd('wincmd l')<CR>";
      mode = ["n" "v"];
    }
    {
      key = "<C-j>";
      action = "<cmd>lua vim.cmd('wincmd j')<CR>";
      mode = ["n" "v"];
    }
    {
      key = "<C-k>";
      action = "<cmd>lua vim.cmd('wincmd k')<CR>";
      mode = ["n" "v"];
    }
    
    # ========================================
    {
      key = "<leader>Q";
      action = "<cmd>qa!<CR>";
      mode = ["n" "v"];
    }

    # ========================================
    {
      key = "<leader>gg";
      action = "<cmd>LazyGit<CR>";
      mode = ["n" "v"];
    }
    {
      key = "<leader>gc";
      action = "<cmd>Telescope git_commits<CR>";
      mode = ["n" "v"];
    }

    {
      key = "<leader>e";
      action = "<cmd>Neotree toggle<CR>";
      mode = ["n" "v"];
    }
    {
      key = "<leader>o";
      action = "<cmd>Neotree focus<CR>";
      mode = ["n" "v"];
    }
  ];
}

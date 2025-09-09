{
  keymaps = [
    # Start resize mode (smart-splits)
    {
      key = "<leader>wr";
      action = "<cmd>lua require('smart-splits').start_resize_mode()<CR>";
      mode = [ "n" ];
      options.desc = "Window resize mode";
    }
    # F-Keys ========================================
    {
      key = "<F5>";
      action = ":nnoremap <silent> <F5> :keeppatterns %s/\s\+$//e<CR>";
      mode = [ "n" "v" ];
      options.desc = "Trim trailing whitespace";
    }
    # SELECTION ========================================
    {
      key = "<C-A-j>";
      action = ":m .+1<CR>==";
      mode = [ "n" ];
      options.desc = "Move line down";
    }
    {
      key = "<C-A-k>";
      action = ":m .-2<CR>==";
      mode = [ "n" ];
      options.desc = "Move line up";
    }
    {
      key = "<C-A-j>";
      action = ":m '>+1<CR>gv=gv";
      mode = [ "v" ];
      options.desc = "Move selection down";
    }
    {
      key = "<C-A-k>";
      action = ":m '<-2<CR>gv=gv";
      mode = [ "v" ];
      options.desc = "Move selection up";
    }
    # TELESCOPE ========================================
    {
      key = "<leader>ff";
      action = "<cmd>Telescope find_files<CR>";
      mode = [ "n" "v" ];
    }
    {
      key = "<leader>fb";
      action = "<cmd>Telescope buffers<CR>";
      mode = [ "n" "v" ];
    }
    {
      key = "<leader>fw";
      action = "<cmd>Telescope live_grep<CR>";
      mode = [ "n" "v" ];
    }
    {
      key = "<leader>fk";
      action = "<cmd>Telescope keymaps<CR>";
      mode = [ "n" "v" ];
    }

    # GO LSP COMMANDS ========================================
    {
      key = "gd";
      action = "<cmd>lua vim.lsp.buf.definition()<CR>";
      mode = [ "n" ];
      options.desc = "Go to definition";
    }
    {
      key = "gr";
      action = "<cmd>Telescope lsp_references<CR>";
      mode = [ "n" ];
      options.desc = "Find references";
    }
    {
      key = "gI";
      action = "<cmd>lua vim.lsp.buf.implementation()<CR>";
      mode = [ "n" ];
      options.desc = "Go to implementation";
    }
    {
      key = "gt";
      action = "<cmd>lua vim.lsp.buf.type_definition()<CR>";
      mode = [ "n" ];
      options.desc = "Go to type definition";
    }
    {
      key = "K";
      action = "<cmd>lua vim.lsp.buf.hover()<CR>";
      mode = [ "n" ];
      options.desc = "Show hover documentation";
    }
    {
      key = "<leader>ca";
      action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
      mode = [ "n" "v" ];
      options.desc = "Code actions";
    }
    {
      key = "<leader>rn";
      action = "<cmd>lua vim.lsp.buf.rename()<CR>";
      mode = [ "n" ];
      options.desc = "Rename symbol";
    }
    {
      key = "<leader>ds";
      action = "<cmd>Telescope lsp_document_symbols<CR>";
      mode = [ "n" ];
      options.desc = "Document symbols";
    }
    {
      key = "<leader>ws";
      action = "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>";
      mode = [ "n" ];
      options.desc = "Workspace symbols";
    }

    # GO-SPECIFIC COMMANDS ====================================
    {
      key = "<leader>gt";
      action = "<cmd>GoTest<CR>";
      mode = [ "n" ];
      options.desc = "Run tests";
    }
    {
      key = "<leader>gtf";
      action = "<cmd>GoTestFunc<CR>";
      mode = [ "n" ];
      options.desc = "Test function under cursor";
    }
    {
      key = "<leader>gc";
      action = "<cmd>GoCoverage<CR>";
      mode = [ "n" ];
      options.desc = "Test coverage";
    }
    {
      key = "<leader>gi";
      action = "<cmd>GoImports<CR>";
      mode = [ "n" ];
      options.desc = "Organize imports";
    }
    {
      key = "<leader>gd";
      action = "<cmd>GoDoc<CR>";
      mode = [ "n" ];
      options.desc = "Show Go docs";
    }
    {
      key = "<leader>gI";
      action = "<cmd>GoImplements<CR>";
      mode = [ "n" ];
      options.desc = "Show interfaces implemented";
    }
    {
      key = "<leader>gr";
      action = "<cmd>GoRun<CR>";
      mode = [ "n" ];
      options.desc = "Run current file";
    }

    # BUFFER CONTROLS ========================================
    {
      key = "<leader>c";
      action = "<cmd>bp|bd #<CR>";
      mode = [ "n" "v" ];
      options.desc = "Close buffer but keep window open";
    }
    {
      key = "L";
      action = "<cmd>BufferLineCycleNext<CR>";
      mode = [ "n" "v" ];
    }
    {
      key = "H";
      action = "<cmd>BufferLineCyclePrev<CR>";
      mode = [ "n" "v" ];
    }

    # WINDOW NAVIGATION ========================================
    {
      key = "<C-h>";
      action = "<cmd>lua vim.cmd('wincmd h')<CR>";
      mode = [ "n" "v" ];
    }
    {
      key = "<C-l>";
      action = "<cmd>lua vim.cmd('wincmd l')<CR>";
      mode = [ "n" "v" ];
    }
    {
      key = "<C-j>";
      action = "<cmd>lua vim.cmd('wincmd j')<CR>";
      mode = [ "n" "v" ];
    }
    {
      key = "<C-k>";
      action = "<cmd>lua vim.cmd('wincmd k')<CR>";
      mode = [ "n" "v" ];
    }

    # QUIT COMMANDS ========================================
    {
      key = "<leader>Q";
      action = "<cmd>qa!<CR>";
      mode = [ "n" "v" ];
    }

    # GIT COMMANDS ========================================
    {
      key = "<leader>gg";
      action = "<cmd>LazyGit<CR>";
      mode = [ "n" "v" ];
    }
    {
      key = "<leader>gc";
      action = "<cmd>Telescope git_commits<CR>";
      mode = [ "n" "v" ];
    }

    # FILE EXPLORER ========================================
    {
      key = "<leader>e";
      action = "<cmd>Neotree toggle<CR>";
      mode = [ "n" "v" ];
    }
    {
      key = "<leader>o";
      action = "<cmd>Neotree focus<CR>";
      mode = [ "n" "v" ];
    }
  ];
}

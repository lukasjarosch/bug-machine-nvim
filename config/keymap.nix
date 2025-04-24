{
  keymaps = [
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
      action = "<cmd>Telescope grep_string<CR>";
      mode = ["n" "v"];
    }
    {
      key = "<leader>fk";
      action = "<cmd>Telescope keymaps<CR>";
      mode = ["n" "v"];
    }

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

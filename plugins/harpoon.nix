{
  plugins.harpoon = {
    enable = true;
    enableTelescope = true;
  };

  keymaps = [
    {
      key = "<leader>ba";
      action.__raw = "function() require('harpoon'):list():add() end";
      mode = [ "n" ];
      options.desc = "Add file to harpoon";
    }
    {
      key = "<leader>bb";
      action.__raw = ''
        function()
          local harpoon = require('harpoon')
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end
      '';
      mode = [ "n" ];
      options.desc = "Toggle harpoon menu";
    }
    {
      key = "<leader>bt";
      action = "<cmd>Telescope harpoon marks<CR>";
      mode = [ "n" ];
      options.desc = "Harpoon marks (telescope)";
    }
    {
      key = "<leader>bn";
      action.__raw = "function() require('harpoon'):list():next() end";
      mode = [ "n" ];
      options.desc = "Harpoon: next file";
    }
    {
      key = "<leader>bp";
      action.__raw = "function() require('harpoon'):list():prev() end";
      mode = [ "n" ];
      options.desc = "Harpoon: previous file";
    }
    {
      key = "<leader>1";
      action.__raw = "function() require('harpoon'):list():select(1) end";
      mode = [ "n" ];
      options.desc = "Harpoon: go to file 1";
    }
    {
      key = "<leader>2";
      action.__raw = "function() require('harpoon'):list():select(2) end";
      mode = [ "n" ];
      options.desc = "Harpoon: go to file 2";
    }
    {
      key = "<leader>3";
      action.__raw = "function() require('harpoon'):list():select(3) end";
      mode = [ "n" ];
      options.desc = "Harpoon: go to file 3";
    }
    {
      key = "<leader>4";
      action.__raw = "function() require('harpoon'):list():select(4) end";
      mode = [ "n" ];
      options.desc = "Harpoon: go to file 4";
    }
  ];
}

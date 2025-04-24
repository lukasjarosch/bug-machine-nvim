{
  plugins.which-key = {
    enable = true;

    settings = {
      layout = {
        height = {
          min = 10;
          max =  30;
        };
        width = {
          min = 20;
          max =  60;
        };
      };

      spec = [
        # Telescope refs
        {
          __unkeyed-1 = "<leader>f";
          group = "telescope";
          icon = "";
        }
        {
          __unkeyed-1 = "<leader>ff";
          desc = "Find files";
        }
        {
          __unkeyed-1 = "<leader>fb";
          desc = "Buffers";
        }
        {
          __unkeyed-1 = "<leader>fw";
          desc = "Find words";
        }
        {
          __unkeyed-1 = "<leader>fk";
          desc = "Find keymaps";
        }

        # Git
        {
          __unkeyed-1 = "<leader>g";
          group = "git";
          icon = "";
        }
        {
          __unkeyed-1 = "<leader>gc";
          desc = "Commits";
        }


        # Windows
        {
          __unkeyed-1 = "<leader>w";
          proxy = "<C-w>";
          group = "windows";
        }
        {
          __unkeyed-1 = "<c-w>c";
          desc = "Close current window";
        }
        {
          __unkeyed-1 = "<c-w>H";
          desc = "Move current window to the far left";
        }
        {
          __unkeyed-1 = "<c-w>J";
          desc = "Move current window to the very bottom";
        }
        {
          __unkeyed-1 = "<c-w>K";
          desc = "Move current window to the very top";
        }
        {
          __unkeyed-1 = "<c-w>L";
          desc = "Move current window to the far right";
        }

        {
          __unkeyed-1 = "<leader>b";
          group = "buffers";
        }

        {
          __unkeyed-1 = "<leader>r";
          group = "refactoring";
        }

      ];
    };
  };
}

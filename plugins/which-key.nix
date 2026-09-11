{
  plugins.which-key = {
    enable = true;

    settings = {
      layout = {
        height = {
          min = 10;
          max = 30;
        };
        width = {
          min = 20;
          max = 60;
        };
      };

      spec = [
        # Telescope refs
        {
          __unkeyed-1 = "<leader>f";
          group = "telescope";
          icon = "";
        }
        # (individual <leader>f* descriptions come from each keymap's
        # options.desc in config/keymap.nix, not from this spec)

        # Trouble
        {
          __unkeyed-1 = "<leader>x";
          group = "trouble";
          icon = "❌";
        }

        # Git
        {
          __unkeyed-1 = "<leader>g";
          group = "git";
          icon = "";
        }
        # (<leader>gc description comes from its keymap's options.desc)

        # Debugging
        {
          __unkeyed-1 = "<leader>d";
          group = "🐞 debug";
          icon = "";
        }

        # LSP
        {
          __unkeyed-1 = "<leader>l";
          group = "lsp";
          icon = "🔧";
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
          group = "harpoon";
          icon = "🔱";
        }

        {
          __unkeyed-1 = "<leader>r";
          group = "refactoring";
        }

        # AI / CodeCompanion
        {
          __unkeyed-1 = "<leader>a";
          group = "ai";
          icon = "";
        }

        # Folds (treesitter-based, see plugins/treesitter.nix)
        {
          __unkeyed-1 = "z";
          group = "folds/view";
          icon = "";
        }
        {
          __unkeyed-1 = "za";
          desc = "Toggle fold under cursor";
        }
        {
          __unkeyed-1 = "zo";
          desc = "Open fold under cursor";
        }
        {
          __unkeyed-1 = "zc";
          desc = "Close fold under cursor";
        }
        {
          __unkeyed-1 = "zA";
          desc = "Toggle fold recursively";
        }
        {
          __unkeyed-1 = "zR";
          desc = "Open all folds";
        }
        {
          __unkeyed-1 = "zM";
          desc = "Close all folds";
        }
        {
          __unkeyed-1 = "zj";
          desc = "Move to start of next fold";
        }
        {
          __unkeyed-1 = "zk";
          desc = "Move to end of previous fold";
        }
        {
          __unkeyed-1 = "zz";
          desc = "Center cursor line on screen";
        }
        {
          __unkeyed-1 = "zt";
          desc = "Scroll cursor line to top";
        }
        {
          __unkeyed-1 = "zb";
          desc = "Scroll cursor line to bottom";
        }

      ];
    };
  };
}

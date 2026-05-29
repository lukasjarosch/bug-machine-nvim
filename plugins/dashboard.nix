{
  plugins.dashboard = {
    enable = true;
    settings = {
      change_to_vcs_root = true;
      config = {
        footer = [
          ""
          "If it compiles, ship it!"
        ];
        header = [
          "██████╗ ██╗   ██╗ ██████╗       ███╗   ███╗ █████╗  ██████╗██╗  ██╗██╗███╗   ██╗███████╗"
          "██╔══██╗██║   ██║██╔════╝       ████╗ ████║██╔══██╗██╔════╝██║  ██║██║████╗  ██║██╔════╝"
          "██████╔╝██║   ██║██║  ███╗█████╗██╔████╔██║███████║██║     ███████║██║██╔██╗ ██║█████╗  "
          "██╔══██╗██║   ██║██║   ██║╚════╝██║╚██╔╝██║██╔══██║██║     ██╔══██║██║██║╚██╗██║██╔══╝  "
          "██████╔╝╚██████╔╝╚██████╔╝      ██║ ╚═╝ ██║██║  ██║╚██████╗██║  ██║██║██║ ╚████║███████╗"
          "╚═════╝  ╚═════╝  ╚═════╝       ╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝╚══════╝"
          "                                                                                       "
          "                       🐞 Where bugs come to meet their maker 🐞                       "
          "                                                                                       "
        ];
        mru = {
          limit = 10;
        };
        project = {
          enable = true;
          action.__raw = ''
            function(path)
              vim.cmd('cd ' .. path)
              vim.cmd('Neotree reveal')
              vim.cmd('wincmd p')
            end
          '';
        };
        packages = {
          enable = false;
        };
        shortcut = [
          {
            action = {
              __raw = "function(path) vim.cmd('Telescope find_files') end";
            };
            desc = " Files";
            group = "Files";
            icon = " ";
            icon_hl = "@variable";
            key = "f";
          }
          {
            action = {
              __raw = "function() vim.cmd('Telescope live_grep') end";
            };
            desc = " Find Text";
            group = "Files";
            icon = " ";
            icon_hl = "@variable";
            key = "g";
          }
          {
            action = {
              __raw = "function() vim.cmd('Telescope oldfiles') end";
            };
            desc = "󰑙 Recent";
            group = "Files";
            icon = " ";
            icon_hl = "@variable";
            key = "r";
          }
          {
            action = {
              __raw = "function() vim.cmd('LazyGit') end";
            };
            desc = " Git";
            group = "Dev";
            icon = " ";
            icon_hl = "@variable";
            key = "G";
          }
        ];
        week_header = {
          enable = false;
        };
      };
      theme = "hyper";

    };
  };

  # Add extra configuration for dashboard in Lua format
  extraConfigLua = ''
    -- Additional customization for dashboard colors
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "dashboard",
      callback = function()
      -- Dashboard header and footer colors
      vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#ebc275" })  -- Gold
      vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#FF5D62" })  -- Reddish color for footer

      -- Dashboard action buttons colors (Files, Find Text, etc)
      vim.api.nvim_set_hl(0, "DashboardKey", { fg = "#7DCFFF" })     -- Blue for keys like [f]
      vim.api.nvim_set_hl(0, "DashboardIcon", { fg = "#7DCFFF" })    -- Blue for icons
      vim.api.nvim_set_hl(0, "DashboardDesc", { fg = "#BB9AF7" })    -- Purple for descriptions
      vim.api.nvim_set_hl(0, "DashboardShortcut", { fg = "#7DCFFF" }) -- Blue for shortcut text

      -- MRU and Project section colors
      vim.api.nvim_set_hl(0, "DashboardProjectTitle", { fg = "#FF9E64" }) -- Orange for project title
      vim.api.nvim_set_hl(0, "DashboardMruTitle", { fg = "#FF9E64" })    -- Orange for MRU title
      vim.api.nvim_set_hl(0, "DashboardFiles", { fg = "#9ECE6A" })       -- Green for file paths
      vim.api.nvim_set_hl(0, "DashboardProjectIcon", { fg = "#7DCFFF" }) -- Blue for project icons
      vim.api.nvim_set_hl(0, "DashboardMruIcon", { fg = "#7DCFFF" })     -- Blue for MRU icons

      -- Customize line numbers/indicators
      vim.api.nvim_set_hl(0, "DashboardProjectTitleIcon", { fg = "#E0AF68" })
      vim.api.nvim_set_hl(0, "DashboardMruTitleIcon", { fg = "#E0AF68" })
      vim.api.nvim_set_hl(0, "DashboardShortCutIcon", { fg = "#E0AF68" })
      end
    })
  '';
}

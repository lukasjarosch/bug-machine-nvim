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
          limit = 15;
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
    -- Refresh the dashboard project cache on startup.
    -- Upstream only writes the cache on VimLeavePre from active LSP root_dirs,
    -- so projects without an LSP (or sessions that don't exit cleanly) never
    -- show up. This adds the current VCS root on every start instead.
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        vim.schedule(function()
          local cwd = vim.fn.getcwd()
          local git_marker = vim.fs.find({ ".git" }, { upward = true, path = cwd })[1]
          if not git_marker then
            return
          end
          local project = vim.fs.dirname(git_marker)

          local cache_dir = vim.fn.stdpath("cache") .. "/dashboard"
          local cache_path = cache_dir .. "/cache"
          vim.fn.mkdir(cache_dir, "p")

          local plist = {}
          local fd = io.open(cache_path, "r")
          if fd then
            local data = fd:read("*a")
            fd:close()
            local ok, chunk = pcall(loadstring, data or "")
            if ok and chunk then
              for _, p in ipairs(chunk() or {}) do
                if p ~= project then
                  table.insert(plist, p)
                end
              end
            end
          end
          table.insert(plist, project)

          local out = io.open(cache_path, "w")
          if out then
            out:write("return " .. vim.inspect(plist))
            out:close()
          end
        end)
      end,
    })

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

{
  imports = [ ./keymap.nix ./options.nix ../plugins ];


  colorschemes.onedark.enable = true;
  colorschemes.onedark.settings.style = "cool";


  diagnostics = {
    virtual_text = {
      spacing = 4; # Number of spaces between virtual text and the line
      source = "always"; # Show source of diagnostic
      prefix = "●"; # Prefix for virtual text
    };
    signs = {
      severity_sort = true; # Sort by severity
      enable = true; # Make sure signs are enabled
    };
    underline = {
      enable = true;
    };
    float = {
      enable = true;
      border = "rounded"; # Abgerundete Ränder
      source = "always"; # Quelle der Diagnose anzeigen
      header = "Diagnose";
      prefix = "";
    };
  };

  extraConfigLua = ''
    -- Format on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = {"*.go", "*.rs", "*.sh", "*.bash", "*.nix"},
      callback = function() vim.lsp.buf.format({async = false}) end,
    })

    -- Make trailing spaces more visible with a custom highlighting
    vim.api.nvim_set_hl(0, "TrailingWhitespace", { bg = "#FF5370", fg = "#FFFFFF" })

    -- Create match for trailing whitespace with custom highlighting
    -- but exclude certain filetypes where it doesn't make sense
    vim.api.nvim_create_autocmd({"BufWinEnter", "FileType"}, {
      pattern = "*",
      callback = function()
        local ft = vim.bo.filetype
        -- If it's the dasboard, remove all matches
        if ft == "dashboard" then
          for _, match_id in ipairs(vim.fn.getmatches()) do
            if match_id.group == "TrailingWhitespace" then
              vim.fn.matchdelete(match_id.id)
            end
          end
          return
        end

        local ignore_ft = {
          "dashboard",
          "alpha",
          "startify",
          "NvimTree",
          "neo-tree",
          "lazy",
          "help",
          "TelescopePrompt",
          "TelescopeResults",
          "lspinfo",
          "mason",
          "toggleterm",
          "qf", -- quickfix window
          "checkhealth",
          "aerial",
          "noice",
          "notify",
          "nui",
        }

        local ignore_bt = {
          "nofile",
          "prompt",
          "popup",
          "noice",
          "notify"
        }

        local buftype = vim.bo.buftype

        -- check if the current filetype needs to be ignored
        for _, ignored in ipairs(ignore_ft) do
          if ft == ignored then
            return
          end
        end

        -- check if the current buftype should be ignored
        for _, ignored in ipairs(ignore_bt) do
          if buftype == ignored then
            return
          end
        end

        -- remove existing matches to prevent duplicates
        for _, match_id in ipairs(vim.fn.getmatches()) do
          if match_id.group == "TrailingWhitespace" then
            vim.fn.matchdelete(match_id.id)
          end
        end

          -- new match
        vim.fn.matchadd("TrailingWhitespace", "\\s\\+$")
      end
    })

    -- Set diagnostic signs to icons
    vim.diagnostic.config({
      signs = {
        text = {
          -- Klammern sind normaler Lua-Code
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN]  = "",
          [vim.diagnostic.severity.INFO]  = "",
          [vim.diagnostic.severity.HINT]  = "",
        },
      },
    })
  '';
}

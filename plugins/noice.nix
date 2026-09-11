{
  plugins.noice = {
    enable = true;

    settings = {
      lsp = {
        override = {
          "vim.lsp.util.convert_input_to_markdown_lines" = true;
          "vim.lsp.util.stylize_markdown" = true;
          "cmp.entry.get_documentation" = true;
        };

        hover.enabled = true;
        signature.enabled = true;
        message.enabled = true;
      };

      presets = {
        bottom_search = true;
        command_palette = false;
        long_message_to_split = true;
        inc_rename = false;
        lsp_doc_border = true;
      };

      cmdline = {
        enabled = true;
        view = "cmdline";
        format = {
          input = {
            view = "cmdline_popup";
          };
        };
      };

      messages = {
        enabled = true;
        view = "mini";
      };

      notify = {
        enabled = true;
        view = "mini";
      };

      views = {
        cmdline_popup = {
          border = {
            style = "rounded";
          };
          filter_options = { };
          win_options = {
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder";
          };
        };
      };
    };
  };

  plugins.notify = {
    enable = true;
    settings = {
      backgroundColour = "#000000";
      maxWidth = 100;
      maxHeight = 40;
      stages = "fade";
    };
  };
}

{
  plugins.dashboard = {
    enable = true;
    settings = {
      change_to_vcs_root = true;
      config = {
        footer = [
          "Chaos, made with ❤️"
        ];
        header = [
        "██████╗ ██╗   ██╗ ██████╗       ███╗   ███╗ █████╗  ██████╗██╗  ██╗██╗███╗   ██╗███████╗"
        "██╔══██╗██║   ██║██╔════╝       ████╗ ████║██╔══██╗██╔════╝██║  ██║██║████╗  ██║██╔════╝"
        "██████╔╝██║   ██║██║  ███╗█████╗██╔████╔██║███████║██║     ███████║██║██╔██╗ ██║█████╗  "
        "██╔══██╗██║   ██║██║   ██║╚════╝██║╚██╔╝██║██╔══██║██║     ██╔══██║██║██║╚██╗██║██╔══╝  "
        "██████╔╝╚██████╔╝╚██████╔╝      ██║ ╚═╝ ██║██║  ██║╚██████╗██║  ██║██║██║ ╚████║███████╗"
        "╚═════╝  ╚═════╝  ╚═════╝       ╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝╚══════╝"
        ];
        mru = {
          limit = 10;
        };
        project = {
          enable = true;
        };
        packages = {
          enable = false;
        };
        shortcut = [
          {
            action = {
              __raw = "function(path) vim.cmd('Telescope find_files') end";
            };
            desc = "Files";
            group = "Label";
            icon = " ";
            icon_hl = "@variable";
            key = "f";
          }
        ];
        week_header = {
          enable = false;
        };
      };
      theme = "hyper";
    };
  };
}

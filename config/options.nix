{
  globals = {
    mapleader = " ";
    maplocalleader = ",";

    # Neovide-only knobs (terminal nvim ignores them). Tweak to taste.
    neovide_floating_corner_radius = 0.4;
    neovide_floating_shadow = true;
    neovide_floating_blur_amount_x = 2.0;
    neovide_floating_blur_amount_y = 2.0;
    neovide_padding_top = 8;
    neovide_padding_bottom = 8;
    neovide_padding_left = 8;
    neovide_padding_right = 8;
    neovide_cursor_animation_length = 5.0e-2;
    neovide_cursor_trail_size = 0.2;
    neovide_scroll_animation_length = 0.2;
  };

  opts = {
    switchbuf = "useopen,uselast";
    termguicolors = true;
    scrolloff = 8;
    swapfile = false;

    ignorecase = true;
    smartcase = true;
    tabstop = 4;
    softtabstop = 4;
    shiftwidth = 4;
    expandtab = true;
    cursorline = true;
    number = true;
    relativenumber = true;
    numberwidth = 3;
    ruler = false;
    showmode = false;
    hlsearch = true;
    incsearch = true;

    updatetime = 100;
    timeout = true;
    timeoutlen = 350;

    # Enable display of special characters
    list = true;

    # Define special character representations
    listchars = {
      # Show trailing spaces as dots
      trail = "·";
      # Show tabs as ›···
      tab = "›·";
      # Show non-breaking spaces with a special symbol
      nbsp = "␣";
      # Show line extending beyond screen with a symbol
      extends = "»";
      # Show line coming from left with a symbol
      precedes = "«";
    };

    signcolumn = "yes";

    guifont = "FiraCode Nerd Font:h12";
  };
}

{
  globals = {
    mapleader = " ";
    maplocalleader = ",";
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

    guifont = "FiraCode Nerd Font:h10";
  };
}

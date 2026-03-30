{
  programs.nixvim.opts = {
    number = true;
    relativenumber = true;

    tabstop = 2;
    softtabstop = 2;
    shiftwidth = 2;
    expandtab = true;

    smartindent = true;
    wrap = false;

    swapfile = false;
    backup = false;
    undofile = true;

    hlsearch = true;
    incsearch = true;

    termguicolors = true;

    scrolloff = 8;
    sidescrolloff = 8;

    updatetime = 50;

    clipboard = "unnamedplus";

    splitbelow = true;
    splitright = true;
  };
}

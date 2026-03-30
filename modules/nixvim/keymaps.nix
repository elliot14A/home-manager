{
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
      options.desc = "Go to left window";
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
      options.desc = "Go to lower window";
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
      options.desc = "Go to upper window";
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
      options.desc = "Go to right window";
    }

    {
      mode = "n";
      key = "<C-Up>";
      action = ":resize -2<CR>";
      options.desc = "Resize window up";
    }
    {
      mode = "n";
      key = "<C-Down>";
      action = ":resize +2<CR>";
      options.desc = "Resize window down";
    }
    {
      mode = "n";
      key = "<C-Left>";
      action = ":vertical resize -2<CR>";
      options.desc = "Resize window left";
    }
    {
      mode = "n";
      key = "<C-Right>";
      action = ":vertical resize +2<CR>";
      options.desc = "Resize window right";
    }

    {
      mode = "n";
      key = "<leader>|";
      action = ":vsplit<CR>";
      options.desc = "Vertical split";
    }
    {
      mode = "n";
      key = "<leader>-";
      action = ":split<CR>";
      options.desc = "Horizontal split";
    }
    {
      mode = "n";
      key = "<leader>wd";
      action = "<C-w>c";
      options.desc = "Close window";
    }

    {
      mode = "n";
      key = "<S-l>";
      action = ":bnext<CR>";
      options.desc = "Next buffer";
    }
    {
      mode = "n";
      key = "<S-h>";
      action = ":bprevious<CR>";
      options.desc = "Previous buffer";
    }
    {
      mode = "n";
      key = "<S-q>";
      action = ":bdelete!<CR>";
      options.desc = "Close buffer";
    }
    {
      mode = "n";
      key = "<leader>bd";
      action = ":bdelete<CR>";
      options.desc = "Delete buffer";
    }

    {
      mode = "n";
      key = "<leader>bb";
      action = ":e #<CR>";
      options.desc = "Switch to other buffer";
    }
    {
      mode = "n";
      key = "<leader>`";
      action = ":e #<CR>";
      options.desc = "Switch to other buffer";
    }

    {
      mode = "v";
      key = "J";
      action = ":m '>+1<CR>gv=gv";
      options.desc = "Move selected line down";
    }
    {
      mode = "v";
      key = "K";
      action = ":m '<-2<CR>gv=gv";
      options.desc = "Move selected line up";
    }

    {
      mode = "n";
      key = "<Esc>";
      action = ":nohlsearch<CR>";
      options.desc = "Clear highlights";
    }

    {
      mode = "v";
      key = "<";
      action = "<gv";
    }
    {
      mode = "v";
      key = ">";
      action = ">gv";
    }
  ];
}

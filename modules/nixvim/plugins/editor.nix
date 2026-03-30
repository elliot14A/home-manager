{
  programs.nixvim.plugins = {
    neo-tree = {
      enable = true;
      settings = {
        window = {
          position = "right";
          width = 30;
          auto_expand_width = true;
          mappings = {
            "G" = "grep_in_directory";
          };
        };
        commands = {
          grep_in_directory = {
            __raw = ''
              function(state)
                local node = state.tree:get_node()
                local path = node:get_id()
                if node.type ~= "directory" then
                  path = node:get_parent_id()
                end
                require("telescope.builtin").live_grep({
                  search_dirs = { path },
                  prompt_title = "Grep in " .. path,
                })
              end
            '';
          };
        };
        filesystem = {
          filtered_items = {
            visible = true;
            hide_dotfiles = false;
            hide_gitignored = false;
          };
          follow_current_file = {
            enabled = true;
          };
        };
      };
    };

    treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
        ensure_installed = [
          "bash"
          "c"
          "diff"
          "html"
          "javascript"
          "jsdoc"
          "json"
          "jsonc"
          "lua"
          "luadoc"
          "luap"
          "markdown"
          "markdown_inline"
          "nix"
          "python"
          "query"
          "regex"
          "rust"
          "toml"
          "tsx"
          "typescript"
          "vim"
          "vimdoc"
          "yaml"
        ];
      };
    };

    gitsigns = {
      enable = true;
      settings = {
        current_line_blame = true;
        signs = {
          add = {
            text = "+";
          };
          change = {
            text = "~";
          };
          delete = {
            text = "_";
          };
          topdelete = {
            text = "‾";
          };
          changedelete = {
            text = "~";
          };
        };
      };
    };

    todo-comments = {
      enable = true;
      settings = {
        signs = true;
      };
    };

    comment = {
      enable = true;
      settings = {
        sticky = true;
      };
    };

    nvim-autopairs = {
      enable = true;
    };

    harpoon = {
      enable = true;
    };

    illuminate = {
      enable = true;
      settings = {
        delay = 200;
        under_cursor = false;
      };
    };

    telescope = {
      enable = true;
      extensions = {
        fzf-native.enable = true;
      };
      keymaps = {
        "<leader>ff" = {
          action = "find_files";
          options.desc = "Find files";
        };
        "<leader>fg" = {
          action = "live_grep";
          options.desc = "Live grep";
        };
        "<leader>fw" = {
          action = "grep_string";
          options.desc = "Grep word under cursor";
        };
        "<leader>fb" = {
          action = "buffers";
          options.desc = "Find buffers";
        };
        "<leader>fh" = {
          action = "help_tags";
          options.desc = "Help tags";
        };
      };
    };

    flash = {
      enable = true;
      settings = {
        search = {
          mode = "fuzzy";
        };
        jump = {
          inclusive = false;
        };
      };
    };

    toggleterm = {
      enable = true;
      settings = {
        direction = "float";
        float_opts = {
          border = "curved";
        };
      };
    };
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = ":Neotree toggle<CR>";
      options.desc = "Toggle file explorer";
    }
    {
      mode = [
        "n"
        "t"
      ];
      key = "<C-\\>";
      action = "<cmd>ToggleTerm<cr>";
      options.desc = "Toggle terminal";
    }
    {
      mode = "n";
      key = "<leader>th";
      action = "<cmd>ToggleTerm direction=horizontal<cr>";
      options.desc = "Toggle horizontal terminal";
    }
    {
      mode = "n";
      key = "<leader>tv";
      action = "<cmd>ToggleTerm direction=vertical<cr>";
      options.desc = "Toggle vertical terminal";
    }

    {
      mode = [
        "n"
        "x"
        "o"
      ];
      key = "s";
      action.__raw = "function() require('flash').jump() end";
      options.desc = "Flash";
    }
    {
      mode = [
        "n"
        "x"
        "o"
      ];
      key = "S";
      action.__raw = "function() require('flash').treesitter() end";
      options.desc = "Flash Treesitter";
    }
    {
      mode = "o";
      key = "r";
      action.__raw = "function() require('flash').remote() end";
      options.desc = "Remote Flash";
    }
    {
      mode = [
        "o"
        "x"
      ];
      key = "R";
      action.__raw = "function() require('flash').treesitter_search() end";
      options.desc = "Treesitter Search";
    }
    {
      mode = "c";
      key = "<C-s>";
      action.__raw = "function() require('flash').toggle() end";
      options.desc = "Toggle Flash Search";
    }
    {
      mode = "n";
      key = "<leader>a";
      action.__raw = "function() require'harpoon':list():add() end";
      options.desc = "Harpoon add file";
    }
    {
      mode = "n";
      key = "<leader>h";
      action.__raw = "function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end";
      options.desc = "Harpoon toggle menu";
    }
    {
      mode = "n";
      key = "<leader>1";
      action.__raw = "function() require'harpoon':list():select(1) end";
      options.desc = "Harpoon file 1";
    }
    {
      mode = "n";
      key = "<leader>2";
      action.__raw = "function() require'harpoon':list():select(2) end";
      options.desc = "Harpoon file 2";
    }
    {
      mode = "n";
      key = "<leader>3";
      action.__raw = "function() require'harpoon':list():select(3) end";
      options.desc = "Harpoon file 3";
    }
    {
      mode = "n";
      key = "<leader>4";
      action.__raw = "function() require'harpoon':list():select(4) end";
      options.desc = "Harpoon file 4";
    }
  ];
}

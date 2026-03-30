{ pkgs, ... }:
{
  programs.nixvim = {
    colorschemes.rose-pine = {
      enable = true;
      settings = {
        style = "main"; # options: main, moon, dawn
        transparent_background = true;
        transparent_float = true;
      };
    };

    plugins = {
      lualine = {
        enable = true;
        settings = {
          options = {
            theme = "rose-pine";
            globalstatus = true;
            component_separators = {
              left = "|";
              right = "|";
            };
            section_separators = {
              left = "";
              right = "";
            };
          };
        };
      };

      noice = {
        enable = true;
        settings = {
          notify = {
            enabled = false;
            view = "notify";
          };
          messages = {
            enabled = true;
            view = "mini";
            view_error = "mini";
            view_warn = "mini";
          };
          lsp = {
            message = {
              enabled = true;
            };
            progress = {
              enabled = true;
              view = "mini";
            };
            override = {
              "vim.lsp.util.convert_input_to_markdown_lines" = true;
              "vim.lsp.util.stylize_markdown" = true;
              "cmp.entry.get_documentation" = true;
            };
            signature = {
              enabled = false;
            };
          };
          presets = {
            bottom_search = true;
            command_palette = true;
            long_message_to_split = true;
            inc_rename = false;
            lsp_doc_border = false;
          };
        };
      };

      dressing = {
        enable = true;
        settings = {
          input = {
            enabled = true;
            mappings = {
              n = {
                "<Esc>" = "Close";
                "<CR>" = "Confirm";
              };
              i = {
                "<C-c>" = "Close";
                "<CR>" = "Confirm";
                "<Up>" = "HistoryPrev";
                "<Down>" = "HistoryNext";
              };
            };
          };
          select = {
            enabled = true;
            backend = [
              "telescope"
              "builtin"
            ];
            builtin = {
              relative = "cursor";
            };
          };
        };
      };

      notify = {
        enable = true;
        settings = {
          background_colour = "#000000";
        };
      };

      indent-blankline = {
        enable = true;
        settings = {
          indent = {
            char = "│";
          };
          scope = {
            enabled = true;
            show_start = false;
            show_end = false;
          };
        };
      };

      web-devicons.enable = true;
    };
  };
}

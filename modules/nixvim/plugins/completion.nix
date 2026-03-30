{ pkgs, ... }:
{
  programs.nixvim = {
    plugins.blink-cmp = {
      enable = true;
      settings = {
        appearance = {
          nerd_font_variant = "mono";
          use_nvim_cmp_as_default = true;
        };
        completion = {
          accept = {
            auto_brackets = {
              enabled = true;
            };
          };
          documentation = {
            auto_show = true;
            auto_show_delay_ms = 200;
          };
          menu = {
            draw = {
              columns = [
                {
                  __unkeyed-1 = "label";
                }
                {
                  __unkeyed-1 = "kind_icon";
                  gap = 1;
                }
                {
                  __unkeyed-1 = "kind";
                  gap = 1;
                }
              ];
            };
          };
        };
        keymap = {
          preset = "default";
          "<Tab>" = [
            "select_and_accept"
            "snippet_forward"
            "fallback"
          ];
          "<S-Tab>" = [
            "select_prev"
            "snippet_backward"
            "fallback"
          ];
        };
        sources = {
          default = [
            "lsp"
            "path"
            "snippets"
            "buffer"
          ];
        };
      };
    };
  };
}

{ pkgs, ... }:
{
  programs.nixvim = {
    diagnostics = {
      virtual_text = true;
      underline = true;
      severity_sort = true;
      update_in_insert = false;
    };

    plugins = {
      lsp = {
        enable = true;
        diagnostics = {
          virtual_text = true;
        };
        servers = {
          rust_analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
          nixd = {
            enable = true;
          };
          gopls = {
            enable = true;
          };
          ts_ls = {
            enable = true;
          };
          html.enable = true;
          cssls.enable = true;
          tailwindcss.enable = true;
          pyright.enable = true;
          taplo.enable = true;
        };
        keymaps = {
          silent = true;
          diagnostic = {
            "<leader>j" = "goto_next";
            "<leader>k" = "goto_prev";
            "<leader>ld" = "open_float";
          };
          lspBuf = {
            gd = "definition";
            gD = "declaration";
            K = "hover";
            gi = "implementation";
            "<C-k>" = "signature_help";
            "<leader>lr" = "rename";
            "<leader>la" = "code_action";
            gr = "references";
          };
        };
      };

      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            lsp_fallback = true;
            timeout_ms = 500;
          };
          formatters_by_ft = {
            lua = [ "stylua" ];
            nix = [ "nixfmt" ];
            javascript = [ "prettier" ];
            typescript = [ "prettier" ];
            javascriptreact = [ "prettier" ];
            typescriptreact = [ "prettier" ];
            json = [ "prettier" ];
            html = [ "prettier" ];
            css = [ "prettier" ];
            python = [ "black" ];
            rust = [ "rustfmt" ];
          };
        };
      };

      lint = {
        enable = true;
        lintersByFt = {
          javascript = [ "eslint_d" ];
          typescript = [ "eslint_d" ];
          python = [ "ruff" ];
          nix = [ "nix" ];
        };
      };
    };
  };
}

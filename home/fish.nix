{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set -g fish_greeting ""

      set -gx EDITOR nvim
      set -gx VISUAL nvim
      set -gx TERM xterm-256color

      fish_add_path $HOME/.local/bin
      fish_add_path $HOME/.cargo/bin
      fish_add_path $HOME/.pulumi/bin
      fish_add_path $HOME/.ghcup/bin

      if type -q starship
          starship init fish | source
      end

      if type -q fzf
          set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
          set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
          set -gx FZF_ALT_C_COMMAND 'fd --type d --hidden --follow --exclude .git'
      end
    '';

    shellAliases = {
      l = "eza -la";
      ll = "eza -l";
      ls = "eza";
      cat = "bat";
      ".." = "cd ..";
      "..." = "cd ../..";

      v = "nvim";
      vim = "nvim";

      z = "zellij";
      za = "z attach";
      znew = "z -s";

      kiwi-kube = "kubectl --kubeconfig=$HOME/.pulumi/k3s/config";
      kiwi-k9s = "KUBECONFIG=$HOME/.pulumi/k3s/config k9s";

      windsurf = "~/Downloads/Windsurf/bin/windsurf";
    };

    plugins = [
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair-fish.src;
      }
      {
        name = "fzf";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
    ];

    functions = {
      fish_user_key_bindings = ''
        fish_vi_key_bindings
        bind -M default v edit_command_buffer
      '';
    };
  };
}

{
  pkgs,
  inputs,
  ...
}:

{
  home = {
    username = "kiwi";
    homeDirectory = "/home/kiwi";
    stateVersion = "25.11";
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = [ "app.zen_browser.zen.desktop" ];
      "application/xhtml+xml" = [ "app.zen_browser.zen.desktop" ];
      "x-scheme-handler/http" = [ "app.zen_browser.zen.desktop" ];
      "x-scheme-handler/https" = [ "app.zen_browser.zen.desktop" ];
      "x-scheme-handler/about" = [ "app.zen_browser.zen.desktop" ];
      "x-scheme-handler/unknown" = [ "app.zen_browser.zen.desktop" ];
    };
  };

  programs.home-manager.enable = true;

  dconf.enable = true;

  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "akshithkatkuri14@gmail.com";
        name = "elliot14A@nixos";
      };
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "*" = {
        serverAliveInterval = 60;
        serverAliveCountMax = 3;
      };
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/github_ed25519";
        identitiesOnly = true;
      };
      "gaur-stag" = {
        hostname = "178.104.228.8";
        user = "root";
        identityFile = "~/.ssh/gaur-deployments/gaur_hetzner_ed25519";
        identitiesOnly = true;
      };
    };
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "rose-pine";
      theme_background = true;
      truecolor = true;
    };
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };
}

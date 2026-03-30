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

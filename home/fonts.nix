{ pkgs, ... }:
{
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      sansSerif = [
        "Inter"
        "Noto Sans"
      ];
      serif = [ "Noto Serif" ];
      monospace = [ "JetBrainsMono Nerd Font" ];
    };
  };

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    inter
  ];
}

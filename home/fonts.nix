{ pkgs, ... }:
{
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      sansSerif = [
        "Geist"
      ];
      serif = [ "Geist" ];
      monospace = [ "JetBrains Mono" ];
    };
  };

  home.packages = with pkgs; [
    geist-font
    jetbrains-mono
  ];
}

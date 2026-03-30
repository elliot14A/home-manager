{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.flatpaks.homeModules.default
  ];

  services.flatpak = {
    enable = true;
    remotes = {
      "flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    };
    packages = [
      "flathub:app/io.github.zen_browser.zen//stable"
      "flathub:app/com.google.Chrome//stable"
    ];
  };
}

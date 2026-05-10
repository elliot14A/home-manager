{
  xdg.enable = true;

  xdg.configFile = {
    "starship.toml".source = ../config/starship/rose-pine.starship.toml;
    "eza/theme.yml".source = ../config/eza/eza.main.yml;
    "btop/themes/rose-pine.theme".source = ../config/btop/rose-pine.theme;
    "fastfetch/config.jsonc".source = ../config/fastfetch/main.fastfetch;
    "opencode/opencode.json".source = ../config/opencode/opencode.json;
    "zellij/config.kdl".source = ../config/zellij/config.kdl;
    "alacritty/alacritty.toml" = {
      source = ../config/alacritty/alacritty.toml;
      force = true;
    };
    "niri" = {
      source = ../config/niri;
      recursive = true;
      force = true;
    };
  };
}

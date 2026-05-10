{ pkgs, ... }:
{
  systemd.user.services.cliphist-text = {
    Unit = {
      Description = "Cliphist: watch text clipboard";
      After = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.wl-clipboard}/bin/wl-paste --type text --watch ${pkgs.cliphist}/bin/cliphist store";
      Restart = "on-failure";
      RestartSec = 1;
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };

  systemd.user.services.cliphist-image = {
    Unit = {
      Description = "Cliphist: watch image clipboard";
      After = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.wl-clipboard}/bin/wl-paste --type image/png --watch ${pkgs.cliphist}/bin/cliphist store";
      Restart = "on-failure";
      RestartSec = 1;
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };

  systemd.user.services.clipwatch-images = {
    Unit = {
      Description = "Watch clipboard images into /tmp";
      After = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "%h/.local/bin/clipwatch-images";
      Restart = "on-failure";
      RestartSec = 2;
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}

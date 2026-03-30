{
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

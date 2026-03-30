{
  home.file.".local/bin/clipwatch-images" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash
      set -euo pipefail

      umask 077

      wl-paste --watch --type image/png --foreground -- sh -c '
        ts=$(date +%Y%m%d-%H%M%S)
        file="/tmp/clipboard-''${ts}.png"
        cat > "$file"
        ln -sf "$file" /tmp/clipboard-latest.png
      '
    '';
  };
}

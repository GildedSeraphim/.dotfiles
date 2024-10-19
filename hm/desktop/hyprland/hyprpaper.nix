{ config, ... }:
let
  wal = config.stylix.image;
in
{
    services.hyprpaper = {
        enable = true;
        settings = {
            ipc = "on";
            splash = false;
            preload = [ "${wal}" ];
            wallpaper = [
                ",${wal}"
            ];
        };
    };
}

{...}: {
  imports = [
    ./hyprland
    ./bar
    ./hyprlock
    #    ./rofi
    ./ags
    ./xdg
    ./test
    ./eww
    ./swaync
  ];
  opt.services.ags.enable = false;
  opt.services.eww.enable = false;
  opt.services.waybar.enable = true;
  opt.services.swaync.enable = true;
  opt.lock.hyprlock.enable = true;
}

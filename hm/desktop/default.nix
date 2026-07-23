{ ... }:
{
  imports = [
    ./hyprland
    ./bar
    ./hyprlock
    ./ags
    ./xdg
    ./test
    ./eww
    ./swaync
  ];
  opt.services.ags.enable = false;
  opt.services.eww.enable = false;
  opt.services.waybar.enable = true;
  opt.services.swaync.enable = false;
  opt.lock.hyprlock.enable = true;
}

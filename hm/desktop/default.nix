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
  ];
  opt.services.ags.enable = false;
  opt.services.eww.enable = false;
  opt.services.waybar.enable = true;
}

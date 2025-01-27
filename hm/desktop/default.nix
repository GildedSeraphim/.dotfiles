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
  opt.services.ags.enable = true;
  opt.services.eww.enable = false;
}

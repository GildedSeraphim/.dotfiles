{...}: {
  imports = [
    ./hyprland
    ./bar
    ./hyprlock
    #    ./rofi
    ./ags
    ./xdg
    ./test
    # ./eww
  ];
  opt.services.ags.enable = true;
}

{ pkgs, ... }:

{
  home.packages = with pkgs; [
    dart-sass
    fd
    bluez-tools
    brightnessctl
    gnome.gnome-bluetooth
    python312Packages.gpustat
    grimblast
    gpu-screen-recorder
    hyprpicker
    matugen
    wl-clipboard
    dolphin
  ];


}

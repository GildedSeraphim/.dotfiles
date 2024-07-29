{pkgs, lib, inputs, pkgs-unstable, ...}: 
{
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs-unstable.system}".hyprland;
    xwayland.enable = true;
  };
}

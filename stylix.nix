{
  pkgs,
  config,
  nix-colors,
  inputs,
  ...
}:
let
  theme = "ayu-dark";
  th = "${pkgs.base16-schemes}/share/themes/${theme}.yaml";
  #alterfile = ./wal/color.txt;
  wallpaper = ./wal/branch.png;
  #altered-wallpaper = pkgs.runCommand "altered.png" {} ''
  #${pkgs.imagemagick}/bin/magick convert ${wallpaper} -colorspace sRGB -color-matrix < ${alterfile} altered.png $out
  #'';
in
{
  imports = [
    nix-colors.homeManagerModules.default
  ];

  stylix.enable = true;

  stylix.base16Scheme = "${th}";

  stylix.image = wallpaper;

  stylix.cursor.package = pkgs.banana-cursor;
  stylix.cursor.name = "Banana Red";
  stylix.cursor.size = 25;

  stylix.override = {
    base00 = "#1d2433";
    base01 = "#1a202e";
    base02 = "#171c29";
    base03 = "#293145";
    base04 = "#bfd3ff";
    base05 = "#54678c";
    base06 = "#3d4a66";
    base07 = "#8FBCBB";
    base08 = "#D0879D";
    base09 = "#D0B1A2";
    base0A = "#CDD2AF";
    base0B = "#9FD6B6";
    base0C = "#acd9ec";
    base0D = "#92b7ea";
    base0E = "#AD9BEA";
    base0F = "#CD9BCC";
  };

  stylix.fonts = {
    sizes.terminal = 13;
    monospace = {
      name = "IBM Plex Mono";
      package = pkgs.ibm-plex;
    };
    sansSerif = {
      name = "IBM Plex Sans";
      package = pkgs.ibm-plex;
    };
    serif = {
      name = "IBM Plex Serif";
      package = pkgs.ibm-plex;
    };
  };

  stylix.targets = {
    hyprlock.enable = false;
    spicetify.enable = false;
    tmux.enable = true;
    librewolf.profileNames = [ "default" ];
    nixvim.enable = true;
  };

  colorScheme = {
    slug = "${theme}";
    name = "${theme}";
    author = "idk man";
    palette = with config.lib.stylix.colors; {
      base00 = "#${base00}";
      base01 = "#${base01}";
      base02 = "#${base02}";
      base03 = "#${base03}";
      base04 = "#${base04}";
      base05 = "#${base05}";
      base06 = "#${base06}";
      base07 = "#${base07}";
      base08 = "#${base08}";
      base09 = "#${base09}";
      base0A = "#${base0A}";
      base0B = "#${base0B}";
      base0C = "#${base0C}";
      base0D = "#${base0D}";
      base0E = "#${base0E}";
      base0F = "#${base0F}";
    };
  };
}

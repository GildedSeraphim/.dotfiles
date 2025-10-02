{
  pkgs,
  config,
  nix-colors,
  ...
}:
let
  theme = "ayu-dark";
  th = "${pkgs.base16-schemes}/share/themes/${theme}.yaml";
  #alterfile = ./wal/color.txt;
  wallpaper = ./wal/blk.png;
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

  #  stylix.override = {
  #base00 = "#151515";
  #base01 = "#1F1F1F";
  #base02 = "#2E2E2E";
  #base03 = "#424242";
  #base04 = "#BBB6B6";
  #base05 = "#E8E3E3";
  #base06 = "#E8E3E3";
  #base07 = "#E8E3E3";
  #base08 = "#B66467";
  #base09 = "#D9BC8C";
  #base0A = "#D9BC8C";
  #base0B = "#8C977D";
  #base0C = "#8AA6A2";
  #base0D = "#8DA3B9";
  #base0E = "#A988B0";
  #base0F = "#BBB6B6";
  #};

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
    librewolf.profileNames = [ "default" ];
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

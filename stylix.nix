{
  pkgs,
  config,
  nix-colors,
  ...
}: let
  theme = "gruvbox-dark-hard";
  th = "${pkgs.base16-schemes}/share/themes/${theme}.yaml";
  #alterfile = ./wal/color.txt;
  wallpaper = ./wal/blue-beach.png;
  #altered-wallpaper = pkgs.runCommand "altered.png" {} ''
  #${pkgs.imagemagick}/bin/magick convert ${wallpaper} -colorspace sRGB -color-matrix < ${alterfile} altered.png $out
  #'';
in {
  imports = [
    nix-colors.homeManagerModules.default
  ];

  stylix.enable = true;

  stylix.base16Scheme = "${th}";

  # stylix.override = {
  #   base00 = "#0a090a";
  #   base01 = "#DE5845";
  #   base02 = "#F5A852";
  #   base03 = "#6E6F99";
  #   base04 = "#9070AE";
  #   base05 = "#9D7CC2";
  #   base06 = "#A492B4";
  #   base07 = "#e0dfe1";
  #   base08 = "#9c9c9d";
  #   base09 = "#DE5845";
  #   base0A = "#F5A852";
  #   base0B = "#6E6F99";
  #   base0C = "#9070AE";
  #   base0D = "#9D7CC2";
  #   base0E = "#A492B4";
  #   base0F = "#e0dfe1";
  # };
  stylix.image = wallpaper;

  stylix.cursor.package = pkgs.banana-cursor;
  stylix.cursor.name = "Banana Red";

  stylix.fonts = {
    #    monospace = {
    # package = pkgs.nerdfonts.override {fonts = ["IosevkaTermSlab"];};
    #name = "IosevkaTermSlab Nerd Font Mono";
    #};
    monospace = {
      package = pkgs.monocraft;
      name = "Monocraft";
    };
    sansSerif = config.stylix.fonts.monospace;
    serif = {
      package = pkgs.texlivePackages.theanodidot;
      name = "GFS Didot";
    };
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

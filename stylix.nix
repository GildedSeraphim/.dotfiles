{
  pkgs,
  config,
  nix-colors,
  ...
}: let
  theme = "catppuccin-mocha";
  th = "${pkgs.base16-schemes}/share/themes/${theme}.yaml";
  alterfile = ./wal/color.txt;
  wallpaper = ./wal/retro.png;
  #altered-wallpaper = pkgs.runCommand "altered.png" {} ''
  #${pkgs.imagemagick}/bin/magick convert ${wallpaper} -colorspace sRGB -color-matrix < ${alterfile} altered.png $out
  #'';
in {
  imports = [
    nix-colors.homeManagerModules.default
  ];

  stylix.enable = true;

  stylix.base16Scheme = "${th}";

  #stylix.override.base00 = "000000";

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

  home.file = {
    ".dotfiles/wal/color.txt".text = with config.lib.stylix.colors; ''
      #${base00}
      #${base01}
      #${base02}
      #${base03}
      #${base04}
      #${base05}
      #${base07}
      #${base08}
      #${base09}
      #${base0A}
      #${base0B}
      #${base0C}
      #${base0D}
      #${base0E}
      #${base0F}
    '';
  };
}

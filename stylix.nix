{
  pkgs,
  config,
  nix-colors,
  ...
}: let
  theme = "catppuccin-mocha";
  th = "${pkgs.base16-schemes}/share/themes/${theme}.yaml";
  #alterfile = ./wal/color.txt;
  wallpaper = ./wal/elk.png;
  #altered-wallpaper = pkgs.runCommand "altered.png" {} ''
  #${pkgs.imagemagick}/bin/magick convert ${wallpaper} -colorspace sRGB -color-matrix < ${alterfile} altered.png $out
  #'';
in {
  imports = [
    nix-colors.homeManagerModules.default
  ];

  stylix.enable = true;

  stylix.base16Scheme = "${th}";

  ##stylix.override.base00 = "d6cccd"; # base
  #stylix.override.base01 = "2f2b51"; # mantle
  #stylix.override.base02 = ""; # surface0
  #stylix.override.base03 = ""; # surface1
  #stylix.override.base04 = ""; # surface2
  ##stylix.override.base05 = "562058"; # text
  #stylix.override.base06 = "DE9BEE"; # rosewater
  ##stylix.override.base0E = "8f7fa3"; # lavender
  ##stylix.override.base0F = "eb7186"; # red
  #stylix.override.base09 = "f1b5cf"; # peach
  #stylix.override.base0A = "fde9c9"; # yellow
  ##stylix.override.base0C = "82b0a3"; # green
  #stylix.override.base0C = "afbdda"; # teal
  #stylix.override.base0D = "313696"; # blue
  #stylix.override.base0E = "FC4DA3"; # mauve
  #stylix.override.base0F = "FA90C9"; # flamingo

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

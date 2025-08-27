{
  lib,
  pkgs,
  inputs,
  ...
}:
{
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      #nerd-fonts
      hack-font
      nerd-fonts.iosevka-term-slab
      #cozette
      monocraft
      # apple-fonts
      dejavu_fonts
      noto-fonts
      noto-fonts-cjk-sans
      inter
      iosevka
      ibm-plex
      fira-code
      scientifica
      siji
      texlivePackages.gfsdidot
      jetbrains-mono
      # twemoji-color-font
      twitter-color-emoji
      paratype-pt-serif
      material-icons
      merriweather
      merriweather-sans
      font-awesome
      comic-mono
      lmmath
      cm_unicode
      # MS Fonts
      corefonts
      vistafonts
      jetbrains-mono
      google-fonts
      material-design-icons
      material-symbols
      rubik
      lexend
      noto-fonts
      roboto
      nerd-fonts.fira-code
      nerd-fonts.fantasque-sans-mono
      nerd-fonts.zed-mono
      nerd-fonts.iosevka
      nerd-fonts.monaspace
      inputs.apple-fonts.packages."${pkgs.system}".sf-mono
    ];
    fontconfig = {
      enable = true;
      antialias = true;
      allowBitmaps = true;
      hinting = {
        enable = true;
        autohint = false;
        style = "slight";
      };
      subpixel = {
        lcdfilter = "default";
        rgba = "rgb";
      };
    };
  };
}

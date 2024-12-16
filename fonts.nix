{
  lib,
  pkgs,
  ...
}: {
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
    ];
  };
}

{ lib, pkgs, ... }:

{
  fonts = {
    fontDir.enable = true;
    packages = with pkgs;[
      # apple-fonts
      noto-fonts
      noto-fonts-cjk
      inter
      iosevka
      ibm-plex
      fira-code
      scientifica
      siji
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
      nerdfonts
    ];    
  };
}

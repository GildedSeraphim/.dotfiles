{...}: {
  programs.zathura = {
    enable = true;
    extraConfig = ''
      set synctex true
      set statusbar-h-padding 0
      set font 'Iosevka normal 12'
      map u scroll half-up
      map d scroll half-down
      map D toggle_page_mode
      map r reload
      map R rotate
      map K zoom in
      map J zoom out
      map i recolor
      map p print
      set selection-clipboard clipboard

      set recolor                     "true"
      set recolor-keephue             "true"


    '';
  };
}

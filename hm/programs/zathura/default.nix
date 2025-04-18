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

      set default-bg                  "#0E1018"
      set default-fg                  "#ebdbb2"

      set statusbar-fg                "#ffffff"
      set statusbar-bg                "#0E1018"

      set inputbar-bg                 "#0E1018"
      set inputbar-fg                 "#fbf1c7"

      set notification-bg             "#0E1018"
      set notification-fg             "#fbf1c7"

      set notification-error-bg       "#1d2021"
      set notification-error-fg       "#fb4934"

      set notification-warning-bg     "#1d2021"
      set notification-warning-fg     "#fb4934"

      set highlight-color             "#fabd2f"
      set highlight-active-color      "#83a598"

      set completion-bg               "#3c3836"
      set completion-fg               "#83a598"

      set completion-highlight-fg     "#fbf1c7"
      set completion-highlight-bg     "#83a598"

      set recolor-lightcolor          "#0E1018"
      set recolor-darkcolor           "#ffffff"

      set recolor                     "false"
      set recolor-keephue             "true"


    '';
  };
}

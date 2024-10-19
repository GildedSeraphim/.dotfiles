{config, ...}: {
  programs.cava = {
    enable = true;
    settings = {
      general = {
        mode = "scientific";
        #framerate = 60;
        #autosens = 1;
        #sensitivity = 100;
        bars = 100;
        bar_width = 3;
        #bar_spacing = 1;
        #bar_height = 32;
        #lower_cutoff_freq = 50;
        #higher_cutoff_freq = 1000;
        sleep_timer = 0;
      };
      output = {
        alacritty_sync = 1;
      };
      color = with config.lib.stylix.colors; {
        gradient = 1;
        gradient_color_1 = "'#${base0B}'";
        gradient_color_2 = "'#${base0B}'";
        gradient_color_3 = "'#${base0C}'";
        gradient_color_4 = "'#${base0C}'";
        gradient_color_5 = "'#${base0C}'";
        gradient_color_6 = "'#${base0D}'";
        gradient_color_7 = "'#${base0D}'";
        gradient_color_8 = "'#${base0E}'";
      };
      smoothing = {
        gravity = 200;
        integral = 77;
      };
      eq = {
        "1" = 2; # bass
        "2" = 2;
        "3" = 1; # midtone
        "4" = 1;
        "5" = "0.5"; # treble
      };
    };
  };
}

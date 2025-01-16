{
  pkgs,
  lib,
  nix-colors,
  config,
  inputs,
  ...
}: let
  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''

    ${pkgs.waybar}/bin/waybar &
    sleep 1
  '';
in {
  imports = [
    ./hyprland-environment.nix
    ./wlsunset.nix
    ./hyprpaper.nix
  ];

  home.packages = with pkgs; [
    wl-clipboard
    cliphist
    grimblast
  ];

  services.swayosd.enable = true;

  wayland.windowManager.hyprland.xwayland.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;

    plugins = [
      inputs.hyprland-plugins.packages."${pkgs.system}".hyprbars
      inputs.hyprland-plugins.packages."${pkgs.system}".csgo-vulkan-fix
      #     inputs.split-monitor-workspaces.packages."${pkgs.system}".split-monitor-workspaces
      #      inputs.hyprspace.packages."${pkgs.system}".Hyprspace
      inputs.hyprland-plugins.packages."${pkgs.system}".hyprwinwrap
      inputs.hyprland-plugins.packages."${pkgs.system}".borders-plus-plus
      # inputs.hyprland-easymotion.packages.${pkgs.system}.hyprland-easymotion
    ];

    settings = {
      exec-once = [
        #''${startupScript}/bin/start''
        #        ''${pkgs.hyprpanel}/bin/hyprpanel''
        ''ags run''
        ''waybar''
        ''${pkgs.easyeffects}/bin/easyeffects --gapplication-service &''
        ''wl-paste --type text --watch cliphist store''
      ];

      general = {
        "gaps_in" = 0;
        "gaps_out" = 5;
        "border_size" = 0;
        #        "col.active_border" = lib.mkForce "rgb(${config.stylix.base16Scheme.base0E})";
        #        "col.inactive_border" = lib.mkForce "rgb(${config.stylix.base16Scheme.base00})";

        "layout" = "master";
      };

      monitor = [
        #"HDMI-A-1,2560x1440@60.00,0x2400,auto"
        #"DP-3,2560x1440@144,2560x0,auto"
        #"Unknown-1,630x350,-2560x-1440,auto"
        #"eDP-1, 3840x2400@60,0x0,auto"
        #"HDMI-A-2, 1920x1080@74.97,auto,auto"
      ];

      decoration = {
        "rounding" = 0;
        "active_opacity" = 1;
        "inactive_opacity" = 1;
        blur = {
          "enabled" = false;
          "size" = 1;
          "passes" = 4;
          "new_optimizations" = true;
          "ignore_opacity" = true;
        };
      };

      animations = {
        "enabled" = "yes";

        "bezier" = "myBezier,0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };
      windowrule = [
        "noblur, GLava"
        "noborder, GLava"
        "noshadow, GLava"
        "noanim, GLava"
        "nofocus, GLava"
        "float, GLava"
        "pin, GLava"
        "idleinhibit always, GLava"
        "size 100% 100%, GLava"
        "move 0 0, GLava"
      ];
      layerrule = [
        "noanim, selection"
      ];

      windowrulev2 = [
        "float, class:(qalculate-gtk)"
        "size 70% 55%, class:(qalculate-gtk)"
        "center, class:(qalculate-gtk)"
        "suppressevent maximize, class:.*"
        "float, title:(Spotify Premium)"
        "size 80% 75%, title:(Spotify Premium)"
        "center, title:(Spotify Premium)"
      ];

      dwindle = {
        #"force_split" = 2;
        #"pseudotile" = "false";
        #"preserve_split" = "yes";
      };
      misc = {
        enable_swallow = true;
        force_default_wallpaper = 0;
        disable_splash_rendering = true;
        disable_hyprland_logo = true;
      };

      cursor = {
        "no_hardware_cursors" = true;
        "hide_on_key_press" = true;
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
      };

      input = {
        "numlock_by_default" = true;
        touchpad = {
          "natural_scroll" = "true";
          "scroll_factor" = "0.2";
        };
        "accel_profile" = "flat";
        "follow_mouse" = "true";
        "force_no_accel" = "true";
        "kb_layout" = "us";
        "sensitivity" = "0.000000";
      };

      experimental = {
        wide_color_gamut = false;
        hdr = true;
        xx_color_management_v4 = false;
      };

      plugin = {
        borders-plus-plus = {
          add_borders = 2;
          "col.border_2" = "rgb(4d0e55)";
          "col.border_1" = "rgb(d4cacb)";
          border_size_1 = 3;
          border_size_2 = 2;
          natural_rounding = "yes";
        };
        hyprbars = {
          bar_height = 30;
          bar_color = "rgb(8f7fa3)";
          bar_text_font = "${config.stylix.fonts.monospace.name}";
          bar_text_size = 15;
          "col.text" = "rgb(4d0e55)";
          bar_text_align = "left";
          bar_precedence_over_border = true;
          bar_button_padding = 7;
          # example buttons (R -> L)
          # hyprbars-button = color, size, on-click
          hyprbars-button = [
            "rgb(f88999), 15, 󰖭, hyprctl dispatch killactive"
            "rgb(d4cacb), 15, , hyprctl dispatch fullscreen 1"
          ];
        };
        hyprwinwrap = {
          "class" = "GLava";
        };
        csgo-vulkan-fix = {
          res_w = 1440;
          res_h = 1080;

          # NOT a regex! This is a string and has to exactly match initial_class
          class = "cs2";

          # Whether to fix the mouse position. A select few apps might be wonky with this.
          fix_mouse = true;
        };
      };

      "$mod" = "SUPER";

      bind = [
        "$mod, B, exec, zen"
        "$mod, Return, exec, foot"
        "$mod, R, exec, rofi -show drun"
        "$mod SHIFT, R, exec, rofi -show run"
        "$mod, F, togglefloating"
        "$mod SHIFT, F, fullscreen"
        "$mod, Q, killactive"
        "$mod, W, exec, mako"
        "$mod SHIFT, L, exec, hyprlock"
        #        "$mod, TAB, overview:toggle"
        "$mod, C, exec, rofi -show calc"
        "$mod SHIFT, C, exec, qalculate-gtk"
        "$mod, T, togglegroup"
        #        "$mod, G, exec, pkill glava-vis && pkill glava"
        "$mod, G, exec, glava-vis"
        "$mod SHIFT, G, exec, pkill glava-vis && pkill glava"
        "$mod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"

        "$mod, O, exec, obsidian"

        "Control_L SHIFT, S, exec, grimblast copy area"
        "Control_L ALT, S, exec, grimblast --notify --cursor save screen"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        "$mod SHIFT, 1, movetoworkspacesilent, 1"
        "$mod SHIFT, 2, movetoworkspacesilent, 2"
        "$mod SHIFT, 3, movetoworkspacesilent, 3"
        "$mod SHIFT, 4, movetoworkspacesilent, 4"
        "$mod SHIFT, 5, movetoworkspacesilent, 5"
        "$mod SHIFT, 6, movetoworkspacesilent, 6"
        "$mod SHIFT, 7, movetoworkspacesilent, 7"
        "$mod SHIFT, 8, movetoworkspacesilent, 8"
        "$mod SHIFT, 9, movetoworkspacesilent, 9"
        "$mod SHIFT, 0, movetoworkspacesilent, 10"

        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, j, movefocus, d"

        "$mod, S, togglespecialworkspace, magic"
        "$mod SHIFT, S, movetoworkspace, special:magic"

        ", XF86MonBrightnessUp, exec, brightnessctl s +5%"
        ", XF86MonBrightnessDown, exec, brightnessctl s 5%-"

        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod ALT, mouse:272, resizewindow"
      ];
    };
  };
}

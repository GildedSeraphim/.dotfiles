{ pkgs, lib, nix-colors, config, inputs, ... }:
let
    startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
      exec waybar &
      exec pkill swww-daemon &
      ${pkgs.waybar}/bin/waybar waybar &
      ${pkgs.swww}/bin/swww init &
      ${pkgs.mako}/bin/mako init &
      sleep 1 &
      
      ${pkgs.swww}/bin/swww img ${./redlipstick.jpg} &
  
    '';
in
{

  imports = [
    ./hyprland-environment.nix
  ];


  wayland.windowManager.hyprland = {
    enable = true;

     plugins = [
      #inputs.hyprland-plugins.packages."${pkgs.system}".borders-plus-plus
    ];

    settings = {
      exec-once = ''${startupScript}/bin/start'';
    
      general = {
        "gaps_in" = 5;
        "gaps_out" = 20;
        "border_size" = 2;
       # "col.active_border" = lib.mkForce "rgb(${config.stylix.base16Scheme.base0E})";
       # "col.inactive_border" = lib.mkForce "rgb(${config.stylix.base16Scheme.base00})";

        "layout" = "dwindle";
      };

      monitor = [
        "HDMI-A-1,2560x1440@60.00,0x0,auto"
        "DP-3,2560x1440@144,2560x0,auto"
        "Unknown-1,630x350,-2560x-1440,auto"
      ];

      decoration = {
        "rounding" = 10;
        blur = {
          "enabled" = "true";
          "size" = 3;
          "passes" = 1;
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

      dwindle = {
        "pseudotile" = "yes";
        "preserve_split" = "yes";
      };

      master = {
        #"new_is_master" = true;
      };

      "windowrulev2" = "suppressevent maximize, class:.*";

      cursor = {
	"no_hardware_cursors" = true;
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
  

      "$mod" = "SUPER";

      bind = [
        "$mod, B, exec, brave"
        "$mod, Return, exec, alacritty"
        "$mod, R, exec, rofi -show drun"
        "$mod SHIFT, R, exec, rofi -show run"
        "$mod, F, togglefloating"
        "$mod, Q, killactive"
        "$mod, W, exec, mako"
            
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

        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
	"$mod, up, movefocus, u"	 
	"$mod, down, movefocus, d"

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

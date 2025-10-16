{ pkgs, ... }:
{
  wayland.windowManager.mango = {
    enable = true;

    autostart_sh = ''
      dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots
      /usr/lib/xdg-desktop-portal-wlr &
      ${pkgs.easyeffects}/bin/easyeffects --gapplication-service &
      wl-paste --type text --watch cliphist store &
      rog-control-center
    '';

    settings = ''
      # Monitor Settings
      monitorrule=DP-1,0.55,1,tile,0,1,0,0,2560,1440,144

      # Master Settings
      new_is_master = 0

      #Tags
      tagrule=id:1,layout_name:tile
      tagrule=id:2,layout_name:tile
      tagrule=id:3,layout_name:tile
      tagrule=id:4,layout_name:tile
      tagrule=id:5,layout_name:tile
      tagrule=id:6,layout_name:tile
      tagrule=id:7,layout_name:tile
      tagrule=id:8,layout_name:tile
      tagrule=id:9,layout_name:tile

      # Mouse + Trackpad Settings
      disable_trackpad = 0
      tap_to_click = 1
      accel_profile = 0
      accel_speed = 0

      #Window Rules
      windowrule=isFloating:1,appid:.spotify

      # Animations
      animations = 0
      gappih=0
      gappiv=0
      gappoh=0
      gappov=0
      borderpx=4
      no_border_when_single=0
      focuscolor=0x005577ff

      # Bindings
      bind=SUPER,1,comboview,1
      bind=SUPER,2,comboview,2
      bind=SUPER,3,comboview,3
      bind=SUPER,4,comboview,4
      bind=SUPER,5,comboview,5
      bind=SUPER,6,comboview,6
      bind=SUPER,7,comboview,7
      bind=SUPER,8,comboview,8
      bind=SUPER,9,comboview,9

      bind=SUPER,b,spawn,zen-beta
      bind=SUPER+SHIFT,l,spawn,hyprlock
      bind=SUPER,c,spawn,rofi -show calc
      bind=SUPER+SHIFT,c,spawn,qalculate-gtk

      bind=SUPER,g,spawn,glava-vis
      bind=SUPER,g,spawn,pkill glava-vis && pkill glava
      bind=SUPER,v,spawn,cliphist list | rofi -dmenu | cliphist decode | wl-copy

      bind=SUPER+SHIFT,s,spawn,grimblast copy area --freeze
      bind=SUPER+ALT,s,spawn,grimblast --notify --cursor save screen

      bind=SUPER+SHIFT,s,minimized,
      bind=SUPER,s,toggle_scratchpad

      bind=SUPER,Return,spawn,foot
      bind=SUPER,q,killclient,
      bind=SUPER,r,spawn,rofi -show drun
      bind=SUPER+SHIFT,r,reload_config

      bind=SUPER+SHIFT,f,togglefullscreen,
      bind=SUPER,f,togglefloating,

      # smartmovewin
      bind=CTRL+SHIFT,k,smartmovewin,up
      bind=CTRL+SHIFT,j,smartmovewin,down
      bind=CTRL+SHIFT,h,smartmovewin,left
      bind=CTRL+SHIFT,l,smartmovewin,right

      # switch window focus
      bind=SUPER,j,focusstack,next
      bind=SUPER,k,focusstack,prev
      bind=SUPER,h,focusdir,left
      bind=SUPER,l,focusdir,right

      # swap window
      bind=SUPER+SHIFT,k,exchange_client,up
      bind=SUPER+SHIFT,j,exchange_client,down
      bind=SUPER+SHIFT,h,exchange_client,left
      bind=SUPER+SHIFT,l,exchange_client,right

      mousebind=SUPER,btn_left,moveresize,curmove
      mousebind=SUPER,btn_right,moveresize,curresize
      drag_tile_to_tile=1
    '';

  };
}

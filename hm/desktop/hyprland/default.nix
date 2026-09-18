{
  pkgs,
  inputs,
  config,
  lib, # <-- added: needed for lib.generators.mkLuaInline below
  ...
}:
let
  # ---------------------------------------------------------------------
  # Helpers for building the "_args" shape home-manager's lua serializer
  # expects. See https://wiki.hypr.land/Configuring/Basics/Binds/ and
  # https://wiki.hypr.land/Configuring/Basics/Dispatchers/ for the hl.*
  # functions these are standing in for.
  # ---------------------------------------------------------------------
  lua = lib.generators.mkLuaInline;

  mod = "SUPER"; # replaces the old "$mod" settings variable; interpolated
  # directly into key strings below instead of a lua-side
  # variable, which avoids needing mkLuaInline string
  # concatenation on every single bind.

  # hl.bind(key, dispatcher)
  bind = key: action: { _args = [ key (lua action) ]; };
  # hl.bind(key, dispatcher, flags) -- e.g. mouse binds need { mouse = true; }
  bindf = key: action: flags: { _args = [ key (lua action) flags ]; };

  # hl.dsp.exec_cmd(cmd) -- use INSIDE a bind (returns a dispatcher closure)
  exec = cmd: ''hl.dsp.exec_cmd("${cmd}")'';
  # hl.exec_cmd(cmd) -- use INSIDE an hl.on(...) callback (runs immediately;
  # this is a different function to the one above -- see note near `on` below)
  execNow = cmd: ''hl.exec_cmd("${cmd}")'';

  focusdr = dir: ''hl.dsp.focus({ direction = "${dir}" })'';
  gotoWs = n: ''hl.dsp.focus({ workspace = ${toString n} })'';
  moveWsSilent = n: ''hl.dsp.window.move({ workspace = ${toString n}, follow = false })'';

  # hl.on("hyprland.start", function() ... end)
  onStart = body: { _args = [ "hyprland.start" (lua "function() ${body} end") ]; };

  # mod+1..mod+0 -> workspaces 1..10 (matches your original numbering,
  # where mod+0 goes to workspace 10)
  workspaces = [
    { key = "1"; n = 1; }
    { key = "2"; n = 2; }
    { key = "3"; n = 3; }
    { key = "4"; n = 4; }
    { key = "5"; n = 5; }
    { key = "6"; n = 6; }
    { key = "7"; n = 7; }
    { key = "8"; n = 8; }
    { key = "9"; n = 9; }
    { key = "0"; n = 10; }
  ];

  # Your custom bezier + the 16 animation leaves you had defined.
  # animations.enabled = false (below) master-disables all of these, same
  # as your original "enabled = no" -- they're kept here, still individually
  # "enabled = true", purely so it's a one-line flip to turn animations back
  # on without having to re-author this whole block.
  animCurve = "easeOutQuart";
  animEntries = [
    { leaf = "global"; speed = 5; bezier = "default"; }
    { leaf = "border"; speed = 5; bezier = animCurve; }
    { leaf = "windows"; speed = 3; bezier = animCurve; }
    { leaf = "windowsIn"; speed = 3; bezier = animCurve; style = "slide"; }
    { leaf = "windowsOut"; speed = 3; bezier = animCurve; style = "slide"; }
    { leaf = "windowsMove"; speed = 3; bezier = animCurve; style = "slide"; }
    { leaf = "layers"; speed = 3; bezier = animCurve; }
    { leaf = "layersIn"; speed = 3; bezier = animCurve; style = "fade"; }
    { leaf = "layersOut"; speed = 3; bezier = animCurve; style = "fade"; }
    { leaf = "fade"; speed = 3; bezier = animCurve; }
    { leaf = "fadeIn"; speed = 3; bezier = animCurve; }
    { leaf = "fadeOut"; speed = 3; bezier = animCurve; }
    { leaf = "fadeLayersIn"; speed = 3; bezier = animCurve; }
    { leaf = "fadeLayersOut"; speed = 3; bezier = animCurve; }
    { leaf = "workspaces"; speed = 5; bezier = animCurve; style = "slide"; }
    { leaf = "specialWorkspace"; speed = 5; bezier = animCurve; style = "slidevert"; }
  ];
in
{
  imports = [
    ./hyprland-environment.nix
    ./wlsunset.nix
    ./hyprpaper.nix
  ];

  home.packages = with pkgs; [
    wl-clipboard
    cliphist
    grimblast
    hyprshade
    hyprland-qtutils
  ];

  services.swayosd.enable = true;

  wayland.windowManager.hyprland.xwayland.enable = true;
  wayland.windowManager.hyprland = {
    configType = "lua";
    enable = true;

    plugins = [
      #      inputs.hyprland-plugins.packages."${pkgs.system}".hyprbars
      #inputs.hyprland-plugins.packages."${pkgs.system}".csgo-vulkan-fix
      #     inputs.split-monitor-workspaces.packages."${pkgs.system}".split-monitor-workspaces
      #      inputs.hyprspace.packages."${pkgs.system}".Hyprspace
      #inputs.hyprland-plugins.packages."${pkgs.system}".hyprwinwrap
      #inputs.hyprland-plugins.packages."${pkgs.system}".borders-plus-plus
      # inputs.hyprland-easymotion.packages.${pkgs.system}.hyprland-easymotion
    ];

    settings = {
      # -----------------------------------------------------------------
      # Everything that used to be a flat top-level block (general,
      # decoration, animations, misc, cursor, input...) now nests under
      # ONE `config` key, which becomes hl.config({ ... }). Dwindle and
      # per-plugin config blocks are dropped below since yours were empty
      # / fully commented out in the original -- add them back the same
      # way (as sub-keys of `config`) if you need them later.
      # -----------------------------------------------------------------
      config = {
        general = {
          gaps_in = 2;
          gaps_out = 0;
          border_size = 0;
          layout = "master";
          # Your stylix overrides were commented out. If you re-enable them,
          # note the shape changed from a dotted string key to a real nested
          # table:
          #   col = {
          #     active_border = "rgb(${config.stylix.base16Scheme.base0E})";
          #     inactive_border = "rgb(${config.stylix.base16Scheme.base00})";
          #   };
        };

        decoration = {
          rounding = 0;
          active_opacity = 1;
          inactive_opacity = 1;
          blur = {
            enabled = false;
            size = 1;
            passes = 4;
            new_optimizations = true;
            ignore_opacity = true;
          };
        };

        animations = {
          enabled = false; # was the STRING "no" -- must be a real bool now,
          # see the type note in my reply
        };

        misc = {
          enable_swallow = true;
          force_default_wallpaper = 0;
          disable_splash_rendering = true;
          disable_hyprland_logo = true;
          focus_on_activate = true;
        };

        cursor = {
          no_hardware_cursors = true;
          hide_on_key_press = true;
        };

        input = {
          numlock_by_default = true;
          accel_profile = "flat";
          kb_layout = "us";
          # The following four were quoted strings in your old config.
          # hyprland.lua is strictly typed, so these are now real bool/
          # number values -- leaving them as strings will throw a runtime
          # type error on load (see the note in my reply).
          follow_mouse = 1; # was the string "true" -- follow_mouse is an
          # int (0/1/2), not a bool; 1 = full follow, matching
          # your original intent
          force_no_accel = true; # was the string "true"
          sensitivity = 0.0; # was the string "0.000000"
          touchpad = {
            natural_scroll = true; # was the string "true"
            scroll_factor = 0.2; # was the string "0.2"
          };
        };
      };

      monitor = [
        # "HDMI-A-1,2560x1440@60.00,-2560x0,auto"
        # "DP-3,2560x1440@144,2560x0,auto"
        # "Unknown-1,630x350,-2560x-1440,auto"
        { output = "eDP-1"; mode = "3840x2400@60"; position = "0x0"; scale = "auto"; }
        { output = "DP-1"; mode = "2560x1440@144.00"; position = "0x0"; scale = "auto"; }
        # "eDP-1, disabled"
        { output = "HDMI-A-1"; mode = "1280x1024@60"; position = "-1280x0"; scale = "auto"; }
      ];

      # -----------------------------------------------------------------
      # Window rules: hl.window_rule({ match = {...}, ...effects }) takes
      # ONE table, so every effect that used to be its own windowrule line
      # for a given class/title now collapses into a single call.
      # -----------------------------------------------------------------
      window_rule = [
        {
          name = "glava";
          match.class = "GLava";
          no_blur = true;
          no_shadow = true;
          no_anim = true;
          no_focus = true;
          fullscreen_state = "1 1"; # unconfirmed exact format in window-rule
          # context (vs. the fullscreen_state *dispatcher*, which is
          # structured differently) -- verify this one after reload
          pin = true;
          size = "100% 100%";
          # match.class *, suppress_event maxamize -- see below
        }
        {
          name = "qalculate-gtk";
          match.class = "qalculate-gtk";
          float = true;
          size = "70% 55%";
          center = true;
        }
        {
          name = "suppress-maximize-all";
          match.class = "*";
          # Fixed a typo from your original: it was "maxamize", which
          # wouldn't have matched anything -- this rule was likely a no-op
          # before too.
          suppress_event = "maximize";
        }
        {
          name = "spotify-premium";
          match.title = "Spotify Premium";
          float = true;
          size = "80% 75%";
          center = true;
        }
      ];
      # layer_rule dropped -- your only entry was already commented out.
      # The fully-commented windowrulev2 block (duplicate of window_rule
      # above, old syntax) was also dropped as dead weight.

      gesture = [
        { fingers = 3; direction = "horizontal"; action = "workspace"; }
      ];

      curve = [
        { _args = [ animCurve { type = "bezier"; points = [ [ 0.25 1 ] [ 0.5 1 ] ]; } ]; }
      ];
      animation = map (a: a // { enabled = true; }) animEntries;

      # -----------------------------------------------------------------
      # Autostart: exec-once has no direct lua equivalent. hl.on("hyprland.start", ...)
      # is the replacement -- it fires once per real session start, not on
      # every config reload (unlike a bare top-level hl.exec_cmd call,
      # which WOULD re-run every time you save the file).
      # Also dropped the trailing "&" on the first two commands -- hl.exec_cmd
      # is always async, so it's redundant now.
      # -----------------------------------------------------------------
      on = map onStart [
        (execNow "${pkgs.easyeffects}/bin/easyeffects --gapplication-service")
        (execNow "wl-paste --type text --watch cliphist store")
        (execNow "rog-control-center")
      ];

      # -----------------------------------------------------------------
      # Binds. bindm is gone as a separate concept -- mouse binds are just
      # hl.bind() calls with a mouse:NNN key and { mouse = true } flag.
      # -----------------------------------------------------------------
      bind =
        [
          (bind "${mod} + B" (exec "zen-beta"))
          (bind "${mod} + Return" (exec "ghostty"))
          (bind "${mod} + R" (exec "rofi -show drun"))
          (bind "${mod} + SHIFT + R" (exec "rofi -show run"))
          (bind "${mod} + F" ''hl.dsp.window.float({ action = "toggle" })'')
          (bind "${mod} + SHIFT + F" ''hl.dsp.window.fullscreen({ mode = 0 })'')
          (bind "${mod} + Q" ''hl.dsp.window.close()'')
          (bind "${mod} + W" (exec "mako"))
          (bind "${mod} + SHIFT + L" (exec "hyprlock"))
          (bind "${mod} + D" (exec "legcord"))
          (bind "${mod} + K" (exec "hyprctl kill"))
          # (bind "${mod} + TAB" ...) -- "overview:toggle" was already
          # disabled in your original and I couldn't confirm a lua
          # equivalent; left out rather than guess.
          (bind "${mod} + C" (exec "rofi -show calc"))
          (bind "${mod} + SHIFT + C" (exec "qalculate-gtk"))

          (bind "${mod} + T" (exec "hyprshade toggle ./greyscale.glsl"))

          (bind "${mod} + G" (exec "glava"))
          (bind "${mod} + SHIFT + G" (exec "pkill glava-vis && pkill glava"))
          (bind "${mod} + V" (exec "cliphist list | rofi -dmenu | cliphist decode | wl-copy"))

          (bind "${mod} + O" (exec "obsidian"))
          (bind "${mod} + M" (exec "handy --toggle-transcription"))

          (bind "Control_L + SHIFT + S" (exec "grimblast copy area --freeze"))
          (bind "Control_L + ALT + S" (exec "grimblast --notify --cursor save screen"))

          (bind "${mod} + h" (focusdr "left"))
          (bind "${mod} + l" (focusdr "right"))
          (bind "${mod} + k" (focusdr "up"))
          (bind "${mod} + j" (focusdr "down"))

          (bind "${mod} + S" ''hl.dsp.workspace.toggle_special("magic")'')
          (bind "${mod} + SHIFT + S" ''hl.dsp.window.move({ workspace = "special:magic" })'')

          (bind "XF86MonBrightnessUp" (exec "brightnessctl s +5%"))
          (bind "XF86MonBrightnessDown" (exec "brightnessctl s 5%-"))

          (bind "${mod} + mouse_down" ''hl.dsp.focus({ workspace = "e+1" })'')
          (bind "${mod} + mouse_up" ''hl.dsp.focus({ workspace = "e-1" })'')
        ]
        ++ (map (w: bind "${mod} + ${w.key}" (gotoWs w.n)) workspaces)
        ++ (map (w: bind "${mod} + SHIFT + ${w.key}" (moveWsSilent w.n)) workspaces)
        ++ [
          (bindf "${mod} + mouse:272" ''hl.dsp.window.drag()'' { mouse = true; })
          (bindf "${mod} + mouse:273" ''hl.dsp.window.resize()'' { mouse = true; })
          (bindf "${mod} + ALT + mouse:272" ''hl.dsp.window.resize()'' { mouse = true; })
        ];
    };
  };
}

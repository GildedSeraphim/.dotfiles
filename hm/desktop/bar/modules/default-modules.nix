{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) getExe getExe';
in {
  backlight = let
    brightnessctl = lib.getExe pkgs.brightnessctl;
  in {
    format = "{icon}";
    format-icons = [
      "󰋙"
      "󰫃"
      "󰫄"
      "󰫅"
      "󰫆"
      "󰫇"
      "󰫈"
    ];
    on-scroll-up = "${brightnessctl} s 1%-";
    on-scroll-down = "${brightnessctl} s +1%";
  };

  "backlight/slider" = {
    min = 1;
    max = 100;
    orientation = "horizontal";
  };

  battery = {
    states = {
      good = 95;
      warning = 30;
      critical = 15;
    };
    format = "{icon} {capacity}%";
    format-charging = "󰂄 {capacity}%";
    format-plugged = "󰂄 {capacity}%";
    format-alt = "{time} {icon}";
    format-icons = [
      "󰂃"
      "󰁺"
      "󰁻"
      "󰁼"
      "󰁽"
      "󰁾"
      "󰁾"
      "󰁿"
      "󰂀"
      "󰂁"
      "󰂂"
      "󰁹"
    ];
  };

  bluetooth = {
    format = "";
    format-disabled = "󰂲";
    format-connected = "󰂱";
    tooltip-format = "{controller_alias}\t{controller_address}";
    tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{device_enumerate}";
    tooltip-format-disabled = "";
    tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
    on-click = "blueman-manager";
  };

  cava = {
    framerate = 120;
    autosens = 1;
    bars = 12;
    method = "pipewire";
    source = "auto";
    bar_delimiter = 0;
    input_delay = 2;
    sleep_timer = 2;
    hide_on_silence = true;
    format-icons = [
      "▁"
      "▂"
      "▃"
      "▄"
      "▅"
      "▆"
      "▇"
      "█"
    ];
  };

  clock = with config.lib.stylix.colors; {
    tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
    format = "󰃭 {:%a %d %b \n 󰅐 %I:%M %p}";
    calendar = {
      mode = "year";
      mode-mon-col = 3;
      weeks-pos = "right";
      on-scroll = 1;
      format = {
        months = "<span color='#${base05}'><b>{}</b></span>";
        days = "<span color='#${base05}'><b>{}</b></span>";
        weeks = "<span color='#${base05}'><b>W{}</b></span>";
        weekdays = "<span color='#${base0B}'><b>{}</b></span>";
        today = "<span color='#${base0A}'><b><u>{}</u></b></span>";
      };
    };
    actions = {
      on-click-right = "mode";
      on-click-forward = "tz_up";
      on-click-backward = "tz_down";
      on-scroll-up = "shift_up";
      on-scroll-down = "shift_down";
    };
  };

  cpu = {
    format = " {usage}%";
    tooltip = true;
    states = {
      "50" = 50;
      "60" = 75;
      "70" = 90;
    };
  };

  disk = {
    format = " {percentage_used}%";
  };

  idle_inhibitor = {
    format = "{icon} ";
    format-icons = {
      activated = "";
      deactivated = "";
    };
  };

  keyboard-state = {
    numlock = true;
    capslock = true;
    format = "{icon} {name}";
    format-icons = {
      locked = "";
      unlocked = "";
    };
  };

  memory = {
    format = "󰍛 {}%";
  };

  mpris = {
    format = "{player_icon} {status_icon} {dynamic}";
    format-paused = "{player_icon} {status_icon} <i>{dynamic}</i>";
    max-length = 45;
    player-icons = {
      chromium = "";
      default = "";
      zen = "";
      mopidy = "";
      mpv = "";
      spotify = "";
    };
    status-icons = {
      paused = "";
      playing = "";
      stopped = "";
    };
  };

  mpd = {
    format = "{stateIcon} {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}{artist} - {album} - {title} ({elapsedTime:%M:%S}/{totalTime:%M:%S}) ⸨{songPosition}|{queueLength}⸩ {volume}% ";
    format-disconnected = "Disconnected ";
    format-stopped = "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped ";
    unknown-tag = "N/A";
    interval = 2;
    consume-icons = {
      on = " ";
    };
    random-icons = {
      off = "<span color=\"#f53c3c\"></span> ";
      on = " ";
    };
    repeat-icons = {
      on = " ";
    };
    single-icons = {
      on = "1 ";
    };
    state-icons = {
      paused = "";
      playing = "";
    };
    tooltip-format = "MPD (connected)";
    tooltip-format-disconnected = "MPD (disconnected)";
  };

  network = let
    nm-editor = "${getExe' pkgs.networkmanagerapplet "nm-connection-editor"}";
  in {
    interval = 1;
    format-wifi = "󰜷 {bandwidthUpBytes} 󰜮 {bandwidthDownBytes}";
    format-ethernet = "󰜷 {bandwidthUpBytes} 󰜮 {bandwidthDownBytes}";
    tooltip-format = "󰈀 {essid} via {gwaddr}";
    format-linked = "󰈁 {ifname} (No IP)";
    format-disconnected = " Disconnected";
    format-alt = "{essid} ({signalStrength}%)";
    on-click-right = "${nm-editor}";
  };

  pulseaudio = {
    format = "{volume}% {icon}";
    format-bluetooth = "{volume}% {icon}";
    format-muted = "";
    format-icons = {
      headphone = "";
      hands-free = "";
      headset = "";
      phone = "";
      portable = "";
      car = "";
      default = [
        ""
        ""
      ];
    };
    scroll-step = 1;
    on-click = "pavucontrol";
    on-click-right = "easyeffects";
    ignored-sinks = ["Easy Effects Sink"];
  };

  "pulseaudio/slider" = {
    min = 0;
    max = 100;
    orientation = "horizontal";
  };

  systemd-failed-units = {
    hide-on-ok = false;
    format = "✗ {nr_failed}";
    format-ok = "✓";
    system = true;
    user = false;
  };

  tray = {
    spacing = 10;
  };

  user = {
    format = "{user}";
    interval = 60;
    height = 30;
    width = 30;
    icon = true;
  };

  wireplumber = {
    format = "{volume}% {icon}";
    format-muted = "";
    on-click = "${getExe' pkgs.coreutils "sleep"} 0.1 && ${getExe pkgs.helvum}";
    format-icons = [
      ""
      ""
      ""
    ];
  };
}

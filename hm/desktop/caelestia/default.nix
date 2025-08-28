{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.caelestia = {
    enable = true;
    settings = {
      appearance = {
        anim.durations.scale = 0;
        font = {
          family = {
            material = "Material Symbols Rounded";
            mono = "${config.stylix.fonts.monospace.name}";
            sans = "${config.stylix.fonts.sansSerif.name}";
          };
          size.scale = 1;
        };
        padding.scale = 1;
        rounding.scale = 0;
        spacing.scale = "0.5";
        transparency = {
          enabled = false;
          base = "1.0";
          layers = "0.4";
        };
      };
      background = {
        desktopClock = {
          enabled = false;
        };
        enabled = true;
        visualiser = {
          enabled = false;
          autohide = true;
          rounding = 0;
          spacing = 0;
        };
      };
      bar = {
        clock.showIcon = true;
        dragThreshold = 20;
        persistent = true;
        showOnHover = true;
        status = {
          showAudio = true;
          showBattery = true;
          showBluetooth = true;
          showKbLayout = false;
          showNetwork = true;
        };
        tray = {
          background = false;
          recolour = false;
        };
        workspaces = {
          activeIndicator = false;
          activeLabel = "󰮯";
          activeTrail = false;
          label = "  ";
          occupiedBg = false;
          occupiedLabel = "󰮯";
          perMonitorWorkspaces = false;
          showWindows = false;
          shown = 5;
        };
      };
      border = {
        rounding = 0;
        thickness = 5;
      };
      dashboard = {
        enabled = true;
        dragThreshold = 50;
        mediaUpdateInterval = 500;
        showOnHover = true;
      };
      launcher = {
        actionPrefix = ">";
        dragThreshold = 50;
        vimKeybinds = false;
        enableDangerousActions = false;
        maxShown = 8;
        maxWallpapers = 9;
        specialPrefix = "@";
        useFuzzy = {
          apps = false;
          actions = false;
          schemes = false;
          variants = false;
          wallpapers = true;
        };
      };
      lock.recolourLogo = false;
      notifs = {
        actionOnClick = false;
        clearThreshold = "0.3";
        defaultExpireTimeout = "5000";
        expandThreshold = 20;
        expire = false;
      };
      osd = {
        enabled = true;
        enableBrightness = true;
        enableMicrophone = false;
        hideDelay = 2000;
      };
      paths = {
        mediaGif = "";
        sessionGif = "";
        wallpaperDir = "~/.dotfiles/wal";
      };
      services = {
        audioIncrement = "0.1";
        defaultPlayer = "Spotify";
        gpuType = "";
        playerAliases = [
        ];
        weatherLocation = "";
        useFarenheit = true;
        useTwelveHourClock = true;
        smartScheme = true;
        visualiserBars = 45;
      };
      session = {
        dragThreshold = 30;
        vimKeybinds = false;
      };
    };
    cli = {
      enable = true;
    };
  };
}

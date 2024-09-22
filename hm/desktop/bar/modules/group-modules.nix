{
  "group/backlight" = {
    orientation = "horizontal";
    drawer = {
      transition-duration = 500;
      transition-left-to-right = false;
    };
    modules = [
      "backlight"
      "backlight/slider"
    ];
  };

  "group/audio" = {
    orientation = "horizontal";
    drawer = {
      transition-duration = 500;
      transition-left-to-right = false;
    };
    modules = [
      "pulseaudio"
      "pulseaudio/slider"
    ];
  };

  "group/power" = {
    orientation = "horizontal";
    drawer = {
      transition-duration = 500;
      children-class = "not-power";
      transition-left-to-right = false;
    };
    modules = [
      "custom/wlogout"
      # "custom/power"
      # "custom/quit"
      # "custom/lock"
      # "custom/reboot"
    ];
  };

  "group/control-center" = {
    orientation = "horizontal";
    modules = [
      "cava"
      "custom/notification"
      "bluetooth"
      "group/audio"
      "battery"
    ];
  };

  "group/tray" = {
    orientation = "horizontal";
    modules = [ "tray" ];
  };

  "group/stats" = {
    orientation = "horizontal";
    modules = [
      "network"
      "cpu"
      "memory"
      "disk"
    ];
  };

  "group/stats-drawer" = {
    orientation = "horizontal";
    drawer = {
      transition-duration = 500;
      transition-left-to-right = false;
    };
    modules = [
      "custom/separator-right"
      "network"
      "cpu"
      "memory"
      "disk"
    ];
  };

  "group/tray-drawer" = {
    orientation = "horizontal";
    drawer = {
      transition-duration = 500;
      transition-left-to-right = false;
    };
    modules = [
      "custom/separator-right"
      "tray"
    ];
  };
}

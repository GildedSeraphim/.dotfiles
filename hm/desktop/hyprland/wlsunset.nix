{ ... }:
{
  services.wlsunset = {
    enable = true;
    sunset = "19:00";
    sunrise = "7:00";
    systemdTarget = "graphical-session.target";
    temperature.day = 6500;
    temperature.night = 4000;
  };

}

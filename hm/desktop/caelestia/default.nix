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
      bar.status = {
        showBattery = true;
      };
      paths.wallpaperDir = "../../../wal";
    };
    cli = {
      enable = true;
    };
  };
}

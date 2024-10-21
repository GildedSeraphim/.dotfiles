{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: {
  hardware.cpu.intel.updateMicrocode = true;
  hardware.enableAllFirmware = true;

  boot.kernelParams = ["nvidia-drm.fbdev=1"];

  boot.kernelModules = ["coretemp"];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  powerManagement.powertop.enable = true;

  services.power-profiles-daemon.enable = false;

  services.thermald.enable = true;

  services.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "performace";
        turbo = "auto";
      };
    };
  };
}

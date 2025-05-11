{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;

  cfg = config.opt.services.nvidia;
in {
  options.opt.services.nvidia.enable = mkEnableOption "nvidia";
  config = mkIf cfg.enable {
    nixpkgs.config.nvidia.acceptLicense = true;

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    services.xserver.videoDrivers = ["nvidia"];

    hardware.nvidia = {
      prime = {
        # Make sure to use the correct Bus ID values for your system!
        amdgpuBusId = "PCI:66:0:0";
        nvidiaBusId = "PCI:65:0:0";
        sync.enable = true;
        # amdgpuBusId = "PCI:54:0:0"; For AMD GPU
      };
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      #package = config.boot.kernelPackages.nvidiaPackages.production;
    };

    hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;

    hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
      version = "575.51.02";
      sha256_64bit = "sha256-XZ0N8ISmoAC8p28DrGHk/YN1rJsInJ2dZNL8O+Tuaa0=";
      sha256_aarch64 = "sha256-NNeQU9sPfH1sq3d5RUq1MWT6+7mTo1SpVfzabYSVMVI=";
      openSha256 = "sha256-NQg+QDm9Gt+5bapbUO96UFsPnz1hG1dtEwT/g/vKHkw=";
      settingsSha256 = "sha256-6n9mVkEL39wJj5FB1HBml7TTJhNAhS/j5hqpNGFQE4w=";
      persistencedSha256 = "sha256-dgmco+clEIY8bedxHC4wp+fH5JavTzyI1BI8BxoeJJI=";
    };
  };
}

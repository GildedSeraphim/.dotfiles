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

    #hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
    #  version = "565.77";
    #  sha256_64bit = "sha256-CnqnQsRrzzTXZpgkAtF7PbH9s7wbiTRNcM0SPByzFHw=";
    #  sha256_aarch64 = "sha256-LSAYUnhfnK3rcuPe1dixOwAujSof19kNOfdRHE7bToE=";
    #  openSha256 = "sha256-Fxo0t61KQDs71YA8u7arY+503wkAc1foaa51vi2Pl5I=";
    #  settingsSha256 = "sha256-VUetj3LlOSz/LB+DDfMCN34uA4bNTTpjDrb6C6Iwukk=";
    #  persistencedSha256 = lib.fakeSha256;
    #};
  };
}

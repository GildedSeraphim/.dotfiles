{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: {
  boot.blacklistedKernelModules = ["k10temp"];
  boot.extraModulePackages = [config.boot.kernelPackages.zenpower];
  boot.kernelModules = [zenpower];
}

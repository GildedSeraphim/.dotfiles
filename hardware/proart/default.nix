{lib, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix
    ./amd.nix
    ./asus.nix
  ];
  opt.services.nvidia.enable = false;
  specialisation = {
    nvidia.configuration = {
      system.nixos.tags = ["nvidia"];
      opt.services.nvidia.enable = lib.mkForce false;
    };
  };
}

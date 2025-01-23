{...}: {
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix
    ./amd.nix
    ./asus.nix
  ];
}

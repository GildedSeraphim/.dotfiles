{ pkgs, config, lib, inputs, ...}:
{
  imports = [
    inputs.xremap-flake.nixosModules.default
  ];

  services.xremap = {
    userName = "sn";
    
  };
}

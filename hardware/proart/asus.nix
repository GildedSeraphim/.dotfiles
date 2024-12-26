{ pkgs, config, ... }:
{
  services.asusd.enable = true;
  services.supergfxd.enable = true;
  services.tlp = {
    enable = true;
  };
}

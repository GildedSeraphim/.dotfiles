{ pkgs, config, ... }:
{
  services.asusd.enable = true;
  services.tlp = {
    enable = true;
  };
}

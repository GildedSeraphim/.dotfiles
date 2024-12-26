{ pkgs, config, ... }:
{
  services.asusd.enable = true;
  services.tlp = {
    enable = true;
  };
  programs.coolercontrol = {
    enable = true;
    nvidiaSupport = true;
  };
}

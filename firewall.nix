{ pkgs, ...}:
{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 80 443];
  };

}

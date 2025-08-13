{
  config,
  pkgs,
  ...
}:
{
  services.syncthing = {
    enable = false;
    openDefaultPorts = true;
    dataDir = "/home/sn/sync";
    configDir = "/home/sn/.config/syncthing";
    user = "sn";
    group = "users";
    settings.gui = {
      user = "user";
      password = "password";
    };
  };
  #localhost 8384

  services.zerotierone = {
    enable = false;
    joinNetworks = [
    ];
  };

  services.openssh = {
    enable = false;
    passwordAuthentication = true;
  };

  networking = {
    nameservers = [ "1.1.1.1" ];
    firewall = {
      enable = true;
      allowedTCPPorts = [ ];
      allowedUDPPorts = [ ];
    };

    wg-quick.interfaces = {
      wg0 = {
        autostart = false;
        address = [ "10.2.0.2/32" ];
        dns = [ "10.2.0.1" ];
        privateKeyFile = "/home/sn/keys/proton.key";
        peers = [
          {
            publicKey = "TaxwFJ2ajJdHlowb91UhfBxl60lsjBicCxC+dE2wDEE=";
            allowedIPs = [ "0.0.0.0/0" ];
            endpoint = "149.22.84.154:51820";
          }
        ];
      };
    };
  };
}

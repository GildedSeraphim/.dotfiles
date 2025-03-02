{
  config,
  pkgs,
  ...
}: {
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

  services.openssh = {
    enable = false;
    passwordAuthentication = true;
  };

  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [];
      allowedUDPPorts = [];
    };

    wg-quick.interfaces = {
      wg0 = {
        autostart = false;
        address = ["10.2.0.2/32"];
        dns = ["10.2.0.1"];
        privateKeyFile = "/home/sn/keys/proton.key";
        peers = [
          {
            publicKey = "80qDNuS6cbRa6m0nxDBaJxz4fU0VRaGWvIa5mGMZ1WI=";
            allowedIPs = ["0.0.0.0/0"];
            endpoint = "149.88.103.38:51820";
          }
        ];
      };
    };
  };
}

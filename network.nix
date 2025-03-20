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
            publicKey = "gucaLaM/mgJQbHVvnZNtW+1L4Mi7E2mtTMrhS0K4miU=";
            allowedIPs = ["0.0.0.0/0"];
            endpoint = "146.70.230.146:51820";
          }
        ];
      };
    };
  };
}

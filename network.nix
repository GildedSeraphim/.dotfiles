{
  config,
  pkgs,
  ...
}: {
  services.syncthing = {
    enable = false;
    openDefaultPorts = true;
    settings.gui = {
      user = "user";
      password = "password";
    };
  };
  #localhost 8384

  services.openssh = {
    enable = true;
    passwordAuthentication = true;
  };

  networking = {
    wg-quick.interfaces = {
      wg0 = {
        autostart = false;
        address = ["10.2.0.2/32"];
        dns = ["10.2.0.1"];
        privateKeyFile = "/home/sn/keys/proton.key";
        peers = [
          {
            publicKey = "8jEgre7McUnWFLvjlQSenvYJgUGISWeNyLonrEupuDA=";
            allowedIPs = ["0.0.0.0/0"];
            endpoint = "146.70.230.114:51820";
          }
        ];
      };
    };
  };
}

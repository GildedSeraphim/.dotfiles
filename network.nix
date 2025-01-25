{
  config,
  pkgs,
  ...
}: {
  services.syncthing = {
    enable = true;
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
            publicKey = "N1o6VqzZtb0UCQvmkZGQj909M1sM3Xb787U0YNyODEw=";
            allowedIPs = ["0.0.0.0/0"];
            endpoint = "146.70.174.66:51820";
          }
        ];
      };
    };
  };
}

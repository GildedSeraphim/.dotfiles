{
  config,
  pkgs,
  ...
}: {
  networking = {
    wg-quick.interfaces = {
      wg0 = {
        autostart = false;
        address = ["10.2.0.2/32"];
        dns = ["10.2.0.1"];
        privateKeyFile = "/home/sn/keys/proton.key";
        peers = [
          {
            publicKey = "rlVvNuYLq3Rsfghyh3ILYLZMifyvlqbIIaUAUlvy2zs=";
            allowedIPs = ["0.0.0.0/0"];
            endpoint = "37.19.199.139:51820";
          }
        ];
      };
    };
  };
}

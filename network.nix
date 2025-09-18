{
  config,
  pkgs,
  lib,
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

  services.dnsmasq = {
    enable = true;
    settings = {
      server = [
        "1.1.1.1"
        "9.9.9.9"
      ];
      all-servers = true; # Send queries to all upstreams in parallel
      no-resolv = true; # Don't use /etc/resolv.conf for upstreams
      log-queries = true; # Optional: log queries to journal
    };
  };

  networking = {
    networkmanager = {
      enable = true;
      dns = lib.mkForce "none"; # Don't let NM touch resolv.conf
      connectionConfig = {
        "ipv4.ignore-auto-dns" = true;
        "ipv6.ignore-auto-dns" = true;
      };
    };

    resolvconf.enable = false; # Don't auto-generate /etc/resolv.conf

    useDHCP = lib.mkForce true;

    dhcpcd = {
      enable = lib.mkForce true;
      extraConfig = ''
        nohook resolv.conf
      '';
    };

    nameservers = [ "127.0.0.1" ]; # Use dnsmasq for DNS

    firewall = {
      enable = true;
      allowedUDPPorts = [ 53 ]; # allow DNS over UDP
      allowedTCPPorts = [ 53 ]; # allow DNS over TCP
    };
    wg-quick.interfaces = {
      wg0 = {
        autostart = false;
        address = [ "10.2.0.2/32" ];
        #dns = [ "10.2.0.1" ];
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

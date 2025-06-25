{
  pkgs,
  config,
  input,
  ...
}: {
  services.asusd.enable = true;
  services.supergfxd.enable = true;
  services.tlp = {
    enable = true;
  };
  services.asus-dialpad-driver = {
    enable = false;
    layout = "proartp16";
    wayland = true;
    ignoreWaylandDisplayEnv = true;
    runtimeDir = "/run/user/1000/";
    waylandDisplay = "wayland-0";
  };
}

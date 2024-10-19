{
  inputs,
  pkgs,
  system,
  ...
}: {
  home.packages = [
    (pkgs.writeShellApplication {
      name = "spot";

      text = ''
        exec spotify --disable-gpu
      '';
    })
    (pkgs.writeShellApplication {
      name = "code";

      text = ''
        exec codium --disable-gpu .
      '';
    })
    (pkgs.writeShellApplication {
      name = "spotify-offline";

      text = ''
        exec firejail --net=none spotify --disable-gpu
      '';
    })
    (pkgs.writeShellApplication {
      name = "glava-vis";
      text = ''
        exec glava &
        glava --force-mod=bars
      '';
    })
  ];
}

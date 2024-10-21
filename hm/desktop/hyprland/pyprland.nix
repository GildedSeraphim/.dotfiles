{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [
    #    inputs.pyprland.packages."${pkgs.system}".pyprland
    pkgs.pyprland
  ];
  xdg.configFile."hypr/pyprland.toml".text = ''
    [pyprland]
    plugins = [
        "scratchpads"
    ]

    [scratchpads.volume]
    animation = ""
    command = "pavucontrol"
    class = "org.pulseaudio.pavucontrol"
    size = "40% 90%"
    unfocus = "hide"
    lazy = true

  '';
}

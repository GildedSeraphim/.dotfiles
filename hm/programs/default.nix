{
  config,
  lib,
  ...
}: {
  imports = [
    ./alacritty
    ./kitty
    #./mako
    ./lf
    ./vscode
    ./btop
    #./nvchad
    ./shell
    ./cava
    ./firefox
    ./glava
    ./nixvim
    ./foot
    ./obs
    ./fastfetch
    #   ./zed
  ];
  opt.terminal.foot.enable = true;
}

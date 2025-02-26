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
    ./ghostty
    #   ./zed
  ];
  opt.terminal.foot.enable = true;
  opt.terminal.ghostty.enable = false;
}

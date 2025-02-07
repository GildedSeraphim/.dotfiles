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
  ];
  opt.terminal.foot.enable = true;
  opt.browser.firefox.enable = false;
}

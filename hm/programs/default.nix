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
    #   ./vscode
    ./btop
    #./nvchad
    ./shell
    ./cava
    #   ./firefox
    ./glava
    ./nixvim
    ./foot
    ./obs
    ./fastfetch
    ./ghostty
    ./librewolf
    #   ./zed
    #   ./music
  ];
  opt.terminal.foot.enable = true;
  opt.terminal.ghostty.enable = false;
  opt.browser.librewolf.enable = true;
}

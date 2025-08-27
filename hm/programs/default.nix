{
  config,
  lib,
  ...
}:
{
  services.vicinae = {
    enable = true; # default: true
    autoStart = true; # default: true
  };

  imports = [
    # ./alacritty
    # ./kitty
    #./mako
    ./lf
    #   ./vscode
    ./btop
    #./nvchad
    ./shell
    ./cava
    #   ./firefox
    ./glava
    ./glance
    #    ./nixvim
    ./foot
    # ./obs
    ./fastfetch
    # ./ghostty
    # ./librewolf
    #   ./zed
    #   ./music
    ./zathura
  ];
  opt.terminal.foot.enable = true;
  # opt.terminal.ghostty.enable = false;
  # opt.browser.librewolf.enable = true;
}

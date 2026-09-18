{
  config,
  lib,
  ...
}:
{
  #services.vicinae = {
  #  enable = true; # default: true
  #  autoStart = true; # default: true
  #};

  imports = [
    # ./alacritty
    # ./kitty
    #./mako
    ./lf
    #   ./vscode
    ./btop
    #./nvchad
    ./shell
    #./cava
    #   ./firefox
    ./glava
    #./glance
    #    ./nixvim
    ./foot
    ./ghostty
    # ./obs
    ./fastfetch
    # ./ghostty
    # ./librewolf
    #   ./zed
    #   ./music
    ./zathura
    ./zed
  ];
  opt.terminal.foot.enable = false;
  opt.terminal.ghostty.enable = true;
  # opt.browser.librewolf.enable = true;
}

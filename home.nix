{ config, pkgs, pkgs-unstable, lib, inputs, outputs, ... }:
{
  home.username = "sn";
  home.homeDirectory = "/home/sn";

  imports = [
    ./hm
    ./scripts.nix
    ./stylix.nix
  ];

  programs.git = {
    enable = true;
    userName = "GildedSeraphim";
    userEmail = "nathanishaaz@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";    
    };
  };
  programs.gh.enable = true;
 
  home.stateVersion = "24.05"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  home.packages = 
  (with pkgs; [
    ladybird
    thefuck
    python312Packages.pip
    jetbrains.pycharm-professional
    inputs.zen.packages.${system}.specific
    fast-cli
    hyprcursor
    eww
    mako
    brightnessctl
    ungoogled-chromium
    pavucontrol
    wget
    steam-run
    zip
    unzip
    mangohud
    protonup
    lutris
#    inputs.nixvim.packages.${system}.default
#    neovim
    vlc
    yt-dlp-light
    ffmpeg
    nvidia-system-monitor-qt
    fzf
    obsidian
    renderdoc
    libreoffice
    qalculate-gtk
    prismlauncher
    gnome-obfuscate
    imagemagick
    bitwarden-desktop
    dejavu_fonts
    firefox
    okular
    zathura
    nsxiv
    nautilus
    geek-life
  ])

  ++

  (with pkgs-unstable; [
    krita
    jetbrains.clion
    r2modman
    nh
    nix-output-monitor
    nvd
    brave
    vesktop
    wine
    winetricks
    protonup-qt
    obs-studio
    nitch
    protontricks
    sl
    nix-tree
  ]);

  fonts.fontconfig.enable = true;
  programs.home-manager.enable = true;
}

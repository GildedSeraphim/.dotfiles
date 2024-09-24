{ config, pkgs, pkgs-unstable, lib, inputs, outputs, nix-colors, ... }:
let
  theme = "gruvbox-dark-hard";
  wallpaper = ./wal/house.jpg;
in
{
  home.username = "sn";
  home.homeDirectory = "/home/sn";

  imports = [
    nix-colors.homeManagerModules.default
    ./hm
    ./scripts.nix
  ];

  stylix.enable = true;

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/${theme}.yaml";

  stylix.image = wallpaper;

  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.name = "Bibata-Modern-Ice";
  
  stylix.fonts = {
    monospace = {
      package = pkgs.nerdfonts.override { fonts = ["JetBrainsMono"];};
      name = "JetBrainsMono Nerd Font Mono";
    };
    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
    };
    serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
    };
  };

  colorScheme = inputs.nix-colors.colorSchemes.${theme};
 
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
    bookworm
    thefuck
    python312Packages.pip
    jetbrains.pycharm-professional
    nerdfonts
    inputs.zen.packages.${system}.specific
    fast-cli
    hyprpanel
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
    mpv
    cava
    spotify-cli-linux
    firefox
    darktable
    bitwarden-desktop
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

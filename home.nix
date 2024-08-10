{ config, pkgs, pkgs-unstable, lib, inputs, outputs, nix-colors, ... }:
{
  home.username = "sn";
  home.homeDirectory = "/home/sn";

  imports = [
    nix-colors.homeManagerModules.default
    ./hm
  ];

  stylix.enable = true;

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/solarized-dark.yaml";

  stylix.image = ./hm/desktop/hyprland/wallpaper.png;

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

  colorScheme = inputs.nix-colors.colorSchemes.solarized-dark;
 
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
    times-newer-roman
    hyprcursor
    eww
    mako
    swww
    rofi-wayland
    qtcreator
    kdePackages.dolphin
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    ranger
    krusader
    brightnessctl
    librewolf
    floorp
    ungoogled-chromium
    esshader
    pavucontrol
    famistudio
    wget
    steam-run
    zip
    unzip
    mangohud
    protonup
    lutris
    ardour
    kdePackages.falkon
#    inputs.nixvim.packages.${system}.default
#    neovim
    vlc
    yt-dlp-light
    ffmpeg
  ])

  ++

  (with pkgs-unstable; [
    krita
    jetbrains.clion
    r2modman
    openrgb
    nh
    nix-output-monitor
    nvd
    brave
    vesktop
    onlyoffice-bin_latest
    wineWow64Packages.staging
    protonup-qt
  ]);
  
  programs.bash.enable = true;
  programs.bash.shellAliases = {
    ll = "ls -l";
    ".." = "cd ..";
    "dot" = "cd /home/sn/.dotfiles/";
    "neo" = "fastfetch";
    "cl" = "clear";
    "fui" = "nix run github:vimjoyer/nix-update-input";
  };

  programs.home-manager.enable = true;
}

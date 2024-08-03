{ config, lib, pkgs, pkgs-unstable, inputs, outputs, ... }:

{
  imports =
    [ 
      ./hardware/laptop/hardware-configuration.nix
      ./hardware/laptop/nvidia.nix
      ./hardware/laptop/laptop.nix
      ./settings.nix
      ./fonts.nix
     ./hyprland.nix
#     ./stylix.nix
    ];

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    bash
    zlib
    nss
    openssl
    curl
    expat
    envfs
  ];


  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = (with pkgs; [
    nix-ld
    envfs

    wget
    steam
    steam-run
    alacritty
    virt-manager
    virt-viewer
    zip
    unzip

    #Gaming
    mangohud
    protonup
    lutris
  ])

  ++
  
  (with pkgs-unstable; [
#    git
    openrgb
    nh
    nix-output-monitor
    nvd
    brave
    spotify
#    ollama-cuda
    vesktop
    fastfetch
    onlyoffice-bin_latest
    nautilus
    wineWow64Packages.staging
    protonup-qt
  ]);

  programs.gamemode.enable = true;

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true; 
    dedicatedServer.openFirewall = true;
  };
  
  system.stateVersion = "24.05";  

  nix.settings.experimental-features = [ "nix-command" "flakes" ];


}


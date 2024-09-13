{ config, lib, pkgs, pkgs-unstable, inputs, outputs, ... }:
let
my-llama =pkgs.alpaca.override {
  ollama = pkgs.ollama-cuda;
};
in
{
  imports =
    [ 
      ./hardware/laptop/hardware-configuration.nix
      ./hardware/laptop/nvidia.nix
      ./hardware/laptop/laptop.nix
      ./settings.nix
      ./fonts.nix
      ./hyprland.nix
      ./firewall.nix
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


  nixpkgs = {
    overlays = [
      (final: prev: {
        nvchad = inputs.nvchad4nix.packages."${pkgs-unstable.system}".nvchad;
      })
    ];
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = (with pkgs; [
    nix-ld
    envfs
  ])

  ++
  
  (with pkgs-unstable; [
    ollama-cuda
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


{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  inputs,
  outputs,
  ...
}: {
  imports = [
    #./hardware/laptop/hardware-configuration.nix
    #./hardware/laptop/nvidia.nix
    #./hardware/laptop/laptop.nix
    ./hardware/desktop/nvidia.nix
    ./hardware/desktop/hardware-configuration.nix
    ./settings.nix
    ./fonts.nix
    ./hyprland.nix
    #./hardware/keyboard/default.nix
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
  environment.systemPackages =
    (with pkgs; [
      nix-ld
      envfs
      calf
      qjackctl
      easyeffects
    ])
    ++ (with pkgs-unstable; [
      nix-init
    ]);
}

{
  pkgs,
  pkgs-unstable,
  ...
}: {
  imports = [
    #./hardware/laptop/hardware-ea::onfiguration.nix
    #./hardware/laptop/nvidia.nix
    #./hardware/laptop/laptop.nix
    ./hardware/desktop/nvidia.nix
    ./hardware/desktop/hardware-configuration.nix
    ./settings.nix
    ./fonts.nix
    ./hyprland.nix
    #    ./hardware/keyboard/default.nix
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
    virt-manager
    virt-viewer
    virtiofsd
  ];

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
      ollama-cuda
    ]);
}

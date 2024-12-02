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
#    ./network.nix
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
      wireguard-tools
      #erosanix.packages."${pkgs.system}".foobar2000
      nix-ld
      envfs
      calf
      qjackctl
      easyeffects
      waydroid
    ])
    ++ (with pkgs-unstable; [
      ollama-cuda
    ]);
}

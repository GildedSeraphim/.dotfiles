{
  pkgs,
  pkgs-unstable,
  inputs,
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
    ./network.nix
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

  # packageOverrides = pkgs-unstable: {
  #  alpaca = pkgs-unstable.alpaca.override{
  #    ollama = pkgs-unstable.ollama-cuda;
  #  };
  #};

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages =
    (with pkgs; [
      wireguard-tools
      inputs.erosanix.packages."${pkgs.system}".foobar2000
      #inputs.erosanix.packages."${pkgs.system}".nvidia-offload
      nix-ld
      envfs
      calf
      qjackctl
      easyeffects
      waydroid
      alejandra
      nixd
    ])
    ++ (with pkgs-unstable; [
      ollama-cuda
    ]);
  services.open-webui = {
    enable = true;
  };
}

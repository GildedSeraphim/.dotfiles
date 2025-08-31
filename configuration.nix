{
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}:
{
  imports = [
    #./hardware/laptop/hardware-configuration.nix
    #./hardware/laptop/nvidia.nix
    #./hardware/laptop/laptop.nix
    ./hardware/desktop/nvidia.nix
    ./hardware/desktop/hardware-configuration.nix
    ./settings.nix
    ./fonts.nix
    ./hyprland.nix
    ./network.nix
    #./hardware/rog-strix/laptop.nix
    #./hardware/rog-strix/nvidia.nix
    #./hardware/rog-strix/hardware-configuration.nix
    #./hardware/keyboard
    ./hardware/proart
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
  nixpkgs.config.nvidia.acceptLicense = true;
  programs.droidcam.enable = true;
  services.usbmuxd.enable = true;
  environment.systemPackages =
    (with pkgs; [
      wireguard-tools
      #     inputs.erosanix.packages."${pkgs.system}".foobar2000
      #inputs.erosanix.packages."${pkgs.system}".nvidia-offload
      nix-ld
      envfs
      calf
      qjackctl
      easyeffects
      waydroid
      alejandra
      nixd
      lm_sensors
      lact
      acpi
      nvtopPackages.full
      parted
      steamcmd
      fh
      libnotify
    ])
    ++ (with pkgs-unstable; [
      # ollama-cuda
    ]);
  services.open-webui = {
    enable = false;
    #localhost/8080
  };
}

{
  config,
  lib,
  pkgs,
  ...
}: {
  nixpkgs.config.nvidia.acceptLicense = true;
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [nvidia-vaapi-driver];
  };

  environment.systemPackages = with pkgs; [
    nvidia-vaapi-driver
    libva-utils
    vdpauinfo
    vulkan-tools
    vulkan-validation-layers
    libvdpau-va-gl
    egl-wayland
    wgpu-utils
    mesa
    libglvnd
    nvtopPackages.full
    nvitop
    libGL
    intel-media-driver
  ];

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
  };
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.latest;

  #  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
  #   version = "555.58";
  #  sha256_64bit = "sha256-bXvcXkg2kQZuCNKRZM5QoTaTjF4l2TtrsKUvyicj5ew=";
  #  sha256_aarch64 = "sha256-7XswQwW1iFP4ji5mbRQ6PVEhD4SGWpjUJe1o8zoXYRE=";
  #  openSha256 = "sha256-hEAmFISMuXm8tbsrB+WiUcEFuSGRNZ37aKWvf0WJ2/c=";
  #  settingsSha256 = "sha256-vWnrXlBCb3K5uVkDFmJDVq51wrCoqgPF03lSjZOuU8M=";
  #  persistencedSha256 = lib.fakeSha256;
  #};
}

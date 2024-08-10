{ config, lib, pkgs, pkgs-unstable, inputs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  xdg.portal.config = {
    common.default = ["gtk"];
    hyprland.default = [ "gtk" "hyprland" ];
  };
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ 
    pkgs.xdg-desktop-portal-gtk
    pkgs.xdg-desktop-portal-wlr
  ];
  services.displayManager.sddm.enable = true;
  services.xserver.enable = true;
  
  nix.settings.auto-optimise-store = true;

  environment.sessionVariables = {
    FLAKE = "/home/sn/.dotfiles";
    NIXOS_CONFIG = "/home/sn/.dotfiles/";
    NIXOS_OZONE_WL = "1";    
    STEAM_EXTRA_COMPAT_TOOLS_PATH =
      "/home/sn/.steam/root/compatibilitytools.d";
    VK_DRIVER_FILES = 
      "/run/opengl-driver/share/vulkan/icd.d/nvidia_icd.x86_64.json";
  };

  services.devmon.enable = true;
  services.udisks2.enable = true;
  programs.xfconf.enable = true;
  services.gvfs.enable = true;
  services.tumbler.enable = true;

  networking.networkmanager.enable = true; 

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  services.flatpak.enable = true;

  time.timeZone = "America/Chicago";  

#  hardware.pulseaudio.enable = true;

  programs = {
    adb.enable = true;
    dconf.enable = true;
    steam.enable = true;
    xwayland.enable = true;
    zsh = {
      enable = true;
      enableCompletion = false;
    };
    fish.enable = true;
  };
 
  users.users.sn = {
    isNormalUser = true;
    shell = pkgs.bash;
    initialPassword = "password";
    extraGroups = [ "wheel" "video" "audio" "networkmanager" "lp" "scanner" "libvirtd" "libvirt" ]; 
    packages = with pkgs; [
    ];
  };

  programs.noisetorch.enable = true;

  hardware.opentabletdriver.enable = true;
  hardware.opentabletdriver.daemon.enable = true;

  programs.virt-manager.enable = true;
  boot.kernelModules = ["kvm-amd" "kvm-intel"];

  virtualisation.libvirtd = {
  enable = true;
  qemu = {
    package = pkgs.qemu_kvm;
    runAsRoot = true;
    swtpm.enable = true;
    ovmf = {
      enable = true;
      packages = [(pkgs.OVMF.override {
        secureBoot = true;
        tpmSupport = true;
      }).fd];
    };
  };
};
}

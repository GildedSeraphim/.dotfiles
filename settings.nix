{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
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
    jack.enable = true;
  };
  programs.noisetorch.enable = true;

  hardware.enableAllFirmware = true;

  qt.enable = false;

   xdg.portal.config = {
     common.default = ["gtk"];
     hyprland.default = ["gtk" "hyprland"];
   };
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-gtk
    pkgs.xdg-desktop-portal-wlr
  ];
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.sddm.autoNumlock = true;
  services.xserver.enable = true;

  nix.settings.auto-optimise-store = true;
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
  environment.sessionVariables = {
    NH_FLAKE = "/home/sn/.dotfiles";
    NIXOS_CONFIG = "/home/sn/.dotfiles/";
    NIXOS_OZONE_WL = "1";
    STEAM_EXTRA_COMPAT_TOOLS_PATH = "/home/sn/.steam/root/compatibilitytools.d";
    #    VK_DRIVER_FILES = "/run/opengl-driver/share/vulkan/icd.d/nvidia_icd.x86_64.json";
    CUDA_VISIBLE_DEVICES = 0;
  };

  programs.gamemode.enable = true;

  programs.java.enable = true;

  programs.bash = {
    shellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  system.stateVersion = "24.05";

  nix.settings.experimental-features = ["nix-command" "flakes"];

  #  services.devmon.enable = true;
  # services.udisks2.enable = true;
  # programs.xfconf.enable = true;
  # services.gvfs.enable = true;
  # services.tumbler.enable = true;

  networking.networkmanager.enable = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  services.solaar.enable = true;

  services.flatpak.enable = true;

  time.timeZone = "America/Chicago";

  #  hardware.pulseaudio.enable = true;

  programs = {
    dconf.enable = true;
    xwayland.enable = true;
    zsh = {
      enable = true;
      enableCompletion = false;
    };
    fish.enable = true;
  };

  #  nix.settings = {
  #use-sandbox = true;
  # show-trace = true;

  #system-features = ["big-parallel" "kvm" "recursive-nix"];
  # sandbox-paths = ["/bin/sh=${pkgs.busybox-sandbox-shell.out}/bin/busybox"];
  # trustedUsers = ["root" "sn"];
  # };
  users.users.sn = {
    isNormalUser = true;
    shell = pkgs.fish;
    initialPassword = "password";
    extraGroups = ["wheel" "video" "audio" "networkmanager" "lp" "scanner" "libvirtd" "libvirt" "uinput" "usbmux"];
    packages = with pkgs; [
    ];
  };

  # DISABLE CUPS DUE TO 9.9 CVE
  #services.printing.browsed.enable = false;
  services.avahi.enable = lib.mkForce false;
  services.printing.enable = lib.mkForce false;
  services.pulseaudio.zeroconf.publish.enable = false;
  services.pulseaudio.zeroconf.discovery.enable = false;
  services.gnome.core-shell.enable = false;
  services.shairport-sync.enable = false;
  services.printing.cups-pdf.enable = false;
  services.printing.startWhenNeeded = false;
  services.printing.browsing = false;
  # --------------------------

  #  hardware.opentabletdriver.enable = false;
  #hardware.opentabletdriver.daemon.enable = false;

  #  programs.virt-manager.enable = true;
  # boot.kernelModules = ["kvm-amd" "kvm-intel"];

  programs.firejail.enable = true;
  programs.firejail.wrappedBinaries = {
    librewolf = {
      executable = "${pkgs.lib.getBin pkgs.librewolf}";
      profile = "${pkgs.firejail}/etc/firejail/firefox.profile";
    };
  };

  services.clamav.daemon.enable = true;
  services.clamav.updater.enable = true;

  # virtualisation.libvirtd = {
  #  enable = true;
  #  qemu = {
  #    package = pkgs.qemu_kvm;
  #    runAsRoot = true;
  #    swtpm.enable = true;
  #    ovmf = {
  #      enable = true;
  #      packages = [
  #        (pkgs.OVMF.override {
  #          secureBoot = true;
  #         tpmSupport = true;
  #         })
  #        .fd
  #      ];
  #    };
  #  };
  #};
}

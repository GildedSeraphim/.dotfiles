{
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}: {
  home.username = "sn";
  home.homeDirectory = "/home/sn";

  imports = [
    ./hm
    ./scripts.nix
    ./stylix.nix
  ];

  programs.git = {
    enable = true;
    userName = "GildedSeraphim";
    userEmail = "nathanishaaz@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
  programs.gh.enable = true;

  home.stateVersion = "24.05"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  home.packages =
    (with pkgs; [
      inputs.nixvim.packages.${system}.default
      unityhub
      gimp-with-plugins
      thefuck
      python312Packages.pip
      jetbrains.pycharm-professional
      inputs.zen.packages.${system}.generic
      fast-cli
      hyprcursor
      eww
      mako
      brightnessctl
      ungoogled-chromium
      pavucontrol
      wget
      steam-run
      zip
      unzip
      mangohud
      protonup
      lutris
      vlc
      yt-dlp-light
      ffmpeg
      nvidia-system-monitor-qt
      fzf
      obsidian
      #      renderdoc
      libreoffice
      qalculate-gtk
      prismlauncher
      gnome-obfuscate
      imagemagick
      bitwarden-desktop
      dejavu_fonts
      firefox
      okular
      zathura
      nsxiv
      nautilus
      geek-life
      texliveMedium
      audacious
    ])
    ++ (with pkgs-unstable; [
      krita
      r2modman
      nh
      nix-output-monitor
      nvd
      brave
      vesktop
      winetricks
      protonup-qt
      obs-studio
      nitch
      sl
      nix-tree
      wineWowPackages.waylandFull
      bottles
      jetbrains.rider
    ]);

  fonts.fontconfig.enable = true;
  programs.home-manager.enable = true;
}

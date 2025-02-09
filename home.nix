{
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}: let
  reaperfm =
    pkgs.runCommand "reaper" {
      buildInputs = [pkgs.makeWrapper];
    } ''
      mkdir $out
      # Link every top-level folder from pkgs.hello to our new target
      ln -s ${pkgs.reaper}/* $out
      # Except the bin folder
      rm $out/bin
      mkdir $out/bin
      # We create the bin folder ourselves and link every binary in it
      ln -s ${pkgs.reaper}/bin/* $out/bin
      # Except the hello binary
      rm $out/bin/reaper
      # Because we create this ourself, by creating a wrapper
      makeWrapper ${pkgs.reaper}/bin/reaper $out/bin/reaper \
        --set GDK_BACKEND x11 \
    '';
in {
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
    userEmail = "snathani@protonmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
  programs.gh.enable = true;

  home.stateVersion = "24.05"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  home.packages =
    (with pkgs; [
      lazygit
      tree
      kdenlive
      protonmail-desktop
      unityhub
      thefuck
      python312Packages.pip
      inputs.zen.packages.${system}.default
      fast-cli
      hyprcursor
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
      okular
      zathura
      nsxiv
      nautilus
      texliveFull
      texlivePackages.xfrac
      texlivePackages.newpx
      texlivePackages.newtx
      texlivePackages.newtxsf
      texlivePackages.eulerpx
      texlivePackages.pagella-otf
      texlivePackages.pxfonts
      texlivePackages.sectsty

      xfce.thunar
      xfce.thunar-volman
      xfce.thunar-media-tags-plugin
      xfce.thunar-archive-plugin

      zotero
      calibre

      jetbrains.clion

      # renderdoc
      #spirv-tools
      python313Packages.ds4drv
      reaperfm

      # icons
      adwaita-icon-theme
      gnome-icon-theme
      hicolor-icon-theme
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
      nitch
      sl
      nix-tree
      wineWowPackages.waylandFull
    ]);

  fonts.fontconfig.enable = true;
  programs.home-manager.enable = true;
}

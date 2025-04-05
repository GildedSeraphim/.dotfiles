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
      inputs.zen.packages.${system}.twilight
      fast-cli
      hyprcursor
      brightnessctl
      ungoogled-chromium
      pavucontrol
      wget
      steam-run
      zip
      unzip
      mangohud
      protonup
      vlc
      fzf
      obsidian
      #      renderdoc
      libreoffice
      qalculate-gtk
      prismlauncher
      imagemagick
      bitwarden-desktop
      zathura
      nsxiv
      xfce.thunar
      xfce.thunar-volman
      xfce.thunar-media-tags-plugin
      xfce.thunar-archive-plugin

      zotero
      calibre

      reaperfm

      # icons
      adwaita-icon-theme
      gnome-icon-theme
      hicolor-icon-theme
      cryptomator
      comic-mandown

      teams-for-linux
      onedrive
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
      kdePackages.kdenlive

      nix-tree
      wineWowPackages.waylandFull
    ]);

  fonts.fontconfig.enable = true;
  programs.home-manager.enable = true;
}

{ config, pkgs, pkgs-unstable, lib, inputs, outputs, nix-colors, ... }:
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "sn";
  home.homeDirectory = "/home/sn";

  imports = [
    nix-colors.homeManagerModules.default
    ./hm
#    (import stylix).homeManagerModules.stylix
    #./stylix.nix
  ];
    stylix.enable = true;

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

  stylix.image = ./hm/desktop/hyprland/wallpaper.png;

  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.name = "Bibata-Modern-Ice";
  
  stylix.fonts = {
    monospace = {
      package = pkgs.nerdfonts.override { fonts = ["JetBrainsMono"];};
      name = "JetBrainsMono Nerd Font Mono";
    };
    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
    };
    serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
    };
  };

  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;
 
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
    hyprcursor
    eww
    mako
    swww
    rofi-wayland
    qtcreator
    kdePackages.dolphin
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    ranger
    krusader
  ])

  ++

  (with pkgs-unstable; [
    krita
    jetbrains.clion
  ]);
  
  home.file = {

  };

  home.sessionVariables = {

  };

  programs.bash.enable = true;
  programs.bash.shellAliases = {
    ll = "ls -l";
    ".." = "cd ..";
    "dot" = "cd /home/sn/.dotfiles/";
    "neo" = "fastfetch";
    "cl" = "clear";
    "fui" = "nix run github:vimjoyer/nix-update-input";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

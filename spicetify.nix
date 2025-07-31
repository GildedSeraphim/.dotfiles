{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in {
  #   home.packages = [ pkgs.spotify ];

  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      betterGenres
      fullAlbumDate
      # copyToClipboard
      volumePercentage
      keyboardShortcut
    ];
    enabledCustomApps = with spicePkgs.apps; [
      marketplace
      reddit
    ];
    enabledSnippets = with spicePkgs.snippets; [
      #      rotating-cover-art
      #      hide-playing-gif
      #      oneko
      #      Hide-Full-Screen-Button
      spinningCdCoverArt
    ];
    theme = lib.mkForce spicePkgs.themes.sleek;
    colorScheme = "Coral";

    customColorScheme = with config.lib.stylix.colors; {
      # "text" = "${magenta}";
      # "subtext" = "${base05}";
      # "nav-active-text" = "${base00}";
      # "main" = "${base00}";
      # "sidebar" = "${base00}";
      # "player" = "${base00}";
      # "card" = "${base00}";
      # "shadow" = "${base02}";
      # "main-secondary" = "${base01}";
      # "button" = "${orange}";
      # "button-secondary" = "${bright-cyan}";
      # "button-active" = "${orange}";
      # "button-disabled" = "${base0D}";
      # "nav-active" = "${magenta}";
      # "play-button" = "${green}";
      # "tab-active" = "${yellow}";
      # "notification" = "${base00}";
      # "notification-error" = "${red}";
      # "playback-bar" = "${bright-green}";
      # "misc" = "${bright-magenta}";
      "accent" = "${base08}";
      "accent-active" = "${base07}";
      "accent-inactive" = "${base00}";
      "banner" = "${base07}";
      "border-active" = "${base07}";
      "border-inactive" = "${base01}";
      "header" = "${base03}";
      "highlight" = "${base03}";
      "main" = "${base00}";
      "notification" = "${base0A}";
      "notification-error" = "${base0B}";
      "subtext" = "${base04}";
      "text" = "${base06}";
    };
  };
}

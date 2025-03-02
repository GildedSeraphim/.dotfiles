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
      shuffle # shuffle+ (special characters are sanitized out of extension names)
      keyboardShortcut
      betterGenres
      fullAlbumDate
      copyToClipboard
      volumePercentage
      keyboardShortcut
      oldSidebar
    ];
    enabledCustomApps = with spicePkgs.apps; [
      lyricsPlus
      marketplace
      reddit
      betterLibrary
    ];
    enabledSnippets = with spicePkgs.snippets; [
      #      rotating-cover-art
      #      hide-playing-gif
      #      oneko
      #      Hide-Full-Screen-Button
      spinningCdCoverArt
    ];
    theme = lib.mkForce spicePkgs.themes.sleek;
    colorScheme = "custom";

    customColorScheme = with config.lib.stylix.colors; {
      "text" = "${magenta}";
      "subtext" = "${base05}";
      "nav-active-text" = "${base00}";
      "main" = "${base00}";
      "sidebar" = "${base00}";
      "player" = "${base00}";
      "card" = "${base00}";
      "shadow" = "${base02}";
      "main-secondary" = "${base01}";
      "button" = "${orange}";
      "button-secondary" = "${bright-cyan}";
      "button-active" = "${orange}";
      "button-disabled" = "${base0D}";
      "nav-active" = "${magenta}";
      "play-button" = "${green}";
      "tab-active" = "${yellow}";
      "notification" = "${base00}";
      "notification-error" = "${red}";
      "playback-bar" = "${bright-green}";
      "misc" = "${bright-magenta}";
    };
  };
}

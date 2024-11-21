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
      pointer
      #      rotating-cover-art
      #      hide-playing-gif
      #      oneko
      #      Hide-Full-Screen-Button
      spinningCdCoverArt
    ];
    theme = lib.mkForce spicePkgs.themes.text;
    # colorScheme = lib.mkForce "CatppuccinMocha";

    customColorScheme = with config.lib.stylix.colors; {
      text = "${base05}";
      subtext = "${base04}";
      sidebar-text = "${base04}";
      main = "${base00}";
      sidebar = "${base01}";
      player = "${base02}";
      card = "${base01}";
      shadow = "${base00}";
      selected-row = "${base0D}";
      button = "${base03}";
      button-active = "${base0D}";
      button-disabled = "${base0D}";
      tab-active = "${base0D}";
      notification = "${base0A}";
      notification-error = "${base08}";
      misc = "${base09}";
    };
  };
}

{ pkgs, config, lib, inputs, ... }:

{
  imports = [inputs.ags.homeManagerModules.default];
  programs.ags = {
    enable = true;

    configDir = ./.;

    # additional packages to add to GJS's runtime
    extraPackages = with pkgs; [ gtksourceview webkitgtk accountsservice ];
  };

  home.file."/home/sn/.dotfiles/hm/desktop/ags/css/ags-variables.scss" =
  {
    text = ''
      $backgroundColor: ${config.colorScheme.colors.base00};
      $backgroundColor2: ${config.colorScheme.colors.base01};
      $highlightColor: ${config.colorScheme.colors.base03};
      $foregroundColor: ${config.colorScheme.colors.base04};
      $foregroundColor2: ${config.colorScheme.colors.base05};
      $wallpaperPath: /home/sn/.dotfiles/hm/desktop/hyprland/wallpapers/spider.jpg;
    '';
  };

  home.packages = with pkgs; [
    bun
  ];


 #   {
 #     text = ''
 #       $backgroundColor: ${osConfig.masterOptions.joe.backgroundRgbaColor};
 #       $backgroundColor2: ${osConfig.masterOptions.joe.background2RgbaColor};
 #       $highlightColor: ${osConfig.masterOptions.joe.highlightHexColor};
 #       $foregroundColor: ${osConfig.masterOptions.joe.foregroundHexColor};
 #       $foregroundColor2: ${osConfig.masterOptions.joe.foregroundHexColor};
 #       $wallpaperPath: url("file://${osConfig.masterOptions.joe.wallpaperPath}");
 #     '';
 #   };
}


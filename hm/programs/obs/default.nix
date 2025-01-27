{pkgs, ...}: {
  home.packages = with pkgs; [
  ];

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-vkcapture
      obs-tuna
      obs-shaderfilter
      obs-nvfbc
    ];
  };
}

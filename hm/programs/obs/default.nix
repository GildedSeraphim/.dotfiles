{pkgs, ...}: {
  home.packages = with pkgs; [
  ];

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
    ];
  };
}

{...}: {
  imports = [
    ./plugins
    ./core
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    clipboard.providers.wl-copy.enable = true;

    colorschemes.catppuccin.enable = true;
    plugins = {
      lualine = {
        enable = true;
      };
    };
  };
}

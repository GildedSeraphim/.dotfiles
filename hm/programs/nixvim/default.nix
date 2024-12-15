{...}: {
  imports = [
    ./plugins
    #  ./core
    ./keybinds.nix
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
    opts = {
      relativenumber = true;
      number = true;

      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      autoindent = true;

      wrap = false;

      ignorecase = true;
      smartcase = true;

      cursorline = true;

      termguicolors = true;
      background = "dark";
      signcolumn = "yes";

      backspace = "indent,eol,start";

      splitright = true;
      splitbelow = true;

      swapfile = false;

      laststatus = 3;
    };
  };
}

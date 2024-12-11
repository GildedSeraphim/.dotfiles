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
    opts = {
      relativenumber = true;
      number = true;

      tabstop = 4;
      shiftwidth = 4;
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

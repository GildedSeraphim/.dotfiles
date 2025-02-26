{...}: {
  programs.nixvim.plugins = {
    zig = {
      enable = true;
      settings = {
        fmt_autosave = 0;
      };
    };
  };
}

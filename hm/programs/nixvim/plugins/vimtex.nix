{...}: {
  programs.nixvim = {
    plugins = {
      #cmp-vimtex.enable = true;
      #cmp-latex-symbols.enable = true;
      vimtex = {
        enable = true;
        settings = {
          compiler_method = "texi2pdf";
          toc_config = {
            split_pos = "vert topleft";
            split_width = 40;
          };
          view_method = "zathura";
        };
      };
    };
  };
}

{...}: {
  programs.nixvim = {
    plugins = {
      #cmp-vimtex.enable = true;
      #cmp-latex-symbols.enable = true;

      vimtex = {
        enable = true;
        settings = {
          compiler_method = "latexmk";
          toc_config = {
            split_pos = "vert topleft";
            split_width = 40;
          };
          view_method = "zathura";
          conceallevel = 1;
          tex_conceal = "abdmg";
        };
      };
    };
  };
}

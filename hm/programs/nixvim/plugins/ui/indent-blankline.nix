{...}: {
  programs.nixvim = {
    plugins = {
      indent-blankline = {
        enable = true;
        settings = {
          exclude = {
            buftypes = [
              "terminal"
              "quickfix"
            ];
            filetypes = [
              ""
              "checkhealth"
              "help"
              "lspinfo"
              "packer"
              "TelescopePrompt"
              "TelescopeResults"
              "yaml"
            ];
          };
          indent = {
            char = "│";
          };
          scope = {
            show_end = false;
            show_exact_scope = true;
            show_start = false;
          };
        };
      };
    };
  };
}

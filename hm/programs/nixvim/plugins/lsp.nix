{
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        inlayHints = true;

        keymaps = {
          silent = true;
          diagnostic = {
            # Navigate in diagnostics
            "<leader>k" = "goto_prev";
            "<leader>j" = "goto_next";
          };

          lspBuf = {
            gd = "definition";
            gD = "references";
            gt = "type_definition";
            gi = "implementation";
            K = "hover";
            "<F2>" = "rename";
          };
        };

        servers = {
          gopls.enable = true;
          golangci_lint_ls.enable = true;
          lua_ls.enable = true;
          nixd = {
            enable = true;
            extraOptions = { offset_encoding = "utf-8"; };
          };
          pyright.enable = true;
          pylsp.enable = true;
          tflint.enable = true;
          templ.enable = true;
          html.enable = true;
          htmx.enable = true;
          tailwindcss.enable = true;
          clangd.enable = true;
          glsl_analyzer.enable = true;
          glslls.enable = true;
        };
      };
    };
  };
}

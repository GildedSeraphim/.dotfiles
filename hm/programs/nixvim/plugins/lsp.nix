{
  programs.nixvim.plugins = {
    lsp-format.enable = true;
    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        bashls.enable = true;
        clangd.enable = true;
        gopls.enable = true;
        eslint.enable = true;
        ts_ls.enable = true;
        nixd = {
          enable = true;
          extraOptions = {
            expr = "import <nixpkgs> {}";
            offset_encoding = "utf-8";
          };
        };
        tailwindcss.enable = true;
        html.enable = true;
        svelte.enable = true;
        marksman.enable = true;
        texlab.enable = true;
        glsl_analyzer.enable = true;
      };
      keymaps.lspBuf = {
        "gd" = "definition";
        "gD" = "references";
        "gt" = "type_definition";
        "gi" = "implementation";
        "K" = "hover";
      };
    };
    none-ls = {
      enable = true;
      sources = {
        diagnostics = {
          golangci_lint.enable = true;
          statix.enable = true;
        };
        formatting = {
          gofmt.enable = true;
          goimports.enable = true;
          alejandra.enable = true;
          markdownlint.enable = true;
          tidy.enable = true;
          shellharden.enable = true;
          shfmt.enable = true;
          golines.enable = true;
          gofumpt.enable = true;
        };
      };
    };
  };
}

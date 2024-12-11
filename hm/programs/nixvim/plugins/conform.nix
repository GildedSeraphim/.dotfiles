{...}: {
  programs.nixvim = {
    plugins = {
      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft = {
            cpp = ["clang-format"];
            lua = ["stylua"];
            python = ["isort" "black"];
            javascript = {
              __unkeyed-1 = "prettierd";
              __unkeyed-2 = "prettier";
              stop_after_first = true;
            };
            "*" = ["codespell"];
            "_" = ["trim_whitespace"];
            nix = ["alejandra"];
          };
          default_format_opts = {
            lsp_format = "fallback";
          };

          log_level = "error";

          format_on_save = {
            lsp_format = "fallback";
            timeout_ms = 500;
          };
          format_after_save = {
            lsp_format = "fallback";
          };

          notify_on_error = true;
          notify_no_formatters = true;
        };
      };
    };
  };
}

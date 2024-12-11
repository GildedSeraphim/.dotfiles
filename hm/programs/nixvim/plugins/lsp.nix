{...}: {
  programs.nixvim.plugins.lsp = {
    enable = true;
    inlayHints = true;
    servers = {
      lua-ls = {
        enable = true;
      };
      pylsp = {
        enable = true;
      };
      nixd = {
        enable = true;
        extraOptions = {
          offset_encoding = "utf-8";
        };
      };
      clangd = {
        enable = true;
      };
    };
  };
}

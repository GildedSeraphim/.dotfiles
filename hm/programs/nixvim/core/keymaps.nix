{...}: {
  programs.nixvim = {
    keymaps = [
      #
      # Plugin Keybinds
      #
      {
        # show definitions, references
        mode = ["n"];
        key = "gR";
        action = "<cmd>Telescope lsp_references<CR>";
      }
      {
        # go to declaration
        mode = ["n"];
        key = "gD";
        action = "vim.lsp.buf.declaration";
        options = {
        };
      }
    ];
  };
}

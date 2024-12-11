{...}: {
  programs.nixvim = {
    plugins = {
      obsidian = {
        enable = true;
        settings = {
          #completion = {
          #  min_chars = 2;
          #  nvim_cmp = true;
          #};
          new_notes_location = "current_dir";
          workspaces = [
            {
              name = "neovim-test";
              path = "~/dox//Obsidian/neovim-test";
            }
          ];
        };
      };
    };
  };
}

{...}: {
  programs.nixvim = {
    plugins = {
      neo-tree = {
        enable = true;
        enableGitStatus = true;
        enableDiagnostics = true;
        enableModifiedMarkers = true;
        enableRefreshOnWrite = true;
        popupBorderStyle = "rounded";
        container = {
          enableCharacterFade = true;
        };
        gitStatus = {
          added = "+";
          modified = "";
          deleted = "✖";
          renamed = "󰁕";
          untracked = "";
          ignored = "";
          unstaged = "󰄱";
          staged = "";
          conflict = "";
        };
        indent = {
          indent_size = 2;
          padding = 1;
          with_markers = true;
          indent_marker = "│";
          last_indent_marker = "└";
          highlight = "NeoTreeIndentMarker";
          with_expanders = null;
          expander_collapsed = "";
          expander_expanded = "";
          expander_highlight = "NeoTreeExpander";
        };
        icon = {
          folder_closed = "";
          folder_open = "";
          folder_empty = "󰜌";
          default = "*";
          highlight = "NeoTreeFileIcon";
        };
        window = {
          position = "left";
          width = 30;
          mapping_options = {
            noremap = true;
            nowait = true;
          };
        };
      };
    };
  };
}

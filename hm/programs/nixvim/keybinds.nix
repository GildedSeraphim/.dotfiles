{
  programs.nixvim = {
    globals = {
      maplocalleader = " ";
      mapleader = " ";
    };
    keymaps = [
      {
        action = ":nohl<CR>";
        key = "<leader>nh";
        mode = [ "n" ];
      }
      {
        # delete a single character without copying into register
        action = ''"_x'';
        key = "x";
        mode = [ "n" ];
      }
      {
        # increment/decrement numbers
        action = "<C-a>";
        key = "<leader>+";
        mode = [ "n" ];
      }
      {
        action = "<C-x>";
        key = "<leader>-";
        mode = [ "n" ];
      }

      # window management
      {
        action = "<C-w>v";
        key = "<leader>sv";
        mode = [ "n" ];
      }
      {
        action = "<C-w>s";
        key = "<leader>sh";
        mode = [ "n" ];
      }
      {
        action = "<C-w>=";
        key = "<leader>se";
        mode = [ "n" ];
      }
      {
        action = ":close<CR>";
        key = "<leader>cs";
        mode = [ "n" ];
      }
      {
        action = ":tabnew<CR>";
        key = "<leader>nt";
        mode = [ "n" ];
      }
      #  {
      #    action = ":BufferClose<CR>";
      #    key "<C-q>";
      #    mode = [ "n" ];
      #  }
      {
        action = ":tabn<CR>";
        key = "<leader>tn";
        mode = [ "n" ];
      }
      {
        action = "tabp<CR>";
        key = "<leader>tp";
        mode = [ "n" ];
      }

      # Plugin Keybinds
      # Telescope search (live grep)
      {
        action = ":Telescope live_grep<CR>";
        key = "<leader>sg";
        options = {
          silent = true;
          noremap = true;
          desc = "Search grep";
        };
      }
      # Telescope search buffers
      {
        action = ":Telescope buffers<CR>";
        key = "<leader>sb";
        options = {
          silent = true;
          noremap = true;
          desc = "Search buffers";
        };
      }
      # Telescope buffer
      {
        action = ":Telescope current_buffer_fuzzy_find<CR>";
        key = "<leader>b";
        options = {
          silent = true;
          noremap = true;
          desc = "Search current buffer";
        };
      }
      # Telescope search commands
      {
        action = ":Telescope command_history<CR>";
        key = "<leader>sc";
        options = {
          silent = true;
          noremap = true;
          desc = "Search commands";
        };
      }
      # Telescope search files
      {
        action = ":Telescope find_files<CR>";
        key = "<leader>sf";
        options = {
          silent = true;
          noremap = true;
          desc = "Search files";
        };
      }
      # Telescope search commands
      {
        action = ":Telescope commands<CR>";
        key = "<leader>sc";
        options = {
          silent = true;
          noremap = true;
          desc = "Search commands";
        };
      }
      # Telescope diagnostics
      {
        action = ":Telescope diagnostics<CR>";
        key = "<leader>d";
        options = {
          silent = true;
          noremap = true;
          desc = "Diagnostics";
        };
      }
      # Telescope quickfixlist
      {
        action = ":Telescope quickfix<CR>";
        key = "<leader>ql";
        options = {
          silent = true;
          noremap = true;
          desc = "Quickfix list";
        };
      }
      # Telescope undo tree
      {
        action = ":Telescope undo<CR>";
        key = "<leader>u";
        options = {
          silent = true;
          noremap = true;
          desc = "Undo tree";
        };
      }

      # buffer control
      {
        action = ":BufferGoto 1<CR>";
        key = "<A-1>";
        mode = [ "n" ];
      }
      {
        action = ":BufferGoto 2<CR>";
        key = "<A-2>";
        mode = [ "n" ];
      }
      {
        action = ":BufferGoto 3<CR>";
        key = "<A-3>";
        mode = [ "n" ];
      }
      {
        action = ":BufferGoto 4<CR>";
        key = "<A-4>";
        mode = [ "n" ];
      }
      {
        action = ":BufferGoto 5<CR>";
        key = "<A-5>";
        mode = [ "n" ];
      }
      {
        action = ":BufferGoto 6<CR>";
        key = "<A-6>";
        mode = [ "n" ];
      }
      {
        action = ":BufferGoto 7<CR>";
        key = "<A-7>";
        mode = [ "n" ];
      }
      {
        action = ":BufferGoto 8<CR>";
        key = "<A-8>";
        mode = [ "n" ];
      }
      {
        action = ":BufferGoto 9<CR>";
        key = "<A-9>";
        mode = [ "n" ];
      }
      {
        action = ":BufferGoto 0<CR>";
        key = "<A-0>";
        mode = [ "n" ];
      }

      # vim maximizer
      {
        action = ":MaximizerToggle<CR>";
        key = "<leader>mt";
        mode = [ "n" ];
      }

      # FOR NEO TREE
      {
        action = ":Neotree left<CR>";
        key = "<leader>e";
        mode = [ "n" ];
      }
      {
        action = ":Neotree float<CR>";
        key = "<leader>ef";
        mode = [ "n" ];
      }
      {
        action = ":Neotree close<CR>";
        key = "<leader>ec";
        mode = [ "n" ];
      }
      {
        action = ":Neotree float git_status git_base=main<CR>";
        key = "<leader>ee";
        mode = [ "n" ];
      }

      # Terminal
      {
        action = ":terminal<CR>";
        key = "<leader>ot";
        mode = [ "n" ];
      }

      # Diagnostics
      {
        action = ":lua vim.diagnostic.open_float()<CR>";
        key = "<leader>ch";
        mode = [ "n" ];
        options = { desc = "Diagnostics"; };
      }

      # markdown preview mapping
      {
        action = ":MarkdownPreview<CR>";
        key = "<leader>pm";
        options = {
          silent = true;
          noremap = true;
          desc = "Open markdown preview in browser";
        };
      }
    ];
  };
}
